<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
</head>
<body style="background-color:floralwhite;">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<input type="hidden" id="username" value=${sessionScope.user.username}>
<div style="position:absolute;margin-left: 350px;">
    <img src="<%=basePath%>/WXcode.png" width="420px" height="520px">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="<%=basePath%>/QQcode.jpg" width="420px" height="520px"><br>
    <font size="6" color="blue">如果在使用过程中遇到什么问题，扫描二维码即可联系管理员&nbsp;!</font><br>
    <font size="6" color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        使用系统各功能前请先完善基本信息&nbsp;!</font>
</div>
</body>
<script>
    var no = $("#username").val();
    $.ajax({
        method: "get",
        url: "check.do",
        data: {"no": no},
        success: function (data) {
            if (data === "miss")
                mizhu.alert("提 示 框 ", "请先完善个人基本信息！");
        }
    })
</script>
</html>
