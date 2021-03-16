<#import "parts/common.ftlh" as c>

<@c.page>

<#--    <form method="get" action="/main" class="row g-3">-->

<#--        <div class="col-12">-->
<#--            <input class="mb-4" type="text" name="filter" value="${filter?ifExists}" placeholder="Search by tag">-->
<#--            <button type="submit" class="btn btn-primary">Search</button>-->
<#--        </div>-->

<#--    </form>-->

    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input class="form-control" type="text" name="filter" value="${filter?ifExists}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary mb-4">Search</button>
            </form>
        </div>
    </div>



    <a class="btn btn-primary mb-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new Message
    </a>
    <div class="collapse form-group" id="collapseExample">
        <form method="post" enctype="multipart/form-data">
            <input class="form-control mb-2" type="text" name="text" placeholder="Введите сообщение"/>
            <input class="form-control mb-2" type="text" name="tag" placeholder="Тэг"/>
            <input class="form-control mb-2" type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary">Добавить</button>
        </form>
    </div>


    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list messages as message>
            <div class="col">
                <div class="card">

                    <#if message.filename??>
                        <img class="card-img-top" src="/img/${message.filename}">
                    </#if>

                    <div class="m-2">
                        <span>${message.text}</span>
                        <i>${message.tag}</i>
                    </div>

                    <div class="card-footer text-muted">
                        ${message.authorName}
                    </div>

                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>

</@c.page>