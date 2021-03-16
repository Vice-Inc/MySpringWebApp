<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>

    <h3>Registration Page</h3>

    ${message?ifExists}

    <@l.login "/registration" true/>

</@c.page>