<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Head Page</title>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/hintui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/hintstyle.css">
</head>
<body>
<div class="container-fluid" style="background-color: forestgreen;height: 110px">
    <div class="navbar-header">
        <br>&nbsp;&nbsp;&nbsp;<img src="<%=basePath%>/sign.jpg" style="height: 70px;width: 70px;">
        <label><font face="Microsoft JhengHei" size="7" color="#f5f5f5" style="position: absolute;top: 8px;left: 650px">X
            X X 大 学</font></label><br>
        <label><font face="Script MT" size="5" color="#f5f5f5" style="position: absolute;top: 65px;left: 682px">X X X
            University</font></label>
    </div>
    <ul class="nav navbar-nav navbar-right" style="position: absolute;top: 48px;right: 25px">
        <br><label><font size="4" color="#f5f5f5">欢迎，</font><font size="4"
                                                                  color="#f5f5f5">${sessionScope.user.username}</font>&nbsp;&nbsp;</label>
    </ul>
</div>
</body>
</html>
