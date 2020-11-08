<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        #login_frame {
            width: 400px;
            height: 384px;
            padding: 13px;
            position: absolute;
            left: 78%;
            top: 48%;
            margin-left: -200px;
            margin-top: -200px;
            border-radius: 10px;
            text-align: left;
        }

        form p > * {
            display: inline-block;
            vertical-align: middle;
        }

        body {
            background: url("background.jpg") no-repeat;
            background-size: 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body padding-bottom: 10px;>
<div id="login_frame">
    <p id="login_name">
    <center>
        <font face="华文琥珀" size=6 color="#483d8b">用 户 登 录</font>
    </center>
    <br><br>
    </p>
    <form method="post" action="login.do">
        <div class="form-group">
            <label>&nbsp;用户名：</label><input type="text" class="form-control" name="username" placeholder="请输入学号/工号"><br>
        </div>
        <div class="form-group">
            <label>&nbsp;密 码：</label><input type="password" class="form-control" name="password" placeholder="请输入密码">
        </div>
        &nbsp;<font color="red">${error}</font>
        <br><br>
        <center>
            <button type="submit" class="btn btn-success" style="width: 350px;height: 40px">登录</button>
        </center>
        <br>
        <center>还没有账号？ <a href="registe.jsp">立即注册</a></center>
        <br>
    </form>
</div>
</body>
</html>
