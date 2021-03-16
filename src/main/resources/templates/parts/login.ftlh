<#macro login path button_text>
    <form action="${path}" method="post">
    <div><label> User Name : <input type="text" name="username"/> </label></div>
    <div><label> Password: <input type="password" name="password"/> </label></div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input type="submit" value="${button_text}"/></div>
</form>
</#macro>

<#macro new_login path isRegisterForm>
    <form  action="${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Username">
        </div>
        <#if isRegisterForm>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
        </div>
        </#if>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        </div>

        <#if isRegisterForm>
            <button type="submit" class="btn btn-primary">Create account</button>
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