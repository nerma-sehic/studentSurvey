//TEXTAREA
$(document).ready(function () {
    $('textarea').keyup( function (){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
    });
});


//INPUT AUTO FOCUS
(function($){
    $.fn.focusTextToEnd = function(){
        this.focus();
        var $thisVal = this.val();
        this.val('').val($thisVal);
        return this;
    }
}(jQuery));

//SUBMENU ANIMATIONS

function bindSubmenuAnimations()
{
    if($(".active").hasClass("part-hidden-left"))
    {
        $(".part-hidden-left").removeClass("collapsed");
        $(".part-hidden-right").addClass("collapsed");
    }
    else if($(".active").hasClass("part-hidden-right"))
    {
        $(".part-hidden-right").removeClass("collapsed");
        $(".part-hidden-left").addClass("collapsed");
    }

    var timeoutId;
    $(".part-hidden-left").mouseenter(function() {
        timeoutId = setTimeout(function() {
            $(".part-hidden-left").removeClass("collapsed");
            $(".part-hidden-right").addClass("collapsed");
        }, 600);
    });
    $(".part-hidden-left").mouseleave(function() {
        clearTimeout(timeoutId)
    });
    $(".part-hidden-right").mouseenter(function() {
        timeoutId = setTimeout(function() {
            $(".part-hidden-right").removeClass("collapsed");
            $(".part-hidden-left").addClass("collapsed");
        }, 600);
    });
    $(".part-hidden-right").mouseleave(function() {
        clearTimeout(timeoutId)
    });
    $(".part-hidden-left").click(function () {

        $(".part-hidden-left").removeClass("collapsed");
        $(".part-hidden-right").addClass("collapsed");
    });
    $(".part-hidden-right").click(function () {
        $(".part-hidden-right").removeClass("collapsed");
        $(".part-hidden-left").addClass("collapsed");
    });
};


//MODAL

function removePageScroll(element)
{
    bindModal(element);
}

function bindModal(element)
{
    $("body").addClass("no-page-scroll");
    $(element).on("remove", function () {
        $("body").removeClass("no-page-scroll");
        $(document).off('keyup.modalClose');
    });

    $(document).on('keyup.modalClose', function(event) {
        if (event.which == 27) { // escape key maps to keycode `27`
            $('.modal-background').remove();
            $(document).off('keyup.modalClose');
        }
    });
}
//WAIT SPINNER
function addSpinner(element, oneLine)
{
    if(oneLine)
    {
        $(element).html(
            "<div id='noInfoDiv' class='well text-center' style='margin-top:20px;'> <h1> <i class='fa fa-spinner fa-pulse'></i> &nbsp;<span id='waitMessage'>Please wait</span></h1> </div>"
        );
    }
    else
    {
        $(element).html(
            "<div id='noInfoDiv' class='well text-center' style='margin-top:20px;'> <h1> <i class='fa fa-spinner fa-pulse'></i> </h1> <h2 id='waitMessage'>Please wait</h2> </div>"
        );
    }

}

function createErrorMessage(data)
{
    addResponseMessage({
        status: data.status,
        message: data.message,
        timeout: 10000,
        dismiss: true,
        disableBody: false,
        small: true
    });
}

var timeoutHandler;
function addResponseMessage(options)
{
    if($(".please-wait").length > 0)removeResponseMessage();

    var statusColors = ["success", "error", "warning", "info", "dark", "application"]
    var statusIcons = ["fa-check", "fa-exclamation-triangle", "fa-exclamation", "fa-info", "fa-spinner", ""]
    var defaultOptions = {
        status: 4,
        message: "Please wait",
        faAnimation: "fa-pulse",
        timeout: null,
        dismiss: false,
        disableBody: true,
        small: false
    }
    var dismissHTML = '<a class="userMessageClose" onclick="removeResponseMessage()"></a>';
    if(options)defaultOptions = options;

    var isSmall = defaultOptions.small ? "popup":"";

    if(!defaultOptions.dismiss)dismissHTML = "";
    var finalHTML = ' <div class="please-wait '+isSmall+'"><div class="please-wait-infobox '+statusColors[defaultOptions.status]+' '+isSmall+'"><i class="fa '+ statusIcons[defaultOptions.status] +' '+ defaultOptions.faAnimation +' "></i> &nbsp;<span class="waitMessage">'+ defaultOptions.message +'</span>'+dismissHTML + ' </div></div>'

    if(defaultOptions.disableBody)
        $("body").css("pointer-events","none");
    $("body").append(finalHTML)

    if(defaultOptions.timeout != null)
    {
        window.clearTimeout(timeoutHandler);
        timeoutHandler = setTimeout(function(){removeResponseMessage();}, defaultOptions.timeout)
        $(".please-wait").fadeTo( defaultOptions.timeout , 0);
    }
}
function removeResponseMessage()
{
    $(".please-wait").remove();
    $("body").css("pointer-events","all");
}



