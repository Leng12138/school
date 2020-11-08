<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩录入</title>
</head>
<body style="background-color: floralwhite">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<input type="hidden" id="username" value=${sessionScope.user.username}>
<div style="position: absolute;margin-left: 440px;margin-top:43px;">
    <table class="table">
        <thead>
        <tr>
            <th style="width: 150px;">学号</th>
            <th style="width: 150px;">姓名</th>
            <th style="width: 150px;">班级</th>
            <c:if test="${subject == 'C程序设计'}">
                <th style="width: 100px;">C程序设计</th>
            </c:if>
            <c:if test="${subject == '操作系统'}">
                <th style="width: 100px;">操作系统</th>
            </c:if>
            <c:if test="${subject == '计算机网络'}">
                <th style="width: 100px;">计算机网络</th>
            </c:if>
            <c:if test="${subject == '软件工程'}">
                <th style="width: 100px;">软件工程</th>
            </c:if>
            <th style="width: 44px;"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="temp">
            <tr>
                <td style="width: 150px;">${temp.no}</td>
                <td style="width: 150px;">${temp.name}</td>
                <td style="width: 150px;">${temp.stuclass}</td>
                <td style="width: 100px;">
                    <c:if test="${subject == 'C程序设计'}">
                        <input style="width: 100px" id="score+${temp.no}" value="${temp.cscore}">
                    </c:if>
                    <c:if test="${subject == '操作系统'}">
                        <input style="width: 100px" id="score+${temp.no}" value="${temp.osscore}">
                    </c:if>
                    <c:if test="${subject == '计算机网络'}">
                        <input style="width: 100px" id="score+${temp.no}" value="${temp.ciscore}">
                    </c:if>
                    <c:if test="${subject == '软件工程'}">
                        <input style="width: 100px" id="score+${temp.no}" value="${temp.sescore}">
                    </c:if>
                </td>
                <td style="width: 44px;">
                    <button class="btn btn-info btn-xs" style="height: 24px;width: 44px;"
                            onclick="entry('${temp.no}', document.getElementById('score+${temp.no}').value)">录 入
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div style="position: absolute;margin-left: 587px;margin-top: 500px;">
    <ul class="pagination">
        <li><a href="scoreentry.do?page=1">首页</a></li>
        <c:choose>
            <c:when test="${pageInfo.hasPreviousPage}">
                <li><a href="scoreentry.do?page=${pageInfo.pageNum-1}">上一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>上一页</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${pageInfo.navigatepageNums}" var="item">
            <li <c:if test="${item == pageInfo.pageNum}"> class="active"</c:if>><a
                    href="scoreentry.do?page=${item}">${item}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${pageInfo.hasNextPage}">
                <li><a href="scoreentry.do?page=${pageInfo.pageNum+1}">下一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>下一页</a></li>
            </c:otherwise>
        </c:choose>
        <li><a href="scoreentry.do?page=${pageInfo.pages}">尾页</a></li>
    </ul>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        当前第 ${pageInfo.pageNum} 页, 共 ${pageInfo.pages} 页, 共 ${pageInfo.total} 条记录</p>
</div>
</body>
<script>
    function entry(sno, score) {
        var tno = $("#username").val();
        if (!(/^([+\-])?\d+$/.test(score)) || score < 0 || score > 100) {
            mizhu.alert("提 示 框", "成绩输入有误！");
            return;
        }
        $.ajax({
            method: "get",
            url: "entry.do",
            data: {
                "tno": tno,
                "sno": sno,
                "score": score
            },
            success: function (data) {
                if (data === "success") {
                    mizhu.alert("提 示 框", "录入成功！");
                } else if (data === "error") {
                    mizhu.alert("提 示 框", "录入失败！");
                }
            }
        })
    }
</script>
</html>
