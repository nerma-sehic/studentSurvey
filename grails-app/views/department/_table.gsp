<div class="custom-table">
    <div class="row custom-table-header no-margin">
        <div class="col-md-3 col-xs-3 no-overflow col-sortable text-left">Odsjek</div>
        <div class="col-md-7 col-xs-7 no-overflow col-sortable text-left">Pročelnik</div>
        <div class="col-md-1 col-xs-1 no-overflow text-left">Ažuriraj</div>
        <div class="col-md-1 col-xs-1 hidden-xs no-overflow text-left">Briši</div>

    </div>
    <div class="custom-table-data">
        <g:each in="${departmentList}" status="i" var="departmentInstance">
            <div class="row custom-table-data-one-row no-margin">
                <div class="col-md-3 col-xs-3 no-overflow text-left">
                    ${departmentInstance?.depName}
                </div>

                <div class="col-md-7 col-xs-7 no-overflow text-left">
                    ${departmentInstance?.head}
                </div>

                <div class="col-md-1 col-xs-1 no-overflow text-left">
                    <g:link action="edit" id="${departmentInstance?.id}">

                        <i class="fa fa-pencil-square-o" style="font-size:20px;color:#5077bd;"></i>
                    </g:link>
                </div>
                <div class="col-md-1 col-xs-1 no-overflow text-left">
                    <a onclick="loadDeleteModal(${departmentInstance?.id},'${departmentInstance?.depName}','department','delete')" >
                        <i class="fa fa-trash" style="font-size:20px;color:#5077bd;"></i>
                    </a>
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
                            controllerName: "department",
                            actionName: "delete"
                        },
                        url: "${g.createLink(controller: 'department', action:'ajaxDeleteModal')}",
                        success:function(data){
                            $("body").append(data);
                        }
                    })
                }
            </script>





        </g:each>
    </div>
</div>
%{--<div id="page-selection" class="span8 offset3" style="width:100%;">--}%
%{--<g:render template="/common/paginate"></g:render>--}%
%{--</div>--}%