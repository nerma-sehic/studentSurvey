
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

    <div class="contentHolder no-menu-margin">

        <div class="details-title">Detalji o kolegiju</div>
        <div class="details-content">

            <div class="form-group row">
                <label class="control-label col-md-5 text-right">Naziv</label>
                <div class="col-md-7">${subjectInstance?.name}</div>
            </div>

            <div class="form-group row">
                <label class="control-label col-md-5 text-right">Broj ECTS bodova:</label>
                <div class="col-md-7">${subjectInstance?.ects}</div>
            </div>


            <br><br>

            <div class="form-group row">
                <label class="control-label col-md-5 text-right">Profesori:</label>
               <div class="col-md-7">
                   <g:each in="${currentProfessorList}" var="p">
                       ${p?.firstName}&nbsp;${p?.lastName}<br><br>
                   </g:each>

               </div>
            </div>


        </div>
        <div class="details-footer">
            <div class="row">
                <div class="col-md-offset-8 col-md-2 col-sm-12">
                    <g:link action="edit" id="${subjectInstance?.id}" class="btn btn-default">Ažuriraj</g:link>
                </div>
                <div class="col-md-2 col-sm-12">
                    <g:form>
                        <g:hiddenField name="id" value="${subjectInstance?.id}" />
                        <a class="btn btn-delete" onclick="loadDeleteModal(${subjectInstance?.id},'${subjectInstance?.name}','subject','delete')" >Izbriši</a>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function loadDeleteModal(id, name)
    {
        $.ajax({
            dataType:"html",
            data:{
                id: id,
                entityName: name,
                controllerName: "subject",
                actionName: "delete"
            },
            url: "${g.createLink(controller: 'subject', action:'ajaxDeleteModal')}",
            success:function(data){
                $("body").append(data);
            }
        })
    }
</script>

</body>
</html>