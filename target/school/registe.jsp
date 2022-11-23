<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>注册界面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        #registe_frame {
            width: 400px;
            height: 384px;
            padding: 13px;
            position: absolute;
            left: 78%;
            top: 42%;
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
<body style="width: 20px">
<div id="registe_frame">
    <p id="registe_name">
    <center>
        <font face="华文琥珀" size=6 color="#483d8b">用 户 注 册</font>
    </center>
    <br><br>
    </p>
    <form method="post" action="registe.do">
        <div class="form-group">
            <label>&nbsp;用户名：</label><input type="text" class="form-control" name="username" placeholder="请输入学号/工号"><br>
        </div>
        <div class="form-group">
            <label>&nbsp;密 码：</label><input type="password" class="form-control" name="password" placeholder="请输入密码">
        </div>&nbsp;
        <div class="form-group">
            <label>&nbsp;用户权限&nbsp;(必选) ：</label><select class="form-control" name="rolelevel">
            <option value="" style="display:none">请选择</option>
            <option value="学生">学生</option>
            <option value="教师">教师</option>
        </select>
        </div>&nbsp;
        <font color="red">${error}</font>
        <font color="red">${msg}</font>
        <br><br>
        <center>
            <button type="submit" class="btn btn-success" style="width: 350px;height: 40px">注册</button>
        </center>
        <br>
    </form>
</div>
</body>
</html>