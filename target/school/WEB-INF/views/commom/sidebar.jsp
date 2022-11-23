<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Left Page</title>
</head>
<body>
<div style="position:absolute;height: 614px;width: 165px;margin-left: 30px;top: 110px;background-color:floralwhite;">
    <ul class="list-group"><br>
        <li class="list-group-item" style="height: 40px;"><a href="index.do"><span class="glyphicon glyphicon-home" style="left:15px;">&nbsp;首&nbsp;&nbsp;页 </span></a></li>
        <c:if test="${sessionScope.user.rolelevel == '学生'}">
            <li class="list-group-item" style="height: 40px;"><a href="basicmessage_student.do?username=${sessionScope.user.username}"><span class="glyphicon glyphicon-list-alt" style="left:15px;">&nbsp;基本信息 </span></a></li>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '教师'}">
            <li class="list-group-item" style="height: 40px;"><a href="basicmessage_teacher.do?username=${sessionScope.user.username}"><span class="glyphicon glyphicon-list-alt" style="left:15px;">&nbsp;基本信息 </span></a></li>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '教师'}">
            <li class="list-group-item" style="height: 40px;"><a href="scoreentry.do?page=1"><span class="glyphicon glyphicon-book" style="left:15px;">&nbsp;成绩录入 </span></a></li>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '系统管理员'}">
            <li class="list-group-item" style="height: 40px;"><a href="scoresearch.do?page=1"><span class="glyphicon glyphicon-search" style="left:15px;">&nbsp;成绩查询 </span></a></li>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '系统管理员'}">
            <li class="list-group-item" style="height: 40px;"><a href="judgeresult.do?page=1"><span class="glyphicon glyphicon-th-large" style="left:15px;">&nbsp;评教结果 </span></a></li>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '学生'}">
            <li class="list-group-item" style="height: 40px;"><a href="judgeteacher.do?page=1"><span class="glyphicon glyphicon-flag" style="left:15px;">&nbsp;教师评教 </span></a></li>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '学生' || sessionScope.user.rolelevel == '教师' || sessionScope.user.rolelevel == '系统管理员'}">
            <li class="list-group-item" style="height: 40px;"><a href="department_review.do?page=1"><span class="glyphicon glyphicon-comment" style="left:15px;">&nbsp;系部评价 </span></a></li>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '学生' || sessionScope.user.rolelevel == '教师' || sessionScope.user.rolelevel == '系统管理员'}">
            <li class="list-group-item" style="height: 40px;"><a href="changepassword.do"><span class="glyphicon glyphicon-pencil" style="left:15px;">&nbsp;修改密码 </span></a></li>
        </c:if>
        <li class="list-group-item" style="height: 40px;"><a href="exit.do"><span class="glyphicon glyphicon-off" style="left:15px;">&nbsp;退出系统 </span></a></li>
    </ul>
</div>
<div style="position:absolute;height: 614px;width: 165px;margin-left: 1340px;top: 110px;background-color: floralwhite"></div>
</body>
</html>