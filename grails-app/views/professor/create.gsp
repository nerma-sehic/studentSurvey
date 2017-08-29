<%@ page import="studentSurvey.Professor" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <%@ page contentType="text/html;charset=UTF-8" %>
</head>

<body>
<div class="container">

    <g:render template="/common/noSubMenu" model="${[menuId:'screensMain']}"/>
    <div style="padding-top: 25px;"></div>
    <g:render template="/common/ajaxError"/>

    <g:form action="save" controller="professor" class="form-horizontal">
        <div class="contentHolder no-menu-margin">
            <div class="details-title main-title">Dodaj novog profesora</div>
            <div class="details-content">
                <g:render template="form" model="[profInstance: new Professor(params),
                                                  subjectList: subjectList,
                                                  currentSubjectsList: currentSubjectsList]"/>
            </div>
            <div class="details-footer">
                <div class="row">
                    <div class="col-md-offset-10 col-md-2 col-sm-12">
                        <g:submitButton name="create" class="btn btn-purple" value="Dodaj" />
                    </div>
                </div>
            </div>
        </div>
    </g:form>

</div>

</body>
</html>