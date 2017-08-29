<div class="custom-table">
    <div class="row custom-table-header no-margin">
        <div class="col-md-5 col-xs-6 no-overflow col-sortable text-center">Mogući odgovori</div>
        <div class="col-md-7 col-xs-6 no-overflow text-left">
            <div class="col-md-offset-8 col-md-2 col-sm-12 text-center">Ažuriraj</div>
            <div class="col-md-2 col-sm-12 text-center">Briši</div>
        </div>

    </div>
    <div class="custom-table-data">
        <g:each in="${answerList}" status="i" var="answerInstance">
            <div class="row custom-table-data-one-row no-margin">
                <div class="col-md-5 col-xs-6 no-overflow text-center">
                    %{--<g:link action="show" id="${answerInstance?.id}" class="purple-color-text">${answerInstance?.comment} ${answerInstance?.value}</g:link>--}%
                    ${answerInstance?.comment}
                </div>

                <div class="col-md-7 col-xs-6 no-overflow text-left">
                    <div class="col-md-offset-8 col-md-2 col-sm-12 text-center">
                        <g:link action="edit" id="${answerInstance?.id}">
                            <i class="fa fa-pencil-square-o" style="font-size:20px;color:#5077bd;"></i>
                        </g:link>
                    </div>
                    <div class="col-md-2 col-sm-12 text-center">
                        <a onclick="loadDeleteModal(${answerInstance?.id},'${answerInstance?.value}','${answerInstance?.comment}','department','delete')" >
                            <i class="fa fa-trash" style="font-size:20px;color:#5077bd;"></i>
                        </a>
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
                            controllerName: "answer",
                            actionName: "delete"
                        },
                        url: "${g.createLink(controller: 'answer', action:'ajaxDeleteModal')}",
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