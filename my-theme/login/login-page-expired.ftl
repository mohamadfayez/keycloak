<!DOCTYPE html>
<html class="" lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login to marketplace portal
  </title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>

<body class="" data-page-id="login-login-page-expired">
  <div class="">
    <div class="custom-login-error-page">
      <div class="login-error-box">
        <header class="login-error-header">
          <h1>Error logging into Marketplace Portal account</h1>
          <h1 id="kc-page-title"> ${msg("pageExpiredTitle")}
            <#-- <p class="instruction">An error occurred, please login again through your application.</p> -->
        </header>
        <p id="instruction1" class="instruction">
          ${msg("pageExpiredMsg1")}
          <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">
            ${msg("doClickHere")}
          </a> .<br />
          ${msg("pageExpiredMsg2")}
          <a id="loginContinueLink" href="${url.loginAction}">
            ${msg("doClickHere")}
          </a> .
        </p>
      </div>
    </div>
    <div class="">
      <header class="">
        <h1 id="kc-page-title">
        </h1>
      </header>
      <div id="kc-content">
        <div id="kc-content-wrapper">
        </div>
      </div>
    </div>
  </div>
</body>

</html>