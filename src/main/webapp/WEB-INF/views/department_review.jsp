<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系部评价</title>
</head>
<body style="background-color: floralwhite">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<div style="position: absolute;margin-left: 430px;margin-top: 30px;">
    <input type="hidden" id="username" value=${sessionScope.user.username}>
    <table class="table">
        <thead>
        <tr>
            <th style="width: 150px;">用户</th>
            <th style="width: 500px">评论(${pageInfo.total})</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${sessionScope.user.rolelevel != '系统管理员'}">
            <c:forEach items="${pageInfo.list}" var="temp">
                <tr style="height: 110px">
                    <td style="width: 150px;">
                        <c:choose>
                            <c:when test="${temp.rolelevel != '系统管理员'}">
                                某${temp.rolelevel}&nbsp;&nbsp;(${temp.sex})<br><font color="#a9a9a9">${temp.time}</font>
                            </c:when>
                            <c:otherwise>
                                ${temp.rolelevel}<br><font color="#a9a9a9">${temp.time}</font>
                            </c:otherwise>
                        </c:choose>
                        </td>
                    <td style="width: 500px">${temp.review}</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${sessionScope.user.rolelevel == '系统管理员'}">
            <c:forEach items="${pageInfo.list}" var="temp">
                <tr style="height: 110px">
                    <td style="width: 150px;">
                        <c:choose>
                            <c:when test="${temp.rolelevel != '系统管理员'}">
                                ${temp.no}(${temp.sex})<br><font color="#a9a9a9">${temp.time}</font>
                            </c:when>
                            <c:otherwise>
                                ${temp.rolelevel}<br><font color="#a9a9a9">${temp.time}</font>
                            </c:otherwise>
                        </c:choose>

                    </td>
                    <td style="width: 500px">${temp.review}</td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
<div style="position: absolute;margin-left: 444px;margin-top: 412px;">
    <font size="3" face="行书">留 言: </font>
</div>
<div style="position: absolute;margin-left: 1004px;margin-top: 413px;">
    <button class="	btn btn-warning" onclick="clearAll()">清 空</button>
</div>
<div style="position: absolute;margin-left: 1004px;margin-top: 462px;">
    <button class="	btn btn-info" onclick="commit()">发 表</button>
</div>
<div style="position: absolute;margin-left: 492px;margin-top: 412px;">
    <textarea name="charsInput" rows="4" id="review" style="width: 500px;" placeholder="写出你对系部想说的话。注: 字数不得多于120字！"
              onkeydown="countChar('charsInput','counter');" onkeyup="countChar('charsInput','counter');"></textarea>
</div>
<div style="position: absolute;margin-top: 477px;margin-left: 930px;">
    <span id="counter">0</span>/120<br>
</div>
<div style="position: absolute;margin-left: 587px;margin-top: 500px;">
    <ul class="pagination">
        <li><a href="department_review.do?page=1">首页</a></li>
        <c:choose>
            <c:when test="${pageInfo.hasPreviousPage}">
                <li><a href="department_review.do?page=${pageInfo.pageNum-1}">上一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>上一页</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${pageInfo.navigatepageNums}" var="item">
            <li <c:if test="${item == pageInfo.pageNum}"> class="active"</c:if>><a
                    href="department_review.do?page=${item}">${item}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${pageInfo.hasNextPage}">
                <li><a href="department_review.do?page=${pageInfo.pageNum+1}">下一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>下一页</a></li>
            </c:otherwise>
        </c:choose>
        <li><a href="department_review.do?page=${pageInfo.pages}">尾页</a></li>
    </ul>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        当前第 ${pageInfo.pageNum} 页, 共 ${pageInfo.pages} 页, 共 ${pageInfo.total} 条记录</p>
</div>
</body>
<script>
    function countChar(textareaNm, spanName) {
        document.getElementById(spanName).innerHTML = document.getElementsByName(textareaNm)[0].value.length;
    }

    function clearAll() {
        $("#review").val("");
        countChar('charsInput', 'counter');
    }

    function getNow(s) {
        return s < 10 ? '0' + s : s;
    }

    function commit() {
        var myDate = new Date();
        var year = myDate.getFullYear();
        var month = myDate.getMonth() + 1;
        var date = myDate.getDate();
        var nowtime = year + '-' + getNow(month) + "-" + getNow(date);

        var review = $("#review").val();
        if (review.length > 120) {
            mizhu.alert("提 示 框", "字数超过限制！");
            return;
        }
        if (review === "") {
            mizhu.alert("提 示 框", "不得发表空白内容！");
            return;
        }
        var username = $("#username").val();
        $.ajax({
            method: "get",
            url: "commit.do",
            data: {
                "username": username,
                "review": review,
                'nowtime': nowtime
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
