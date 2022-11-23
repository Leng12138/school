<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <span class="input-group-addon">工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
            <input type="text" class="form-control" value="${tea.no}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 33px">
            <span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
            <input type="text" class="form-control" value="${tea.name}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 90px">
            <span class="input-group-addon">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄</span>
            <c:choose>
                <c:when test="${tea.age == 0}">
                    <input type="text" class="form-control" value="" readonly>
                </c:when>
                <c:otherwise>
                    <input type="text" class="form-control" value="${tea.age}" readonly>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 90px">
            <span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
            <input type="text" class="form-control" value="${tea.sex}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 147px">
            <span class="input-group-addon">所教课程</span>
            <input type="text" class="form-control" value="${tea.subject}" readonly>
        </div>
        <div class="input-group" style="position: absolute;width: 320px;margin-left: 820px;margin-top: 147px">
            <span class="input-group-addon">所教班级</span>
            <input type="text" class="form-control" value="${list}" readonly>
        </div>
    </form>
</div>
<div style="position: absolute;width: 320px;margin-left: 640px;margin-top: 260px">
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
            <div class="modal-body" style="height: 378px">
                姓名：<input type="text" class="form-control" id="name" value="${tea.name}"><br>
                年龄：
                <c:choose>
                    <c:when test="${tea.age == 0}">
                        <input type="text" class="form-control" id="age" value=""><br>
                    </c:when>
                    <c:otherwise>
                        <input type="text" class="form-control" id="age" value="${tea.age}"><br>
                    </c:otherwise>
                </c:choose>
                性别：<select class="form-control" id="sex">
                <option style="display: none" value="${tea.sex}">${tea.sex}</option>
                <option value="男">男</option>
                <option value="女">女</option>
                </select><br>
                所教课程：<select class="form-control" id="subject">
                <option style="display: none" value="${tea.subject}">${tea.subject}</option>
                <option value="C程序设计">C程序设计</option>
                <option value="操作系统">操作系统</option>
                <option value="计算机网络">计算机网络</option>
                <option value="软件工程">软件工程</option>
                </select><br>
                所教班级：<br>
                <div style="position: absolute;margin-top: 8px;">
                <c:choose>
                <c:when test="${list.contains('微机1601')}"><input type="checkbox" name="class1" value="微机1601" checked>微机1601&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                <c:otherwise><input type="checkbox" name="class1" value="微机1601">微机1601&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${list.contains('微机1602')}"><input type="checkbox" name="class2" value="微机1602" checked>微机1602&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                <c:otherwise><input type="checkbox" name="class2" value="微机1602">微机1602&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${list.contains('微机1603')}"><input type="checkbox" name="class3" value="微机1603" checked>微机1603&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                <c:otherwise><input type="checkbox" name="class3" value="微机1603">微机1603&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${list.contains('微机1604')}"><input type="checkbox" name="class4" value="微机1604" checked>微机1604&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                <c:otherwise><input type="checkbox" name="class4" value="微机1604">微机1604&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${list.contains('微机1605')}"><input type="checkbox" name="class5" value="微机1605" checked>微机1605&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                <c:otherwise><input type="checkbox" name="class5" value="微机1605">微机1605&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${list.contains('微机1606')}"><input type="checkbox" name="class6" value="微机1606" checked>微机1606&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                <c:otherwise><input type="checkbox" name="class6" value="微机1606">微机1606&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:otherwise>
                </c:choose>
                </div><br><br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="updateteacher()">
                    确认更改
                </button>
            </div>
        </div>
    </div>
</div>
<div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 345px">
    <font size="4" style="font-weight:bold;">评教结果</font>
</div>
<div class="input-group" style="position: absolute;width: 320px;margin-left: 440px;margin-top: 387px;">
    <table class="table table-bordered" style="width: 700px;background-color: lightgreen">
        <thead>
        <tr>
            <th>评教项目</th>
            <th>满意</th>
            <th>一般</th>
            <th>不满意</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>课堂氛围</td>
            <td>${tea.clata}</td>
            <td>${tea.clatb}</td>
            <td>${tea.clatc}</td>
        </tr>
        <tr>
            <td>教学方法</td>
            <td>${tea.temea}</td>
            <td>${tea.temeb}</td>
            <td>${tea.temec}</td>
        </tr>
        <tr>
            <td>工作状态</td>
            <td>${tea.wocoa}</td>
            <td>${tea.wocob}</td>
            <td>${tea.wococ}</td>
        </tr>
        <tr>
            <td>答疑态度</td>
            <td>${tea.qaata}</td>
            <td>${tea.qaatb}</td>
            <td>${tea.qaatc}</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
<script>
    function updateteacher() {
        var username = $("#username").val();
        var name = $("#name").val();
        var age = $("#age").val();
        var sex = $("#sex").val();
        var subject = $("#subject").val();
        var teaclass = [];
        $.each($('input:checkbox:checked'),function(i){
            teaclass[i] = $(this).val();
        });
        console.log(teaclass);
        if (name == null || age == null || sex == null || subject == null || teaclass.length === 0||
            name === "" || age === "" || sex === "" || subject === ""){
            mizhu.alert("提 示 框", "请完善所有选项！");
            return;
        }
        if (!(/^([+\-])?\d+$/.test( age )) || age <= 0){
            mizhu.alert("提 示 框", "年龄格式有误！");
            return;
        }
        $.ajax({
            method: "get",
            url: "updateteacher.do",
            traditional: true,
            data: {
                "username": username,
                "name": name,
                "age": age,
                "sex": sex,
                "teaclass": teaclass,
                "subject": subject
            },
            success: function (data) {
                if (data === "success"){
                    window.location.reload();
                }
            }
        })
    }
</script>
</html>
