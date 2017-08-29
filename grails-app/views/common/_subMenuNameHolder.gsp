<%@ page import="com.manas.sso.*" %>
<%@ page import="com.manas.screens.*" %>

<g:if test="${Constants.getActivePageClass('video', controllerName)}">	
	<div class="hidden-lg hidden-md hidden-sm pull-left">      
       	<span id="sub-page-name-holder" class="sub-page-name-holder" >
			<g:if test="${Constants.getActivePageClass('list', actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Video list
           	</g:if>
            <g:if test="${Constants.getActivePageClass('selectTemplate', actionName)}">
                <i class="fa fa-angle-right"></i> &nbsp; Create video
            </g:if>
           	<g:if test="${Constants.getActivePageClass('upload', actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Upload video(s)
           	</g:if>
           	<g:if test="${Constants.getActivePageClass('renderJobs',actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Render queue
           	</g:if>
           	<g:if test="${Constants.getActivePageClass('selectTemplate',actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Select template
           	</g:if>
           	<g:if test="${Constants.getActivePageClass('fillForms',actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Enter additional info
           	</g:if>
           	<g:if test="${Constants.getActivePageClass('showJob',actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Show render job
           	</g:if>
		</span>
	</div>
</g:if>
%{--<g:if test="${Constants.getActivePageClass('liveFeed', controllerName)}">	--}%
	%{--<div class="hidden-lg hidden-md hidden-sm pull-left">      --}%
       	%{--<span id="sub-page-name-holder" class="sub-page-name-holder" >--}%
			%{--<g:if test="${Constants.getActivePageClass('list',actionName)}">--}%
           		%{--<i class="fa fa-angle-right"></i> &nbsp; Live feeds--}%
           	%{--</g:if>--}%
           	%{--<g:if test="${Constants.getActivePageClass('show',actionName)}">--}%
           		%{--<i class="fa fa-angle-right"></i> &nbsp; Show live feeds--}%
           	%{--</g:if>--}%
           	%{--<g:if test="${Constants.getActivePageClass('create',actionName)}">--}%
           		%{--<i class="fa fa-angle-right"></i> &nbsp; Create live feed--}%
           	%{--</g:if>--}%
           	%{--<g:if test="${Constants.getActivePageClass('sendFeed',actionName)}">--}%
           		%{--<i class="fa fa-angle-right"></i> &nbsp; Send live feed--}%
           	%{--</g:if>--}%
		%{--</span>--}%
	%{--</div>--}%
%{--</g:if>--}%

%{--
<g:if test="${Constants.getActivePageClass('report', controllerName)}">
	<div class="hidden-lg hidden-md hidden-sm pull-left">      
       	<span id="sub-page-name-holder" class="sub-page-name-holder" >
			<g:if test="${Constants.getActivePageClass('deviceStatus',actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Screen status
           	</g:if>
           	<g:if test="${Constants.getActivePageClass('timeline',actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; Timeline
           	</g:if>
           	<g:if test="${Constants.getActivePageClass('userActivity',actionName)}">
           		<i class="fa fa-angle-right"></i> &nbsp; User activity
           	</g:if>
		</span>
	</div>
</g:if>
--}%
