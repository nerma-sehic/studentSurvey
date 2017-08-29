<div class="custom-table">
    <div class="row custom-table-header no-margin">
        <div class="col-md-2 col-xs-6 no-overflow col-sortable text-right">Redni broj</div>
        <div class="col-md-1 hidden-sm hidden-xs no-overflow"></div>
        <div class="col-md-9 col-xs-6 no-overflow">Pitanje</div>
    </div>
    <div class="custom-table-data">
        <g:each in="${questionList}" status="i" var="questionInstance">
            <div class="row custom-table-data-one-row no-margin">
                <div class="col-md-2 col-xs-6 no-overflow text-right">

                    %{--${questionInstance?.id}--}%

                    ${i+1}.

                    %{--<g:each var="number" in="${(1..questionList.size())}">--}%
                        %{--${number} <br/>--}%
                    %{--</g:each>--}%

                </div>

                <div class="col-md-1 hidden-sm hidden-xs no-overflow"> </div>
                <div class="col-md-9 col-xs-6 no-overflow">
                    <g:link action="show" id="${questionInstance?.id}" class="purple-color-text">${questionInstance?.questionText}</g:link>
                </div>

            </div>
        </g:each>
    </div>
</div>
%{--<div id="page-selection" class="span8 offset3" style="width:100%;">--}%
%{--<g:render template="/common/paginate"></g:render>--}%
%{--</div>--}%