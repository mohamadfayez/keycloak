<html class="login-pf" lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login to marketplace portal
  </title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>

<body id="keycloak-bg" class="" data-page-id="login-login-update-password">
  <div class="custom-login-page">
    <!-- Left image section -->
    <div class="custom-login-left">
      <img src="${url.resourcesPath}/img/login-illustration.png" alt="Welcome" />
    </div>
    <!-- Right login section -->
    <div class="custom-login-right">
      <div class="login-box">
        <header class="login-header">
          <h1>Update your Marketplace Portal account's Password</h1>
        </header>
        <#-- ERROR MESSAGE BLOCK -->
          <#if message?has_content>
            <div class="alert alert-text ${message.type}">
              <span>
                ${message.summary}
              </span>
            </div>
          </#if>
          <!-- template: login-update-password.ftl -->
          <form id="kc-passwd-update-form" action="${url.loginAction}" method="post" novalidate="novalidate">
            <div class="form-group">
              <label for="password-new">
                ${msg("passwordNew")}
              </label>
              <input id="password-new"
                name="password-new"
                type="password"
                autocomplete="password-new"
                required />
            </div>
            <div id="input-error-container-password-new">
            </div>
            <div class="form-group">
              <label for="password-confirm">
                ${msg("passwordConfirm")}
              </label>
              <input id="password-confirm"
                name="password-confirm"
                type="password"
                autocomplete="password-new"
                required />
            </div>
            <div id="input-error-container-password-confirm">
            </div>
            <div class="form-group">
              <div class="checklogin"><input class="checkbox-of-login" type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked="">
                <label for="logout-sessions">
                  Sign out from other devices
                </label>
              </div>
            </div>
            <div class="form-actions">
              <button id="kc-login" name="login" type="submit">
                Submit
              </button>
            </div>
          </form>
          <template id="errorTemplate">
            <div class="pf-v5-c-form__helper-text" aria-live="polite">
              <div class="pf-v5-c-helper-text pf-v5-u-display-flex pf-v5-u-justify-content-space-between">
                <div class="pf-v5-c-helper-text__item pf-m-error">
                  <ul class="pf-v5-c-helper-text__item-text pf-m-error kc-feedback-text">
                  </ul>
                </div>
              </div>
            </div>
          </template>
          <template id="errorItemTemplate">
            <li></li>
          </template>
          <script type="module">
          import {
            validatePassword
          } from "/resources/x2d11/login/keycloak.v2/js/password-policy.js";
          const activePolicies = [{
              name: "length",
              policy: {
                value: -1,
                error: "Invalid password: minimum length {0}."
              }
            },
            {
              name: "maxLength",
              policy: {
                value: -1,
                error: "Invalid password: maximum length {0}."
              }
            },
            {
              name: "lowerCase",
              policy: {
                value: -1,
                error: "Invalid password: must contain at least {0} lower case characters."
              }
            },
            {
              name: "upperCase",
              policy: {
                value: -1,
                error: "Invalid password: must contain at least {0} upper case characters."
              }
            },
            {
              name: "digits",
              policy: {
                value: -1,
                error: "Invalid password: must contain at least {0} numerical digits."
              }
            },
            {
              name: "specialChars",
              policy: {
                value: -1,
                error: "Invalid password: must contain at least {0} special characters."
              }
            }
          ].filter(p => p.policy.value !== -1);
          document.getElementById("password-new").addEventListener("change", (event) => {
            const errorContainer = document.getElementById("input-error-container-password-new");
            const template = document.querySelector("#errorTemplate").content.cloneNode(true);
            const errors = validatePassword(event.target.value, activePolicies);
            if (errors.length === 0) {
              errorContainer.replaceChildren();
              return;
            }
            const errorList = template.querySelector("ul");
            const htmlErrors = errors.forEach((e) => {
              const row = document.querySelector("#errorItemTemplate").content.cloneNode(true);
              const li = row.querySelector("li");
              li.textContent = e;
              errorList.appendChild(li);
            });
            errorContainer.replaceChildren(template);
          });
          </script>
          </main>
      </div>
    </div>
</body>

</html>