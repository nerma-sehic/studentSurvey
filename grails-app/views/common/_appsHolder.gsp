<div class="apps-holder">

    <!-- new style for app-switcher links: use the entire space for a link (top level element) -->
    %{--<a href="/${appName}/router/switchApp/attend">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/attend') : ('/router/switchApp/attend')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Attend-icon.svg'}" />
            </div>

            <div class="app-text">Attend</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/screens">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/screens') : ('/router/switchApp/screens')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Screens-icon.svg'}"/>
            </div>

            <div class="app-text">Screens</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/tasks">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/tasks') : ('/router/switchApp/tasks')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Tasks-icon.svg'}"/>
            </div>

            <div class="app-text">Tasks</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/concierge">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/concierge') : ('/router/switchApp/concierge')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Concierge-icon.svg'}"/>
            </div>

            <div class="app-text">Concierge</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/exchange">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/exchange') : ('/router/switchApp/exchange')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Exchange-icon.svg'}"/>
            </div>

            <div class="app-text">Exchange</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/counters">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/counters') : ('/router/switchApp/counters')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Counters-icon.svg'}"/>
            </div>

            <div class="app-text">Counters</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/crm">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/crm') : ('/router/switchApp/crm')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/CRM-icon.svg'}"/>
            </div>

            <div class="app-text">CRM</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/blogs">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/blogs') : ('/router/switchApp/blogs')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Blogs-icon.svg'}"/>
            </div>

            <div class="app-text">Blogs</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/inventory">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/inventory') : ('/router/switchApp/inventory')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Inventory-icon.svg'}"/>
            </div>

            <div class="app-text">Inventory</div>
        </div>
    </a>
    %{--<a href="/${appName}/router/switchApp/expenses">--}%
    <a href="${appName ? ('/' + appName + '/router/switchApp/expenses') : ('/router/switchApp/expenses')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Expenses-icon.svg'}"/>
            </div>

            <div class="app-text">Expenses</div>
        </div>
    </a>
    <a href="${appName ? ('/' + appName + '/router/switchApp/management') : ('/router/switchApp/management')}">
        <div class="app-icon-holder text-center left-floated">
            <div class="app-icon">
                <img src="${webRequest.getBaseUrl() + '/assets/switch-apps/Management-icon.svg'}"/>
            </div>

            <div class="app-text">Management</div>
        </div>
    </a>
</div>