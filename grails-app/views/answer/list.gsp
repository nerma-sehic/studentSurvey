<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>
<body>
<div class="container">

    <g:render template="/common/noSubMenu" model="${[menuId:'screensMain']}"/>
    <div class="row create_button_holder_no_submenu">
        <div class="col-md-2 col-xs-12 no-padding">
            <g:link controller="answer" action="create" class="btn btn-default create_button_link">Dodaj novi odgovor&nbsp;&nbsp;<i class="fa fa-plus addNew"></i></g:link>
        </div>
    </div>
    <g:render template="/common/ajaxError"/>

    <div class="row no-margin" id="groupInfo"> <!-- container za page content -->
        <div id="listTableDiv">

        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("#odgovori").addClass('active');
            loadAnswerTable();
        });

        function loadAnswerTable(){
            jQuery.ajax({
                type: 'POST',
                dataType: 'html',
                url: "${g.createLink(controller: 'answer', action: 'ajaxLoadAnswerTable')}",
                success: function(data){
                    $('#listTableDiv').empty();
                    $('#listTableDiv').html(data);
                },
                error: function(XMLHttpRequest,textStatus,errorThrown){alert('textStatus: ' + textStatus + '  errorThrown: ' + errorThrown)}
            });
        }

    </script>

</div>

</body>
</html>