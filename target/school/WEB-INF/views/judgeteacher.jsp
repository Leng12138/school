<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师评教</title>
</head>
<body style="background-color: floralwhite">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<input type="hidden" id="username" value=${sessionScope.user.username}>
<div id="students" style="position: absolute;margin-left: 330px;margin-top:43px;">
    <table class="table">
        <thead>
        <tr>
            <th style="width: 120px;">工号</th>
            <th style="width: 100px;">姓名</th>
            <th style="width: 110px;">所教科目</th>
            <th style="width: 115px;">课堂氛围</th>
            <th style="width: 115px;">教学方法</th>
            <th style="width: 115px;">工作状态</th>
            <th style="width: 115px;">答疑态度</th>
            <th style="width:55px;"></th>
            <th style="width: 55px;"></th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.list}" var="temp">
            <tr style="height: 105px;">
                <td style="width: 120px;">${temp.no}</td>
                <td style="width: 100px;">${temp.name}</td>
                <td style="width: 110px;">${temp.subject}</td>
                <td style="width: 115px;"><select class="form-control" id="clat${temp.no}">
                    <option style="display: none" value="">请输入</option>
                    <option value="clata">满意</option>
                    <option value="clatb">一般</option>
                    <option value="clatc">不满意</option>
                </select></td>
                <td style="width: 115px;"><select class="form-control" id="teme${temp.no}">
                    <option style="display: none" value="">请输入</option>
                    <option value="temea">满意</option>
                    <option value="temeb">一般</option>
                    <option value="temec">不满意</option>
                </select></td>
                <td style="width: 115px;"><select class="form-control" id="woco${temp.no}">
                    <option style="display: none" value="">请输入</option>
                    <option value="wocoa">满意</option>
                    <option value="wocob">一般</option>
                    <option value="wococ">不满意</option>
                </select></td>
                <td style="width: 115px;"><select class="form-control" id="qaat${temp.no}">
                    <option style="display: none" value="">请输入</option>
                    <option value="qaata">满意</option>
                    <option value="qaatb">一般</option>
                    <option value="qaatc">不满意</option>
                </select></td>
                <td>
                    <button class="btn btn-warning btn-sm" style="height: 33px;width: 60px;" onclick="clearresult('${temp.no}')">清空
                    </button>
                </td>
                <td>
                    <button class="btn btn-info btn-sm" style="height: 33px;width: 60px;" onclick="judgeteach('${temp.no}')">评教</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div style="position: absolute;margin-left: 630px;margin-top: 500px;">
    <ul class="pagination">
        <li><a href="judgeteacher.do?page=1">首页</a></li>
        <c:choose>
            <c:when test="${pageInfo.hasPreviousPage}">
                <li><a href="judgeteacher.do?page=${pageInfo.pageNum-1}">上一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>上一页</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${pageInfo.navigatepageNums}" var="item">
            <li <c:if test="${item == pageInfo.pageNum}"> class="active"</c:if>><a
                    href="judgeteacher.do?page=${item}">${item}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${pageInfo.hasNextPage}">
                <li><a href="judgeteacher.do?page=${pageInfo.pageNum+1}">下一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>下一页</a></li>
            </c:otherwise>
        </c:choose>
        <li><a href="judgeteacher.do?page=${pageInfo.pages}">尾页</a></li>
    </ul>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        当前第 ${pageInfo.pageNum} 页, 共 ${pageInfo.pages} 页, 共 ${pageInfo.total} 条记录</p>
</div>
</body>
<script>
    function clearresult(no) {
        $("#clat" + no).val("");
        $("#teme" + no).val("");
        $("#woco" + no).val("");
        $("#qaat" + no).val("");
    }
    function judgeteach(no) {
        var clat = $("#clat" + no).val();
        var teme = $("#teme" + no).val();
        var woco = $("#woco" + no).val();
        var qaat = $("#qaat" + no).val();
        if (clat == null || clat === "" || teme == null || teme === "" ||
            woco == null || woco === "" || qaat == null || qaat === ""){
            mizhu.alert("提 示 框", "对该教师存在未评教项！");
            return;
        }
        $.ajax({
            method: "get",
            url: "judgeteach.do",
            data: {
                "no": no,
                "clat": clat,
                "teme": teme,
                "woco": woco,
                "qaat": qaat
            },
            success: function (data) {
                if (data === "success") {
                    mizhu.alert("提 示 框", "评教成功！");
                } else if (data === "error") {
                    mizhu.alert("提 示 框", "评教失败！");
                }
            }
        })
    }
</script>
</html>
