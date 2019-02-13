<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitleFairlogin")}
    <#elseif section = "header">
        <img id="sso-logo-wrapper" src="${url.resourcesPath}/img/fairlogin_logo.png" class="img-responsive center-block" alt="fairlogin"></a></div>
    <#elseif section = "form">
        <form id="sso-totp-login-form" class="form totp ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <h4>${msg("loginOtpTitle")}</h4>
                    <p class="margin-default">${msg("loginOtpDescription")}</p>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input id="totp" name="totp" autocomplete="off" type="text" class="form-control ${properties.kcInputClass!}" autofocus />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} totp-button-container">
                <div id="sso-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="sso-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!} row">
                        <div class="col-xs-6 col-xs-push-6 col-sm-8 col-sm-push-4">
                            <input class="btn btn-primary btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="sso-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                        <div class="col-xs-6 col-xs-pull-6 col-sm-4 col-sm-pull-8">
                            <input class="btn btn-default btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" id="sso-cancel" type="submit" value="${msg("doCancel")}"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>