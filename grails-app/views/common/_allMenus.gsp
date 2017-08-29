<%@ page import="com.manas.sso.*" %>
<%@ page import="com.manas.screens.*" %>
<secured:ifAllowed roles="${Constants.ROLE_APPLICATION_ADMIN}">
<div class="container">
    <div class="col-lg-12">
        <div class="row" style="text-align:center;position:relative;">

            <!-- Icon for collapsed navbar -->
            <button type="button" class="navbar-toggle pull-left no-padding no-margin" id="mainMenuButton">
                <div style="display:inline-block">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
                </div>
            </button>
            <!-- Main page name holder -->
            <div class="hidden-lg hidden-md hidden-sm pull-left">
	            <span id="main-page-name-holder" class="main-page-name-holder">
                	<g:if test="${Constants.getActivePageClass('video', controllerName)}">
                		Videos
                	</g:if>
                	<g:if test="${Constants.getActivePageClass('liveFeed', controllerName)}">
                		Live feeds
                	</g:if>
                	<g:if test="${Constants.getActivePageClass('device',controllerName)}">
                		Screens
                	</g:if>
                	<g:if test="${Constants.getActivePageClass('deviceGroup',controllerName)}">
                		Groups
                	</g:if>
                	<g:if test="${Constants.getActivePageClass('playlist',controllerName)}">
                		Playlists
                	</g:if>
                	<g:if test="${Constants.getActivePageClass('report',controllerName)}">
                		Reports
                	</g:if>
				</span>
			</div>
			<!-- Submenu page name holders -->
			<g:render template="/common/subMenuNameHolder"></g:render>
		</div>
	</div>	

	<!-- Main menu -->
	<div class="col-lg-12">
		<div class="row">
            <div class="collapse navbar-collapse no-padding" id="ht-nav-collapsed" style="display:none;">
                <ul class="nav nav-pills nav-justified ht-pills" style="width:100%">
              		<secured:ifAllowed roles="${Constants.ROLE_APPLICATION_ADMIN}">
              			<li class="${Constants.getActivePageClass('video', controllerName) + Constants.getActivePageClass('liveFeed', controllerName)}">
                   			<g:link controller="video" action="list"><div >Videos</div></g:link>
                   		</li>
	                    <li class="${Constants.getActivePageClass('device',controllerName)}">
	                        <g:link controller="device" action="index"><div >Screens</div></g:link>
	                    </li>
	                    <li class="${Constants.getActivePageClass('deviceGroup',controllerName)}">
	                        <g:link controller="deviceGroup" action="index"><div >Groups</div></g:link>
	                    </li>
	                    <li class="${Constants.getActivePageClass('playlist',controllerName)}">
	                        <g:link controller="playlist" action="index"><div >Playlists</div></g:link>
	                    </li>
	                    <li class="${Constants.getActivePageClass('report',controllerName)}">
	                        <g:link controller="report" action="index"><div >Reports</div></g:link>
	                    </li>
                    </secured:ifAllowed>
                </ul>
            </div>   
        </div>
        <script>
			$(".disabled").removeAttr("href");
		</script>
    </div>
    <!-- All sub menus -->
    <div class="col-lg-12 ">
		<div class="row">
		    <g:if test="${Constants.getActivePageClass('video',controllerName) + Constants.getActivePageClass('liveFeed',controllerName)}">	
			    <g:render template="/video/videoSubMenu"></g:render>
		    </g:if>
		</div>
    </div>
</div>


<script>
	function ToggleMainMenu(){
		if($('#ht-subnav-collapsed').css('display') == 'block')
		{        
            $('#ht-subnav-collapsed').slideUp(300);
        }
       
        if($('#ht-nav-collapsed').css('display') == 'block')
        {
            $('#ht-nav-collapsed').slideUp(300);
            setTimeout(function(){$('#ht-nav-collapsed').removeClass('in');console.log("jjj");},300);
        }
        else if($('#ht-nav-collapsed').css('display') == 'none')
        {
        	$('#ht-nav-collapsed').addClass('in');
            $('#ht-nav-collapsed').slideToggle(300);           
        }
    }

    $('#sub-page-name-holder').click(function(){

		if($('#ht-nav-collapsed').css('display') == 'block'){
            
            $('#ht-nav-collapsed').slideUp(300);
        }
       
        if($('#ht-subnav-collapsed').css('display') == 'block'){
            
            $('#ht-subnav-collapsed').slideUp(300);
        }
        else if($('#ht-subnav-collapsed').css('display') == 'none'){
            $('#ht-subnav-collapsed').slideToggle(300);
        }
   	});

    $('#main-page-name-holder').click(function(){
    	ToggleMainMenu();		
    });
    $('#mainMenuButton').click(function(){
    	ToggleMainMenu();		
    });
</script>
</secured:ifAllowed>