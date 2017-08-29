<div class="custom-table">
    <div class="row custom-table-header no-margin">
        <div class="col-md-5 col-xs-6 no-overflow col-sortable text-right">Ime i Prezime</div>
        <div class="col-md-1 hidden-sm hidden-xs no-overflow"></div>
        <div class="col-md-6 col-xs-6 no-overflow">e-Mail</div>
    </div>
    <div class="custom-table-data">
        <g:each in="${professorList}" status="i" var="profInstance">
            <div class="row custom-table-data-one-row no-margin">
                <div class="col-md-5 col-xs-6 no-overflow text-right">
                    <g:link action="show" id="${profInstance?.id}" class="purple-color-text">${profInstance?.firstName} ${profInstance?.lastName}</g:link>
                </div>

                <div class="col-md-1 hidden-sm hidden-xs no-overflow"> </div>
                <div class="col-md-6 col-xs-6 no-overflow">${profInstance?.eMail}</div>

            </div>
        </g:each>
    </div>
</div>
%{--<div id="page-selection" class="span8 offset3" style="width:100%;">--}%
    %{--<g:render template="/common/paginate"></g:render>--}%
%{--</div>--}%