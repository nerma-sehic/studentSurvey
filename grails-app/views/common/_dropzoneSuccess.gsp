<div class="modal-background modal-30">
    %{--<g:form class="form-horizontal" method="POST" controller="${requestedController}" action="${requestedAction}" id="${entityId}">--}%
        <div class="contentHolder">
            <div class="details-title main-title">
                <i class="fa fa-check"></i>
                <span>&nbsp;&nbsp;Upload success!</span>
                <a class="htModalClose"></a>
            </div>
            <div class="details-content unselectable">
                <div class="form-group">
                    <label class="col-sm-12 ">Videos uploaded successfully!</label>
                    %{--<div class="col-sm-12" id="confirmationCode">--}%
                        %{--Videos uploaded successfully!--}%
                    %{--</div>--}%
                </div>
                %{--<div class="form-group required has-feedback">--}%
                    %{--<label class="col-sm-12 " for="confirmCode">Repeat code:</label>--}%
                    %{--<div class="col-sm-12">--}%
                        %{--<input class="form-control" name="confirmCode" id="confirmCode" type="text" pattern="" required/>--}%
                        %{--<i class="form-control-feedback"><i class="fa fa-lock"></i></i>--}%
                    %{--</div>--}%
                %{--</div>--}%
            </div>
            <div class="details-footer">
                <div class="row">
                    <div class="col-xs-12 no-padding">
                        %{--<div class="col-md-8 hidden-sm hidden-xs">&nbsp;</div>--}%
                        <div class="col-md-12 col-sm-12">
                            <a name="Cancel" id="cancelBtn" class="btn btn-purple" style="width:100%;">OK</a>
                        </div>
                        %{--<div class="col-xs-12 col-sm-12 hidden-md hidden-lg">&nbsp;</div>--}%
                        %{--<div class="col-md-12 col-sm-12">--}%
                            %{--<button type="submit" class="btn btn-delete" style="width:100%;">Delete</button>--}%
                        %{--</div>--}%
                    </div>
                </div>
            </div>
        </div>
    %{--</g:form>--}%
    <script>
        $(document).ready(function(){
//            var randomNumber = Math.floor( Math.random() * 900000 ) + 100000;
//            $("#confirmationCode").html(randomNumber);
//            $("#confirmCode").attr("pattern", randomNumber);
            $("#cancelBtn, .htModalClose").click(function(){
                $(".modal-background").remove();
                window.location.href = '<g:createLink controller="video" action="renderJobs"/>';

            });
            removePageScroll($(".modal-background"));
//            $("#confirmCode").focus();
        });
    </script>
</div>

