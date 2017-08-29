<%@ page import="studentSurvey.LoginController" contentType="text/html;charset=UTF-8" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'login_v001.css')}" type="text/css">
    <g:javascript library="javascripts" />
    %{--<script type="text/javascript" src="/javascripts/loginpass.js"></script>--}%
    <title></title>
</head>

<body>

<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<div class="logo"></div>
<div class="login-block">
    <g:render template="/common/ajaxError"/>
    <g:form action="saveAuth">
        <h1>Prijava</h1>
        <br>
        <input type="text" value="" placeholder="Username" id="username" name="username" />
        <input type="password" value="" placeholder="Password" id="password" name="password"/>
        %{--<button>Potvrdi</button>--}%
        <g:submitButton name="potvrdi" value="Potvrdi"/>
    </g:form>

</div>
</body>
</html>