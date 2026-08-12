<html class="login-pf" lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign in to Marketplace portal</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>

<body id="keycloak-bg" data-page-id="login-login-otp">
  <div class="custom-login-page">
    <!-- Left image section -->
    <div class="custom-login-left">
      <img src="${url.resourcesPath}/img/login-illustration.png" alt="Welcome" />
    </div>
    <!-- Right login section -->
    <div class="custom-login-right">
      <div class="login-box">
        <header class="login-header">
          <h1>Sign in to your Marketplace Portal account</h1>
        </header>
        <#-- ERROR MESSAGE BLOCK -->
          <#if message?has_content>
            <div class="alert alert-text ${message.type}">
              <span>
                ${message.summary}
              </span>
            </div>
          </#if>
          <div id="input-error-container-username"></div>
          <!-- template: login-otp.ftl -->
          <form id="kc-otp-login-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <div class="form-group">
              <label for="username">
                ${msg("usernameOrEmail")}
              </label>
              <input id="username"
                name="username"
                type="text"
                autocomplete="username"
                value="${(login.username!'')}"
                readonly />
            </div>
            <input id="selectedCredentialId" type="hidden" name="selectedCredentialId" value="${otpLogin.selectedCredentialId!''}">
            <div class="form-group">
              <label for="otp">One-time code</label>
              <input id="otp" name="otp" value="" type="text" autocomplete="one-time-code" autofocus aria-invalid="">
            </div>
            <div id="input-error-container-otp"></div>
            <div class="form-actions">
              <button id="kc-login" name="login" type="submit">
                ${msg("doLogIn")}
              </button>
            </div>
          </form>
      </div>
    </div>
  </div>
  <script>
  function toggleOTP(index, value) {
    // Set selected credential ID
    document.getElementById("selectedCredentialId").value = value;
    // Clear previous selection
    Array.from(document.getElementsByClassName("pf-m-selected")).forEach(el =>
      el.classList.remove("pf-m-selected")
    );
    // Set new selection
    document.getElementById("kc-otp-credential-" + index).classList.add("pf-m-selected");
  }
  </script>
</body>

</html>