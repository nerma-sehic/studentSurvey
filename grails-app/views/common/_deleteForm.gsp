<%@ page import="com.manas.sso.Constants" %>
<%@ page import="com.manas.sso.*" contentType="text/html;charset=UTF-8" %>
<%@ page import="com.manas.screens.*" contentType="text/html;charset=UTF-8" %>

<div class="modal fade" id="deleteModal" style="display:none;" >
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="deleteForm" method="post">
            <div class="modal-header" id="mHeader">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Delete</h4>
            </div>
            <div class="modal-body" id="mBody">
            </div>
            <div class="modal-footer" id="mFooter">
                <div class="row center-block">
                    <div class="col-md-6 hidden-xs no-padding">
                    </div>
                    <div class="col-md-3 col-xs-12 " style="padding:2px;">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="width:100%;">Close</button>
                    </div>
                    <div class="col-md-3 col-xs-12 " style="padding:2px;">
                        <!--<a id="deleteBtn" class="btn btn-purple" href="" style="width:100%;">Delete</a>-->
                        <g:submitButton id="deleteBtn" name="delete" class="btn btn-purple" style="width:100%;" value="Delete"/>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>

<script>
    function toggleDeleteModal(id, name, controllerName, actionName){
            console.log("Delete");
            var title = "Delete <b>" + name + "</b>. Are you sure?";
            var randomNumber = Math.floor( Math.random() * 900000 ) + 100000;
            var message = '<div class="row">  ' +
                    '<div class="col-md-12"> ' +
                    '<p>Type this code to confirm delete: <span id="random-code-delete-blog">' + randomNumber + '</span></p>' +
                    '<form class="form-horizontal"> ' +
                    '<div class="form-group"> ' +
                    '<label class="col-md-4 control-label" for="name">Confirmation Code</label> ' +
                    '<div class="col-md-4"> ' +
                    '<input id="confirmationCodeDelete" name="confirmationCodeDelete" type="text" placeholder="Confirmation Code" class="form-control input-md" maxlength="6" pattern="'+randomNumber+'" required="true"> ' +
                    '</div> ' +
                    '</div> ' +
                    '</div> ' +
                    '</form> </div>  </div>';
            $("#mBody").html(message);
            $("#mHeader").html(title);
            $("#deleteForm").prop("action", '${Constants.getIdentifier()}/'+controllerName+"/"+actionName+"/"+id);
            $("#deleteModal").modal('show');
    };
</script>