<#import "parts/common.ftlh" as c>

<@c.page>
    <h3>${username}</h3>

    <form method="post">

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${email}">
        </div>

        <button type="submit" class="btn btn-primary">Save account</button>

    </form>

</@c.page>