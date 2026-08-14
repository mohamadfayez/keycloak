# =========================
# Builder
# =========================
FROM quay.io/keycloak/keycloak:26.7.1 as builder

WORKDIR /opt/keycloak

# Custom provider
COPY providers-1.2.0.jar /opt/keycloak/providers/
COPY truststore.jks /opt/keycloak/conf/truststore.jks
COPY application.keystore /opt/keycloak/conf/application.keystore

# Cache configuration
COPY cache-ispn-keycloak.xml /opt/keycloak/conf/cache-ispn-keycloak.xml

# Theme
COPY my-theme /opt/keycloak/themes/my-theme/

# Build optimized for Oracle Database vendor specs
RUN /opt/keycloak/bin/kc.sh build \
    --features="parameterized-scopes" \
    --db=oracle \
    --spi-x509cert-lookup-provider=apache \
    --cache-config-file=cache-ispn-keycloak.xml

# =========================
# Runtime
# =========================
FROM quay.io/keycloak/keycloak:26.7.1

COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Admin user credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", \
  "--https-key-store-file=/opt/keycloak/conf/application.keystore", \
  "--https-key-store-password=password", \
  "--https-trust-store-file=/opt/keycloak/conf/truststore.jks", \
  "--https-trust-store-password=password", \
  "--spi-connections-jpa-legacy-migration-strategy=update", \
  "--spi-x509cert-lookup-apache-ssl-client-cert=SSL_CLIENT_CERT", \
  "--spi-x509cert-lookup-apache-ssl-cert-chain-prefix=CERT_CHAIN", \
  "--spi-x509cert-lookup-apache-certificate-chain-length=10", \
  "--hostname-strict=false"]
