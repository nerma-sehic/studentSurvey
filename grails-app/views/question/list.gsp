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
            <g:link controller="question" action="create" class="btn btn-default create_button_link">Dodaj novo pitanje&nbsp;&nbsp;<i class="fa fa-plus addNew"></i></g:link>
        </div>
    </div>
    <g:render template="/common/ajaxError"/>

    <div class="row no-margin" id="groupInfo"> <!-- container za page content -->
        <div id="listTableDiv">

        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("#pitanja").addClass('active');
            loadQuestionTable();
        });

        function loadQuestionTable(){
            jQuery.ajax({
                type: 'POST',
                dataType: 'html',
                url: "${g.createLink(controller: 'question', action: 'ajaxLoadQuestionTable')}",
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