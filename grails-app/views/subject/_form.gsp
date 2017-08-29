<div class="form-group has-feedback required">
    <label class="control-label col-sm-2">Naziv kolegija:</label>
    <div class="col-sm-10">
        <input id="name" class="form-control" name="name" value="${subjectInstance?.name}" maxlength="" required>
        <i class="form-control-feedback"><i class="fa fa-pencil" ></i></i>
    </div>
</div><br>


<div class="form-group has-feedback">
    <label class="control-label col-sm-2">Broj ECTS bodova:</label>
    <div class="col-sm-10">
        <input class="form-control" name="ects" id="ects" value="${subjectInstance?.ects}">
        <i class="form-control-feedback"><i class="fa fa-pencil" ></i></i>
    </div>
</div><br>






<div class="details-title-scene addPointer" id="templatesClicker">Profesori</div>
<div id="templatesHolder">
    <div id="templateManaging" style="margin: 25px;">
        <div class="row">
            <label class="col-xs-5 manageTemplatesLabel" style="font-size: 18px;">Svi profesori</label>
            <label class="col-xs-offset-2 col-xs-5 manageTemplatesLabel" style="font-size: 18px;">Odabrani profesori</label>
        </div>

        <div class="row">
            <div class="col-xs-5">
                <g:select name="fromTemplates" from="${professorList}" id="search" class="form-control" size="20" multiple="multiple" optionKey="id"
                          optionValue= "${{it.firstName+' '+it.lastName}}">
                </g:select>
            </div>

            <div class="col-xs-2">
                <button type="button" id="search_rightAll" class="btn btn-block"><i class="glyphicon glyphicon-forward" style="color:#0983BF;"></i></button>
                <button type="button" id="search_rightSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right" style="color:#0983BF;"></i></button>
                <button type="button" id="search_leftSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left" style="color:#0983BF;"></i></button>
                <button type="button" id="search_leftAll" class="btn btn-block"><i class="glyphicon glyphicon-backward" style="color:#0983BF;"></i></button>
            </div>

            <div class="col-xs-5">
                <g:select name="toTemplates" from="${currentProfessorList}" id="search_to" class="form-control" size="20" multiple="multiple" optionKey="id"
                          optionValue="${{it.firstName+' '+it.lastName}}">
                </g:select>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#divClicker").click(function(){
        if($("#divClicker").hasClass("div_clicker_no_border_bot")){
            $("#divClicker").removeClass("div_clicker_no_border_bot");
            $("#divClicker").addClass("div_clicker_border_bot");
        }
        else{
            $("#divClicker").removeClass("div_clicker_border_bot");
            $("#divClicker").addClass("div_clicker_no_border_bot");
        }
        $("#permissionsHolder").slideToggle(200);
    });

    $("#templatesClicker").click(function(){
        $("#templatesHolder").slideToggle(200);
    });

    jQuery(document).ready(function($) {
        $('#search').multiselect({
            search: {
                left: '<input type="text" name="q" class="form-control" placeholder="Pretraži..." />',
                right: '<input type="text" name="q" class="form-control" placeholder="Pretraži..." />',
            }
        });
    });
</script>