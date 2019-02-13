<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<!DOCTYPE html>
<html>
    <section class="hero is-success is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey">Login</h3>
                    <p class="subtitle has-text-grey">Please login to proceed.</p>
                    <div class="box">
                        <figure class="avatar">
                            <img src="${url.resourcesPath}/img/mecas_1.png">
                        </figure>
                        <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                          <div class="field">
                            <div class="control">
                              <input id="username" class="input is-normal" placeholder="${msg("username")}" type="text" name="username">
                            </div>
                          </div>
                          <div class="field">
                            <div class="control">
                              <input id="password" class="input is-normal" placeholder="${msg("password")}" type="password" name="password">                              
                            </div>
                          </div>
                          <button class="button is-block is-info is-normal is-fullwidth" value="${msg("doLogIn")}">Login</button>
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
</html>
</@layout.registrationLayout>