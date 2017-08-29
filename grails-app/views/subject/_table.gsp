<div class="custom-table">
    <div class="row custom-table-header no-margin">
        <div class="col-md-3 col-xs-6 no-overflow  text-right">ECTS</div>
        <div class="col-md-1 hidden-sm hidden-xs no-overflow"></div>
        <div class="col-md-8 col-xs-6 no-overflow col-sortable">Naziv kolegija</div>
    </div>
    <div class="custom-table-data">
        <g:each in="${subjectList}" status="i" var="subjectInstance">
            <div class="row custom-table-data-one-row no-margin">
                <div class="col-md-3 col-xs-6 no-overflow text-right">${subjectInstance?.ects}</div>

                <div class="col-md-1 hidden-sm hidden-xs no-overflow"> </div>
                <div class="col-md-8 col-xs-6 no-overflow">
                    <g:link action="show" id="${subjectInstance?.id}" class="purple-color-text">${subjectInstance?.name}</g:link>
                </div>
            </div>
        </g:each>
    </div>
</div>
%{--<div id="page-selection" class="span8 offset3" style="width:100%;">--}%
%{--<g:render template="/common/paginate"></g:render>--}%
%{--</div>--}%