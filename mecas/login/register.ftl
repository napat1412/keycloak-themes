<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerTitleFairlogin")}
    <#elseif section = "header">
        <div id="sso-logo"><img id="sso-logo-wrapper" src="${url.resourcesPath}/img/logo.png" class="img-responsive center-block" alt="site logo"></a></div>
    <#elseif section = "form">
        <form id="sso-register-form" class="register form ${properties.kcFormClass!}" action="${url.registrationAction}" method="post" onSubmit="return checkAnswer()">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">

          <#if !realm.registrationEmailAsUsername>
            <div class="register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" class="form-control ${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" required/>
                </div>
            </div>
          </#if>
            <div class="form-group required register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!} control-label">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="form-control ${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" required/>
                </div>
            </div>

            <div class="form-group required register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!} control-label">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="form-control ${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" required/>
                </div>
            </div>

            <div class="form-group register-field ${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.mobile" class="${properties.kcLabelClass!}">${msg("mobileNumber")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="form-control ${properties.kcInputClass!}" id="user.attributes.mobile" name="user.attributes.mobile"/>
                </div>
            </div>

            <div class="form-group required register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!} control-label">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="email" id="email" class="form-control ${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" required/>
                </div>
            </div>

            <#if passwordRequired>
            <div id="formGroupPassword" class="form-group required register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!} control-label">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password" class="form-control ${properties.kcInputClass!}" onchange="isValidPassword(this.value)" onfocus="removeErrorMessage('formGroupPassword')" name="password" required/>
                </div>
                <span class="help-block">${msg("errorNotValidPassword")}</span>
            </div>

            <div id="formGroupPasswordConfirm" class="form-group required register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!} control-label">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" class="form-control ${properties.kcInputClass!}" name="password-confirm" onchange="isSamePassword(this.value)" onfocus="removeErrorMessage('formGroupPasswordConfirm')" required/>
                </div>
                <span class="help-block">${msg("errorNotSamePassword")}</span>
            </div>
            </#if>

            
            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>
            <div class="terms">
            </div>
            <div class="${properties.kcFormGroupClass!} register-button-container">
                <div class="row">
                    <div id="sso-form-options" class="col-xs-5 ${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span>
                                <a class="btn btn-default btn-flat btn-block" href="${url.loginUrl}"><i class="fa fa-caret-left"></i>&nbsp;&nbsp;${msg("backToLogin")}</a>
                            </span>
                        </div>
                    </div>

                    <div id="sso-form-buttons" class="col-xs-7 ${properties.kcFormButtonsClass!}">
                        <input class="btn btn-primary btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>