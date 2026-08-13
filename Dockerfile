FROM quay.io/keycloak/keycloak:26.7.1 as builder

WORKDIR /opt/keycloak
COPY providers-1.0.0.jar /opt/keycloak/providers
# Download and add the Oracle JDBC Driver
ADD --chmod=644 https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc11/23.3.0.23.09/ojdbc11-23.3.0.23.09.jar /opt/keycloak/providers/

COPY truststore.jks /opt/keycloak/conf/truststore.jks
COPY application.keystore /opt/keycloak/conf/application.keystore
COPY cache-ispn-keycloak.xml /opt/keycloak/conf/cache-ispn-keycloak.xml

COPY my-theme /opt/keycloak/themes/my-theme/

#RUN /opt/keycloak/bin/kc.sh build --features=parameterized-scopes
RUN /opt/keycloak/bin/kc.sh build --features="parameterized-scopes" --db=oracle  --spi-x509cert-lookup-provider=apache --cache-config-file=cache-ispn-keycloak.xml

FROM quay.io/keycloak/keycloak:26.7.1
COPY --from=builder /opt/keycloak/ /opt/keycloak/

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



# ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", \
#   "--https-key-store-file", "/opt/keycloak/conf/application.keystore", \
#   "--https-key-store-password=password", \
#   "--https-trust-store-file", "/opt/keycloak/conf/truststore.jks", \
#   "--https-trust-store-password=password"]

# docker build -t quay.io/aelfax/apim-keycloak:v26.7.1 .
# docker push quay.io/aelfax/apim-keycloak:v26.7.1