//NOTIFICATIONS

function initAppNotifications(serverUrl, loggedInUser, notificationId, timeout)
{
    $(".ht-header .options-container").prepend(
        '<div class="appNotification noNotifications no-selection" id="appNotification">'+
        '<span id="appNotificationNumber" data-count="-1"></span>'+
        '<i class="fa fa-bell-o"></i>'+
        '</div>'+
        '<div id="appNotificationHolder" class="appNotificationHolder" style="display: none" ></div>'+
        '<audio id="notificationAlert" src="'+serverUrl+'/assets/notification.mp3" type="audio/mp3"></audio>'
    );
    $("#appNotification").click(function(e){
        e.preventDefault();
        if($("#appNotificationHolder").css("display") == "none")
        {
            getAppNotifications(serverUrl, true, loggedInUser, notificationId);
            $(".appNotification").addClass("noNotifications");
        }
        $("#appNotificationHolder").toggle();
    });
    checkAppNotifications(serverUrl, loggedInUser, notificationId);
    setInterval(function(){
        checkAppNotifications(serverUrl,loggedInUser, notificationId);
    }, 30000);
}

function checkAppNotifications(serverUrl, loggedInUsername, notificationId)
{
    jQuery.ajax({
        type: "GET",
        dataType: "json",
        data:{username:loggedInUsername, notificationId:notificationId},
        url: serverUrl+'/notification/notificationCount',
        success: function (data) {
            var currentNotificationCount = parseInt($('#appNotificationNumber').attr("data-count"));
            var newNotificationCount = parseInt(data.notificationCount);
            if (data.status == 0) {
                if(newNotificationCount > 99)$('#appNotificationNumber').html("+99");
                else $('#appNotificationNumber').html(newNotificationCount);

                if(newNotificationCount > 0)$(".appNotification").removeClass("noNotifications");
                else $(".appNotification").addClass("noNotifications");

                if(currentNotificationCount < newNotificationCount)
                {
                    var markAllSeen = $("#appNotificationHolder").css("display") == "none" ? false:true;
                    if(currentNotificationCount > -1 && data.playNotificationSound)$('#notificationAlert')[0].play();
                    if(markAllSeen)$(".appNotification").addClass("noNotifications");
                    getAppNotifications(serverUrl, markAllSeen, loggedInUsername, notificationId);
                }
                $('#appNotificationNumber').attr("data-count", newNotificationCount);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("error notifications");
        }
    });
}
function getAppNotifications(serverUrl, markAllSeen, loggedInUsername, notificationId)
{
    jQuery.ajax({
        type: "GET",
        dataType: "html",
        data:{markAllSeen:markAllSeen,username:loggedInUsername, notificationId:notificationId},
        url: serverUrl+'/notification/notificationSummary',
        success: function (data) {
            if (data != null) {
                $('#appNotificationHolder').html(data);
            }
            if(markAllSeen == true)
            {
                $('#appNotificationNumber').attr("data-count", 0);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    });
}
function setNotificationVisited(id, serverUrl, loggedInUsername)
{
    jQuery.ajax({
        type: "GET",
        dataType: "json",
        data:{id:id, username:loggedInUsername},
        url: serverUrl+'/notification/ajaxSetNotificationVisited',
        success: function (data) {
            if(data.status == 0)
            {
                $("#notification"+id).removeClass($("#notification"+id).data("appnameclass"));
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    });
}

function setBodyCooldown(timeout)
{
    $("body").addClass("noActions");
    setTimeout(function(){
        $("body").removeClass("noActions");
    },timeout);
}
function disablePage()
{
    $("body").addClass("noActions");
}
function enablePage()
{
    $("body").removeClass("noActions");
}

function toggleCopyWindow(text)
{
    window.prompt("Copy to clipboard: Ctrl+C, Enter", text);
}

function toggleFullScreen(element)
{
    if (element.requestFullscreen) {
        element.requestFullscreen();
    } else if (element.msRequestFullscreen) {
        element.msRequestFullscreen();
    } else if (element.mozRequestFullScreen) {
        element.mozRequestFullScreen();
    } else if (element.webkitRequestFullscreen) {
        element.webkitRequestFullscreen();
    }
}