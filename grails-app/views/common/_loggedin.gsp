<%@ page import="com.manas.sso.Constants" %>

<div class="loggedInContainer">
    <div class="loggedInMenu">
        <div class="loggedIn-username hidden-sm hidden-xs">
            <secured:loggedInUserName/>
        </div>

        <div class="switchApps">
            <div class="col-sm-1 col-offset-xs-4 col-xs-4 no-padding">
                <div class="relative-position">
                    <img class="icon-app-switcher" src="${assetPath(src: 'switch-apps/icon-app-switch.png')}" alt=""/>

                    <div class="switch-apps-popup">
                        <div class="app-switcher-pointer"></div>

                        <div class="allApps">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="logout-menu no-padding">
        <button class="btn btn-default dropdown-menu-button topklasa"></button>
    </div>
</div>

<div id="userDropdownMenu" class="right-floated">
    <div class="userDropdownMenu-username hidden-lg hidden-md">
        <secured:loggedInUserName/>
    </div>

    <form name="accountSettings" method="POST" action="${com.manas.sso.Constants.getServerURL(session)}/user/showUserInfo">
        <button type="submit" class="userDropdownMenu-option-lastOne">Account Settings</button>
    </form>

    <form name="logout" method="POST" action="${createLink(controller: 'logout', action: 'index')}">
        <button type="submit" class="userDropdownMenu-option-lastOne">Logout</button>
    </form>

</div>

<script type="application/javascript">
    $(document).ready(function () {
        jQuery.ajax({
            type: "GET",
            dataType: "html",
            data: {appName: 'expenses'},
            url: "${com.manas.sso.Constants.getServerURL(session)+'/app/appsHTML'}",
            success: function (data) {
                if (data != null) {
                    $('.allApps').html(data);
                } else {
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            }
        });
    });
    //SWITCH APPS menu
    $('.icon-app-switcher').click(function (e) {
        e.preventDefault();
        $('.switch-apps-popup').toggle();
    });

    // SWITCH USER menu
    $('.topklasa').click(function (e) {
        e.preventDefault();
        $("#userDropdownMenu").toggle();
        $("#changePasswordForm").hide();
    });

    // close menu popups if click happened outside
    $(document).click(function (e) {
        if (!$(e.target).closest('.switch-apps-popup').is(':visible') && !$(e.target).hasClass('icon-app-switcher')) {
            $('.switch-apps-popup').hide();
        }
        if (!$(e.target).closest('#userDropdownMenu').is(':visible') && !$(e.target).hasClass('topklasa')) {
            $("#userDropdownMenu").hide();
            //$("#changePasswordForm").hide();
        }
    });
</script>