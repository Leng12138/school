<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <style>
        #change_frame {
            width: 400px;
            height: 384px;
            padding: 13px;
            position: absolute;
            left: 57.5%;
            top: 49%;
            margin-left: -307px;
            margin-top: -200px;
            border-radius: 10px;
            text-align: left;
        }
    </style>
</head>
<body padding-bottom: 10px; style="background-color: floralwhite">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<div id="change_frame">
    <input type="hidden" id="username" value=${sessionScope.user.username}>
    <center>
        <font face="华文琥珀" size=6 color="black">修 改 密 码</font>
    </center>
    <br><br>
    <div class="form-group">
        <label>&nbsp;旧 密 码：</label><input type="text" class="form-control" name="old_password" id="old_password"
                                          placeholder="请输入旧密码"><br>
    </div>
    <div class="form-group">
        <label>&nbsp;新 密 码：</label><input type="text" class="form-control" name="new_password" id="new_password"
                                          placeholder="请输入新密码"><br>
    </div>
    <div class="form-group">
        <label>&nbsp;确认密码：</label><input type="text" class="form-control" name="again_password" id="again_password"
                                         placeholder="请确认新密码">
    </div>
    <br><br>
    <center>
        <button type="button" class="btn btn-info" style="width: 350px;height: 40px" onclick="changepassword()">修改
        </button>
    </center>
</div>
</body>
<script>
    function changepassword() {
        var username = $("#username").val();
        var old_password = $("#old_password").val();
        var new_password = $("#new_password").val();
        var again_password = $("#again_password").val();
        $.ajax({
            method: "post",
            url: "change.do",
            data: {
                "username": username,
                "old_password": old_password,
                "new_password": new_password,
                "again_password": again_password
            },
            success: function (data) {
                if (data == "error")
                    mizhu.alert("提 示 框", "旧密码错误！");
                if (data == "different")
                    mizhu.alert("提 示 框", "两次密码不一致！");
                if (data == "success")
                    mizhu.alert("提 示 框", "密码修改成功！");
            }
        })
    }
</script>
</html>
