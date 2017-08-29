<div id="ErrorMessage">
    <g:if test="${flash.error}">
        <script>
            addResponseMessage({
                status: 1,
                message: "${raw(flash.error)}",
                timeout: 10000,
                dismiss: true,
                disableBody: false,
                small: true
            });
        </script>
        ${flash.error = null}
    </g:if>
    <g:if test="${flash.message}">
        <script>
            addResponseMessage({
                status: 0,
                message: "${raw(flash.message)}",
                timeout: 10000,
                dismiss: true,
                disableBody: false,
                small: true
            });
        </script>
        ${flash.message = null}
    </g:if>
    <g:if test="${flash.info}">
        <script>
            addResponseMessage({
                status: 3,
                message: "${raw(flash.info)}",
                timeout: 10000,
                dismiss: true,
                disableBody: false,
                small: true
            });
        </script>
        ${flash.info = null}
    </g:if>
    <g:if test="${flash.warning}">
        <script>
            addResponseMessage({
                status: 2,
                message: "${raw(flash.warning)}",
                timeout: 10000,
                dismiss: true,
                disableBody: false,
                small: true
            });
        </script>
        ${flash.warning = null}
    </g:if>
    <g:if test="${wellInfo}">
        <div class="well text-center">
            <h4>${raw(wellInfo)}</h4>
        </div>
    </g:if>
</div>
