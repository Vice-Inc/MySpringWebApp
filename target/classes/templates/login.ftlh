<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <h3>Login Page</h3>

    ${message?ifExists}

    <@l.new_login "/login" false/>

    <a href="/registration" class="btn mt-1 btn-primary">Registration</a>

<#--    <a href="/registration">Registration</a>-->
</@c.page>