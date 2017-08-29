<br>
<div class="container">
    <div class="ht-menu-name-holder">
        <div class="ht-main-menu-name" id="ht-main-menu-name"></div>
        <div class="ht-submenu-name" id="ht-submenu-name"></div>
    </div>

    <div class="ht-main-menu-holder">
        <div class="ht-main-menu">
            <g:if test="${role?.authority == "SYSTEM_ADMIN"}">

                <div id="odsjek" class="ht-main-menu-field">
                    <g:link controller="department" action="list">Odsjek</g:link>
                </div>

                <div id="predmet" class="ht-main-menu-field">
                    <g:link controller="subject" action="list">Kolegij</g:link>
                </div>

                <div id="profesor" class="ht-main-menu-field">
                    <g:link controller="professor" action="list">Profesori</g:link>
                </div>

                <div id="pitanja" class="ht-main-menu-field">
                    <g:link controller="question" action="list">Pitanja</g:link>
                </div>
                <div id="odgovori" class="ht-main-menu-field">
                    <g:link controller="answer" action="list">Odgovori</g:link>
                </div>
            </g:if>

            <g:if test="${role?.authority == "SYSTEM_ADMIN" || role?.authority == "PROFESSOR"}">
                <div id="anketa" class="ht-main-menu-field">
                    <g:link controller="survey" action="list">Anketa</g:link>
                </div>
            </g:if>


            <g:if test="${role?.authority == "STUDENT"}">
                <div id="studentAnketa" class="ht-main-menu-field">
                    <g:link controller="survey" action="showSurvey">Student</g:link>
                </div>
            </g:if>

        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
       $(".ht-main-menu-name").click(function () {
           $(".ht-main-menu-holder").slideToggle(300);
           if($(".ht-submenu-holder").is(":visible"))$(".ht-submenu-holder").slideToggle(300);
       });
        $(".ht-submenu-name").click(function () {
            $(".ht-submenu-holder").slideToggle(300);
            if($(".ht-main-menu-holder").is(":visible"))$(".ht-main-menu-holder").slideToggle(300);
        });
        $(".ht-main-menu-name").html($(".ht-main-menu-field.active > a").html());
    });
</script>
<script type="text/javascript">
    $('.ht-main-menu-field.disabled a').removeAttr('href');
    $('.ht-main-menu-field.disabled a').css({"cursor": "not-allowed", "opacity": "0.7", "user-select": "none"});
</script>