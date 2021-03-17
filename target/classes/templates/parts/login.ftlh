<#macro login path isRegisterForm>
    <form  action="${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   id="username" name="username" placeholder="Username"
                    value="<#if user??>${user.username}</#if>">
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>

        <#if isRegisterForm>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                   id="email" name="email" placeholder="Email"
                   value="<#if user??>${user.email}</#if>">
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </div>
        </#if>

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   id="password" name="password" placeholder="Password">
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>

        <#if isRegisterForm>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                       id="password" name="password2" placeholder="Retype password">
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
        </#if>

        <#if isRegisterForm>

            <div class="mt-4 mb-4">
                <div class="g-recaptcha" data-sitekey="6Lc5CIMaAAAAAOF2VjxfRivcUuH9mr7h2TTla_BH"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>

            <button type="submit" class="btn btn-primary mb-5">Create account</button>
        </#if>

        <#if !isRegisterForm>
            <button type="submit" class="btn btn-primary">Sign In</button>
        </#if>

    </form>
</#macro>

<#macro logout>
    <div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary">Sign Out</button>
        </form>
    </div>
</#macro>