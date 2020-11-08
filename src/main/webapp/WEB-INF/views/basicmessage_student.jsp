<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>基本信息</title>
</head>
<body style="background-color: floralwhite">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<input type="hidden" id="username" value=${sessionScope.user.username}>
<div style="position:absolute;">
    <form class="form-horizontal" role="form">
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 30px">
            <font size="4" style="font-weight:bold;">个人信息</font>
        </div>
        <br><br>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 33px">
            <span class="input-group-addon">学号</span>
            <input type="text" class="form-control" value="${stu.no}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 33px">
            <span class="input-group-addon">姓名</span>
            <input type="text" class="form-control" value="${stu.name}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 90px">
            <span class="input-group-addon">年龄</span>
            <c:choose>
                <c:when test="${stu.age == 0}">
                    <input type="text" class="form-control" value="" readonly>
                </c:when>
                <c:otherwise>
                    <input type="text" class="form-control" value="${stu.age}" readonly>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 90px">
            <span class="input-group-addon">性别</span>
            <input type="text" class="form-control" value="${stu.sex}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 147px">
            <span class="input-group-addon">班级</span>
            <input type="text" class="form-control" value="${stu.stuclass}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 147px">
            <span class="input-group-addon">寝室</span>
            <input type="text" class="form-control" value="${stu.dormitory}" readonly>
        </div>
    </form>
</div>
<div style="position: absolute;width: 320px;margin-left: 640px;margin-top: 270px">
    <button data-target="#update" data-toggle="modal" style="width: 300px" class="btn btn-info">更改信息</button>
</div>
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    更新个人信息
                </h4>
            </div>
            <div class="modal-body">
                姓名：<input type="text" class="form-control" id="name" value="${stu.name}"><br>
                年龄：
                <c:choose>
                    <c:when test="${stu.age == 0}">
                        <input type="text" class="form-control" id="age" value=""><br>
                    </c:when>
                    <c:otherwise>
                        <input type="text" class="form-control" id="age" value="${stu.age}"><br>
                    </c:otherwise>
                </c:choose>
                性别：<select class="form-control" id="sex">
                <option style="display: none" value="${stu.sex}">${stu.sex}</option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select><br>
                班级：<select class="form-control" id="stuclass">
                <option style="display: none" value="${stu.stuclass}">${stu.stuclass}</option>
                <option value="微机1601">微机1601</option>
                <option value="微机1602">微机1602</option>
                <option value="微机1603">微机1603</option>
                <option value="微机1604">微机1604</option>
                <option value="微机1605">微机1605</option>
                <option value="微机1606">微机1606</option>
            </select><br>
                寝室：<input type="text" class="form-control" id="dormitory" value="${stu.dormitory}">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="updatestudent()">
                    确认更改
                </button>
            </div>
        </div>
    </div>
</div>
<form class="form-horizontal" role="form">
    <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 367px">
        <font size="4" style="font-weight:bold;">成绩信息</font>
    </div>
    <br><br>
    <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 370px">
        <span class="input-group-addon">C 程序设计</span>
        <input type="text" class="form-control" value="${stu.cscore}" readonly>
    </div>
    <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 370px">
        <span class="input-group-addon">操作系统</span>
        <input type="text" class="form-control" value="${stu.osscore}" readonly>
    </div>
    <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 427px">
        <span class="input-group-addon">计算机网络</span>
        <input type="text" class="form-control" value="${stu.ciscore}" readonly>
    </div>
    <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 427px">
        <span class="input-group-addon">软件工程</span>
        <input type="text" class="form-control" value="${stu.sescore}" readonly>
    </div>
</form>
<div style="position: absolute;margin-top: 480px;margin-left: 440px;">
    <font color="red">注：仅允许本人修改姓名，年龄，性别，班级，寝室。如需要其他修改请联系系统管理员。</font>
</div>
</body>
<script>
    function updatestudent() {
        var username = $("#username").val();
        var name = $("#name").val();
        var age = $("#age").val();
        var sex = $("#sex").val();
        var stuclass = $("#stuclass").val();
        var dormitory = $("#dormitory").val();
        if (name == null || age == null || sex == null || stuclass == null || dormitory == null ||
            name === "" || age === "" || sex === "" || stuclass === "" || dormitory === "") {
            mizhu.alert("提 示 框", "请完善所有选项！");
            return;
        }
        if (!(/^([+\-])?\d+$/.test(age)) || age <= 0) {
            mizhu.alert("提 示 框", "年龄格式有误！");
            return;
        }
        $.ajax({
            method: "get",
            url: "updatestudent.do",
            data: {
                "username": username,
                "name": name,
                "age": age,
                "sex": sex,
                "stuclass": stuclass,
                "dormitory": dormitory
            },
            success: function (data) {
                if (data === "success") {
                    window.location.reload();
                }
            }
        })
    }
</script>
</html>
