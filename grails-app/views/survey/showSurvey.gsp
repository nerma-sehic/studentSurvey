<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>
<body>
<div class="container">

    <g:render template="/common/noSubMenu" model="${[menuId:'screensMain']}"/>
    <div class="row create_button_holder_no_submenu">
    </div>
    <g:render template="/common/ajaxError"/>

    <div class="row no-margin" id="groupInfo"> <!-- container za page content -->
        <g:form class="" action="saveSurveyResults">
            <div id="listTableDiv">

            </div>
            <br><br>
            <div class="col-sm-offset-10 col-sm-2" style="padding: 0;">
                <g:submitButton class="btn-danger" style="width:100%;" name="submitSurvey" value="Potvrdi"/>
            </div>

        </g:form>

    </div>
    <script>
        $(document).ready(function(){
            $("#survey").addClass('active');
            loadSurveyTable();
        });

        function loadSurveyTable(){
            jQuery.ajax({
                type: 'POST',
                dataType: 'html',
                url: "${g.createLink(controller: 'survey', action: 'ajaxLoadSurveyTable')}",
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