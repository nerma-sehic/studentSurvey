<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>
<body>

<div id="wrapper">

    <div class="main-navigation">
        <g:render template="/common/mainMenu" model="[role:role]"/>
    </div>

    <div class="container">

        <g:render template="/common/noSubMenu" model="${[menuId:'screensMain']}"/>
        <div class="row create_button_holder_no_submenu">
        </div>
        <g:render template="/common/ajaxError"/>

        <div class="row no-margin" id="groupInfo"> <!-- container za page content -->
            <g:form class="" action="createSurvey">

                <g:hiddenField name="professorID" id="professorID" value="${professor.id}"/>
                <h2>${professor?.firstName}&nbsp;${professor?.lastName}</h2>

                <br><br>

                <div class="form-group has-feedback">
                    <h3> <label class="control-label col-sm-2">Kolegij:</label> </h3>
                    <div class="col-sm-10">
                        <g:select class="form-control" optionKey="id" optionValue="name" name="selectSubject" id="selectSubject" from="${subjectList}"
                                  value="${-1}" noSelection="${['-1': 'Odaberi kolegij']}">
                        </g:select>
                        <i class="form-control-feedback"><i class="fa fa-chevron-down" ></i></i>
                    </div>

                </div><br>

                <br><br>

                <div class="form-group">
                    <h3> <label class="control-label col-sm-2">Lozinka: </label> </h3>
                    <div class="col-sm-10">
                        <g:textArea class="form-control textareaFixedWidth" id="passwordSurvey" name="passwordSurvey" value=""/>
                    </div>
                </div>

            %{--</g:select>--}%
                <br><br>

                <g:submitButton class="btn btn-purple" style="width:100%;margin-top: 50px;" name="submitSurvey" value="Potvrdi"/>

            </g:form>

        </div>
        <script>
            $(document).ready(function(){
                $("#survey").addClass('active');

            });
        </script>
    </div>
</div>
</br>


</body>
</html>