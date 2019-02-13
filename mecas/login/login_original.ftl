<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitleFairlogin")}
    <#elseif section = "header">
				<div class="title">
            <div id="sso-logo"><img id="sso-logo-wrapper" src="${url.resourcesPath}/img/logo.png" class="img-responsive center-block" alt="single-sign on: login"></a></div>
        </div>
    <#elseif section = "form">
        <#if realm.password>
            <form id="sso-form-login" class="form ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="username-container ${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">
												<#if !realm.loginWithEmailAllowed>
													${msg("username")}
												<#elseif !realm.registrationEmailAsUsername>
													${msg("usernameOrEmail")}
												<#else>
													${msg("email")}</#if></label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <#if usernameEditDisabled??>
                            <input id="username" class="form-control ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                        <#else>
                            <input id="username" class="form-control ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                        </#if>
                    </div>
                </div>
                <div class="password-container ${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                        <input id="password" class="form-control ${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                    </div>
                </div>
                <div class="forgot-password-wrapper">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <#if realm.resetPasswordAllowed>
                            <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                        </#if>
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!} row">
                    <div id="sso-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="col-xs-7">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="checkbox remember-me-checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked>&nbsp;&nbsp;${msg("rememberMe")}
                                        <#else>
                                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3">&nbsp;&nbsp;${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                        </div>
                        <div id="sso-form-buttons" class="col-xs-5 ${properties.kcFormButtonsClass!}">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <input class="btn btn-primary btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="sso-login" type="submit" value="${msg("doLogIn")}"/>
                            </div>
                            <div class="clearfix"></div>
                        </div> 
                    </div>
                    <#if (realm.password && realm.registrationAllowed && !usernameEditDisabled??) || realm.resetPasswordAllowed>
                        <div>
                            <div class="col-xs-12">
                                <hr class="separator" />
                            </div>
                        </div>
                        <div>
                            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                <div id="sso-registration">
                                    <div  class="register-font-size">
                                        <div class="col-xs-7">
                                            <p>${msg("noFairloginId")}</p>
                                        </div>
                                        <div class="col-xs-5">
                                            <a href="${url.registrationUrl}" class="btn btn-primary btn-flat btn-register">${msg("getFairloginId")}</a>
                                        </div>
                                    </div>
                                    <div class="register-social-wrapper">
                                        <div class="col-xs-12">
                                            <p>${msg("getFairloginIdIdpDescription")}</p>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </div>
                    </#if>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && social.providers??>
             <div id="sso-social-providers">
                <div style="margin-top: 10px">
                    <#list social.providers as p>
                        <#if p.providerId == "saml" || p.providerId == "oidc" || p.providerId == "keycloak-oidc">
                        <a href="${p.loginUrl}" id="zocial-${p.alias}" class="btn btn-block btn-social btn-${p.providerId}" style="margin-bottom: 5px">
                            <i class="fa fa-${p.providerId}"></i> Sign in with ${p.displayName}
                        </a>
                        </#if>
                    </#list>
                </div>
            </div>
        </#if>
        <#if realm.password && social.providers??>
            <div id="sso-social-providers">
                <a href="#demo" class="btn btn-primary btn-flat margin-top collapsed" data-toggle="collapse" aria-expanded="false">More Social Identity Providers</a>
                <div style="margin-top: 20px" id="demo" class="collapse">
                    <#list social.providers as p>
                        <#if p.providerId != "saml" && p.providerId != "oidc" && p.providerId != "keycloak-oidc">
                            <a href="${p.loginUrl}" id="zocial-${p.alias}" class="btn btn-block btn-social btn-${p.providerId}" style="margin-bottom: 5px">
                                <i class="fa fa-${p.providerId}"></i> Sign in with ${p.displayName}
                            </a>
                        </#if>
                    </#list>
                </div>
            </div>
        </#if>
    </#if>
    <#--    -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - MECAs</title>
</head>
<body>
    <section class="hero is-success is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey">Login</h3>
                    <p class="subtitle has-text-grey">Please login to proceed.</p>
                    <div class="box">
                        <figure class="avatar">
                            <img src="https://placehold.it/128x128">
                        </figure>
                        <form>
                            <div class="field">
                                <div class="control">
                                    <input class="input is-normal" type="email" placeholder="Your Email" autofocus="" class="form-control ${properties.kcInputClass!}" name="username">
                                </div>
                            </div>

                            <div class="field">
                                <div class="control">
                                    <input class="input is-normal" type="password" placeholder="Your Password" class="form-control ${properties.kcInputClass!}" name="password">
                                </div>
                            </div>
                            <div class="field">
                                <label class="checkbox">
                  <input type="checkbox">
                  Remember me
                </label>
                            </div>
                            <button class="button is-block is-info is-normal is-fullwidth ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="sso-login" >Login</button>
                        </form>
                    </div>
                    <p class="has-text-grey">
                        <a href="../">Sign Up</a> &nbsp;·&nbsp;
                        <a href="../">Forgot Password</a> &nbsp;·&nbsp;
                        <a href="../">Need Help?</a>
                    </p>
                </div>
            </div>
        </div>
    </section>
    <script async type="text/javascript" src="../js/bulma.js"></script>
</body>
</html>
</@layout.registrationLayout>