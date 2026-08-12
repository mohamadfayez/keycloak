<html class="" lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign in to Marketplace portal</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>

<body class="" data-page-id="login-error">
  <div class="custom-login-error-page">
    <div class="login-error-box">
      <header class="login-error-header">
        <h1>Error logging into Marketplace Portal account</h1>
        <h1 id="kc-page-title"> We are sorry..
        </h1>
        <#--  <p class="instruction">An error occurred, please login again through your application.</p>  -->
      </header>
      <#-- ERROR MESSAGE BLOCK -->
        <#if message?has_content>
          <div class="error-msg-login alert ${message.type}">
            <span>
              ${message.summary}
            </span>
          </div>
          <#if skipLink??>
            <#else>
                <#if client?? && client.baseUrl?has_content>
                    <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                </#if>
            </#if>
        </#if>
    </div>
  </div>
</body>

</html>