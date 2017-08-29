%{--<%----}%
  %{--Created by IntelliJ IDEA.--}%
  %{--User: Mensur--}%
  %{--Date: 5.8.2017.--}%
  %{--Time: 20:10--}%
%{----%>--}%

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--<html>--}%
%{--<head>--}%
    %{--<meta name="layout" content="main">--}%
%{--</head>--}%

%{--<body>--}%

%{--<div class="container">--}%
    %{--<g:render template="/common/noSubMenu" model="${[menuId:'screensMain']}"/>--}%
    %{--<div style="padding-top: 25px;"></div>--}%
    %{--<g:render template="/common/ajaxError"/>--}%

    %{--<div class="contentHolder no-menu-margin">--}%

        %{--<div class="details-title">Detalji o odgovorima</div>--}%
        %{--<div class="details-content">--}%

            %{--<div class="form-group row">--}%
                %{--<label class="control-label col-md-5 text-right">Ime:</label>--}%
                %{--<div class="col-md-7">${professorInstance?.firstName}</div>--}%
            %{--</div>--}%

            %{--<div class="form-group row">--}%
                %{--<label class="control-label col-md-5 text-right">Prezime:</label>--}%
                %{--<div class="col-md-7">${professorInstance?.lastName}</div>--}%
            %{--</div>--}%

            %{--<div class="form-group row">--}%
                %{--<label class="control-label col-md-5 text-right">e-Mail:</label>--}%
                %{--<div class="col-md-7">${professorInstance?.eMail}</div>--}%
            %{--</div>--}%

            %{--<div class="form-group row">--}%
                %{--<label class="control-label col-md-5 text-right">Adresa:</label>--}%
                %{--<div class="col-md-7">${professorInstance?.address}</div>--}%
            %{--</div>--}%

            %{--<div class="form-group row">--}%
                %{--<label class="control-label col-md-5 text-right">Broj mobitela:</label>--}%
                %{--<div class="col-md-7">${professorInstance?.cellPhone}</div>--}%
            %{--</div>--}%

            %{--<div class="form-group row">--}%
                %{--<label class="control-label col-md-5 text-right">Datum rođenja:</label>--}%
                %{--<div class="col-md-7">${professorInstance?.birthday}</div>--}%
            %{--</div>--}%

            %{--<br><br>--}%

            %{--<div class="form-group row">--}%
            %{--<label class="control-label col-md-5 text-right">Kolegiji:</label>--}%
            %{--<div class="col-md-7">${professorInstance?.birthday}</div>--}%
            %{--</div>--}%





        %{--</div>--}%
        %{--<div class="details-footer">--}%
            %{--<div class="row">--}%
                %{--<div class="col-md-offset-8 col-md-2 col-sm-12">--}%
                    %{--<g:link action="edit" id="${professorInstance?.id}" class="btn btn-default">Ažuriraj</g:link>--}%
                %{--</div>--}%
                %{--<div class="col-md-2 col-sm-12">--}%
                    %{--<g:form>--}%
                        %{--<g:hiddenField name="id" value="${professorInstance?.id}" />--}%
                        %{--<a class="btn btn-delete" onclick="loadDeleteModal(${professorInstance?.id},'${professorInstance?.firstName}','professor','delete')" >Izbriši</a>--}%
                    %{--</g:form>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</div>--}%
%{--<script>--}%
    %{--function loadDeleteModal(id, name)--}%
    %{--{--}%
        %{--$.ajax({--}%
            %{--dataType:"html",--}%
            %{--data:{--}%
                %{--id: id,--}%
                %{--entityName: name,--}%
                %{--controllerName: "professor",--}%
                %{--actionName: "delete"--}%
            %{--},--}%
            %{--url: "${g.createLink(controller: 'professor', action:'ajaxDeleteModal')}",--}%
            %{--success:function(data){--}%
                %{--$("body").append(data);--}%
            %{--}--}%
        %{--})--}%
    %{--}--}%
%{--</script>--}%

%{--</body>--}%
%{--</html>--}%