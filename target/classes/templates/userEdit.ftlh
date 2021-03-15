<#import "parts/common.ftlh" as c>

<@c.page>

    <h3>User Editor</h3>

    <form action="/user" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="hidden" name="userId" value="${user.id}"/>

        <input type="text" name="username" value="${user.username}">

        <#list roles as role>
            <div>
                <lable>
                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                    ${role}
                </lable>
            </div>
        </#list>

        <button type="submit">Save</button>
    </form>

</@c.page>