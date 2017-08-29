<%@ page import="com.manas.sso.UserLoginData; com.manas.sso.SecurityUtil; com.manas.sso.Constants" %>
<%@ page import="com.manas.sso.User" %>
<%@ page import="com.dbtouch.cloud.*" contentType="text/html;charset=UTF-8" %>
<div class="ht-header-container">
    <div class="container ht-header">
        <div class="${controllerName == "login" ? "ht-header-logo-container-login":"ht-header-logo-container"}">
            %{--<img class="logo-img hidden-xs" src="${assetPath(src: apptype.appLogo().toString())}">--}%
            <img class="logo-img hidden-lg hidden-md  hidden-sm" src="${assetPath(src: "icon-left.svg")}">
        </div>
        <secured:ifLoggedIn>
            <div class="ht-header-actions-container">
                <div class="search-container">
                    <select id="e1" style="width: 100%" disabled></select>
                </div>
                <div class="options-container relative-position">

                    <div title="Show apps" class="menu-icon-container disabled" >
                        <img class="icon-app-switcher" src="${assetPath(src: 'switch-apps/icon-app-switch.png')}" alt="" id="switchAppButton"/>
                        <div class="switch-apps-popup relative-position">
                            <div class="arrow"></div>
                            <div class="allApps">
                                %{--<g:render template="/common/appsHolder" model="${[appName:Constants.getApp(session).appName.toLowerCase()]}"></g:render>--}%
                            </div>
                        </div>
                    </div>
                    <div title="User actions" class="profile-picture-container addPointer" id="profilePictureContainer">
                        <div class="profile-bubble noActions ${Constants.getApp(session).appName.toLowerCase()}">
                            <img class="profile-picture noActions" src="${SecurityUtil.getProfilePicture()}" onerror='this.style.display = "none"'/>
                            ${SecurityUtil.getProfilePicture(true) ?: "?"}
                        </div>
                    </div>

                    <div id="userDropdownMenu" class="user-dropdown-menu">
                        <div class="arrow"></div>
                        <div class="user-dropdown-option user-dropdown-title">
                            <secured:loggedInUserName/>
                        </div>
                        <form class="user-dropdown-option" name="accountSettings" method="POST" action="${Constants.getServerURL(session)}/user/showUserInfo">
                            <button type="submit" class="btn btn-default">Account Settings</button>
                        </form>
                        <form class="user-dropdown-option" name="logout" method="POST" action="${createLink(controller: 'logout', action: 'index')}">
                            <button type="submit" class="btn btn-purple">Logout</button>
                        </form>

                    </div>

                </div>
            </div>
        </secured:ifLoggedIn>
    </div>
</div>
<secured:ifLoggedIn>
    <script>
        $(document).ready(function(){
            initAppNotifications("${Constants.getServerURL(session)}", "${UserLoginData?.getUserLoginData()?.username}", "${UserLoginData?.getUserLoginData()?.encoded_username}", 30000);
        });
    </script>
</secured:ifLoggedIn>


<script type="text/javascript">

    function formatResult(item) {
        if (!item.id) {
            return '<b>' + item.text + '</b>';
        }
        return '<div style="padding-left: 5px">' + item.text + '</div>';
    }

    function formatSelection(item) {
        if (!item.id) {
            return item.text;
        }
        return '<b>' + item.text + '</b>';
    }
    $("#e1").select2({
//        placeholder: "Search",
        ajax: {
            url: '${createLink(controller: "device", action: "search")}',
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    query: params.term // search term
                    //page: params.page
                };
            },
            processResults: function (data, page) {
                // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data
                return {
                    results: data
                };
            },
            cache: false
        },
        escapeMarkup: function (markup) {
            return markup;
        }, // let our custom formatter work
        minimumInputLength: 2,
        templateResult: formatResult,
        templateSelection: formatSelection
    });
    $("#e1").on("select2:selecting", function (e) {
//        console.log("select2:selecting");
        e.preventDefault();
        if (!e) {
            var args = "{}";
        } else {
            var url = e.params.args.data.url
            if (url) {
                window.location.href = url;
            }
        }
    });
    $("#e1").on("select2:open", function () {
//        console.log("select2:open");
        $(".options-container").addClass("mobile_header_focus");
        $(".ht-header-actions-container").addClass("mobile_header_focus");
    });

    $("#e1").on("select2:close", function () {
//        console.log("select2:close");
        $(".mobile_header_focus").removeClass("mobile_header_focus");
    });

    $("#e1").click(function(e){
        $(e.currentTarget).prev('select').data('select2').$dropdown.find('.select2-search__field').focus();
    });

    $(document).ready(function () {
        jQuery.ajax({
            type: "GET",
            dataType: "html",
            data: {
                appName: "${Constants.getApp(session).appName.toLowerCase()}",
                appId: "${Constants.getApp(session).id}",
                username: "${com.manas.sso.UserLoginData?.getUserLoginData()?.username}"
            },
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
    $('#switchAppButton').click(function (e) {
        e.preventDefault();
        $('.switch-apps-popup').toggle();
    });

    // SWITCH USER menu
    $('#profilePictureContainer').click(function (e) {
        e.preventDefault();
        $("#userDropdownMenu").toggle();
//        $("#changePasswordForm").hide();
    });

    // close menu popups if click happened outside
    $(document).click(function (e) {
        if (!$(e.target).closest('.switch-apps-popup').is(':visible') && !$(e.target).hasClass('icon-app-switcher')) {
            $('.switch-apps-popup').hide();
        }
        if (!$(e.target).closest('#userDropdownMenu').is(':visible') && !$(e.target).hasClass('profile-picture-container')) {
            $("#userDropdownMenu").hide();
            //$("#changePasswordForm").hide();
        }
        if (!$(e.target).closest('#appNotificationHolder').is(':visible') && !$(e.target).closest("#appNotification").hasClass('appNotification')) {
            $("#appNotificationHolder").hide();
            //$("#changePasswordForm").hide();
        }
    });

</script>
<secured:ifLoggedIn>
    <script>
        $(".menu-icon-container").removeClass("disabled");
        $("#e1").removeAttr("disabled")
    </script>
</secured:ifLoggedIn>