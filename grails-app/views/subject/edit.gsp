
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="container">
    <g:render template="/common/noSubMenu" model="${[menuId:'screensMain']}"/>
    <div style="padding-top: 25px;"></div>
    <g:render template="/common/ajaxError"/>
    <g:form method="post" class="form-horizontal" style="border-top: 0;">
        <div class="contentHolder no-menu-margin"  style="border-top: 0;">

            <div class="details-title main-title">Ažuriraj kolegij</div>
            <div class="details-content">
                <g:hiddenField name="id" value="${subject?.id}" />
                <g:render template="form" model="[subjectInstance: subject, professorList: professorList, currentProfessorList: currentProfessorList]"/>
            </div>
            <div class="details-footer">
                <div class="row">
                    <div class="col-md-offset-8 col-md-2 col-sm-12">
                        <g:link controller="subject " action="show" id="${subject.id}" class="btn btn-default">Odustani</g:link>
                    </div>
                    <div class=" col-md-2 col-sm-12">
                        <g:actionSubmit class="btn btn-purple" action="update" value="Ažuriraj"/>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
</div>


<script>

</script>
</body>
</html>