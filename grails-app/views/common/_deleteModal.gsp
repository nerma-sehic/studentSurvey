<div class="modal-background modal-30">
    <g:form class="form-horizontal" method="POST" controller="${requestedController}" action="${requestedAction}" id="${entityId}">
        <div class="contentHolder">
            <div class="details-title main-title">
                <i class="fa fa-trash-o"></i>
                <span>&nbsp;&nbsp;Izbrisati&nbsp;${entityName} ?</span>
                <a class="htModalClose"></a>
            </div>
            <div class="details-content unselectable">
                <div class="form-group">
                    <label class="col-sm-12 " for="confirmCode">Confirmation code:</label>
                    <div class="col-sm-12" id="confirmationCode">

                    </div>
                </div>
                <div class="form-group required has-feedback">
                    <label class="col-sm-12 " for="confirmCode">Repeat code:</label>
                    <div class="col-sm-12">
                        <input class="form-control" name="confirmCode" id="confirmCode" type="text" pattern="" required/>
                        <i class="form-control-feedback"><i class="fa fa-lock"></i></i>
                    </div>
                </div>
            </div>
            <div class="details-footer">
                <div class="row">
                    <div class="col-xs-12 no-padding">
                        <div class="col-md-8 hidden-sm hidden-xs">&nbsp;</div>
                        <div class="col-md-6 col-sm-12">
                            <a name="Cancel" id="cancelBtn" class="btn btn-default" style="width:100%;">Odustani</a>
                        </div>
                        <div class="col-xs-12 col-sm-12 hidden-md hidden-lg">&nbsp;</div>
                        <div class="col-md-6 col-sm-12">
                            <button type="submit" class="btn btn-delete" style="width:100%;">Izbriši</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
    <script>
        $(document).ready(function(){
            var randomNumber = Math.floor(Math.random() * 900000) + 100000;
            $("#confirmationCode").html(randomNumber);
            $("#confirmCode").attr("pattern", randomNumber);
            $("#cancelBtn, .htModalClose").click(function(){
                $(".modal-background").remove();
            });
            removePageScroll($(".modal-background"));
            $("#confirmCode").focus();
        });
    </script>
</div>

