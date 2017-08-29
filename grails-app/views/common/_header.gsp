<div class="header" style="padding-left:0;padding-right:0;">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-4 col-sm-4 col-xs-8 pull-left">
                <div class="logo">
                    <img src="${assetPath(src: apptype.appLogo().toString())}"/>
                    <h5 class="logo-title"><em>Screens</em></h5>
                </div>
            </div>

            <!-- render logged in menu if authenticated -->
            <div class="col-md-4 col-sm-2 col-xs-4 loggedIn-userinfo pull-right">
                <secured:ifLoggedIn>
                    <g:render template="/common/loggedin"/>
                </secured:ifLoggedIn>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12 searchWrapper pull-left">
                <select id="e1" style="width: 100%">
                </select>
            </div>
        </div>
    </div>
</div>

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
        placeholder: "Search videos, device groups, devices and playlists",
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
</script>