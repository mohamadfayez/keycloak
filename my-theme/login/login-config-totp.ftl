<html class="login-pf" lang="en">

<head>

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in to Marketplace portal</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
  </head>

<body id="keycloak-bg" class="" data-page-id="login-login-config-totp">
  <div class="custom-login-page">
    <!-- Left image section -->
    <div class="custom-login-left">
      <img src="${url.resourcesPath}/img/login-illustration.png" alt="Welcome" />
    </div>
    <div class="custom-login-right">
      <div class="login-box">
        <header class="login-header">
          <h1>Marketplace Portal Mobile Authenticator Setup</h1>
          <p>
        </header>
        <#-- ERROR MESSAGE BLOCK -->
          <#if message?has_content>
            <div class="alert-text alert ${message.type}">
              <span>
                ${message.summary}
              </span>
            </div>
          </#if>
          
          <!-- template: login-config-totp.ftl -->
          <ol id="kc-totp-settings">
            <li>
              <p>Install one of the following applications on your mobile:</p>
              <ul id="kc-totp-supported-apps">
                <li>FreeOTP</li>
                <li>Google Authenticator</li>
                <li>Microsoft Authenticator</li>
              </ul>
            </li>
            <li>
              <p>Open the application and scan the barcode:</p>
              <p>
                ${msg("loginTotpStep2")}
              </p>
              <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br />
              <p><a href="${totp.manualUrl}" id="mode-manual">
                  ${msg("loginTotpUnableToScan")}
                </a></p>
            </li>
            <li>
              <p>Enter the one-time code provided by the application and click Submit to finish the setup.</p>
              <p>Provide a Device Name to help you manage your OTP devices.</p>
            </li>
          </ol>
          <form action="${url.loginAction}" id="kc-totp-settings-form" method="post" novalidate="novalidate">
            <div class="form-group"><label for="totp">
                ${msg("authenticatorCode")}
              </label>
              <input id="totp"
                name="totp"
                type="text"
                autocomplete="off"
                required=""
                aria-invalid="" />
              <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
            </div>
            <div class="form-group"><label for="userLabel">
                ${msg("loginTotpDeviceName")}
              </label>
              <input type="text" id="userLabel" name="userLabel" autocomplete="off"
                aria-invalid="" />
            </div>
            <div class="form-group">
              <div class="checklogin"><input class="checkbox-of-login" type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked="">
                <label for="logout-sessions">
                  Sign out from other devices
                </label>
              </div>
            </div>
            <div class="form-actions">
              <button id="saveTOTPBtn" name="saveTOTPBtn" value="Submit" type="submit">Submit</button>
            </div>
      </div>
      </form>
    </div>
  </div>
</body>

</html>