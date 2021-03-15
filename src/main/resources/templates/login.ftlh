<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <h3>Login Page</h3>

    <@l.login "/login" "Sign In"/>

    <a href="/registration">Registration</a>
</@c.page>