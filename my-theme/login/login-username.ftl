<!DOCTYPE html>
<html class="" lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login to marketplace portal
  </title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>

<body class="" data-page-id="login-login-username">
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
          <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <div class="form-group">
              <label for="username">
                ${msg("usernameOrEmail")}
              </label>
              <input id="username"
                tabindex="1"
                name="username"
                type="text"
                autocomplete="username"
                value="${(login.username!'')}"
                required
                autofocus="" autocomplete="username" dir="ltr" />
            </div>
            <div class=" ">
              <div id="kc-form-options">
              </div>
            </div>
            <div class="form-actions">
              <button tabindex="4" id="kc-login" name="login" type="submit">
                ${msg("doLogIn")}
              </button>
            </div>
          </form>
      </div>
    </div>
  </div>
</body>

</html>