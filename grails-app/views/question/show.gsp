
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

        <div class="details-title">Pitanje</div>
        <div class="details-content">

            <div class="form-group row">
                <label class="control-label col-md-2 text-right">Pitanje:</label>
                <div class="col-md-10">${questionInstance?.questionText}</div>
            </div>


        </div>
        <div class="details-footer">
            <div class="row">
                <div class="col-md-offset-8 col-md-2 col-sm-12">
                    <g:link action="edit" id="${questionInstance?.id}" class="btn btn-default">Ažuriraj</g:link>
                </div>
                <div class="col-md-2 col-sm-12">
                    <g:form>
                        <g:hiddenField name="id" value="${questionInstance?.id}" />
                        <a class="btn btn-delete" onclick="loadDeleteModal(${questionInstance?.id},'${questionInstance?.questionText}','question','delete')" >Izbriši</a>
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
                controllerName: "question",
                actionName: "delete"
            },
            url: "${g.createLink(controller: 'question', action:'ajaxDeleteModal')}",
            success:function(data){
                $("body").append(data);
            }
        })
    }
</script>

</body>
</html>