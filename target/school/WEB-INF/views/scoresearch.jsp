<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩查询</title>
</head>
<body style="background-color: floralwhite">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<div class="input-group" style="position: absolute;margin-left: 300px;margin-top: 30px;width: 240px;">
    <span class="input-group-addon">学号</span>
    <input type="text" class="form-control" id="no" placeholder="请输入学号">
</div>
<div class="input-group" style="position: absolute;margin-left:550px;margin-top: 30px;width: 240px;">
    <span class="input-group-addon">姓名</span>
    <input type="text" class="form-control" id="name" placeholder="请输入姓名">
</div>
<div class="input-group" style="position: absolute;margin-left: 800px;margin-top: 30px;width: 240px;">
    <span class="input-group-addon">班级</span>
    <select class="form-control" id="stuclass">
        <option value="" hidden style="diaplay:none">请输入班级</option>
        <option value="微机1601">微机1601</option>
        <option value="微机1602">微机1602</option>
        <option value="微机1603">微机1603</option>
        <option value="微机1604">微机1604</option>
        <option value="微机1605">微机1605</option>
        <option value="微机1606">微机1606</option>
    </select>
</div>
<div style="position: absolute;margin-left: 1050px;margin-top: 30px;">
    <button class="btn btn-info" style="width: 80px;height: 33px;text-align: center;" onclick="findStudent()">搜&nbsp;&nbsp;&nbsp;&nbsp;索
    </button>
    <button class="btn btn-warning" style="width: 80px;height: 33px;text-align: center;" onclick="clearselect()">清空条件
    </button>
    <button class="btn btn-success" style="width: 80px;height: 33px;text-align: center;" onclick="showall()">显示全部
    </button>
</div>
<div id="students" style="position: absolute;margin-left: 300px;margin-top:95px;">
    <table class="table">
        <thead>
        <tr>
            <th style="width: 150px;">学号</th>
            <th style="width: 150px;">姓名</th>
            <th style="width: 150px;">班级</th>
            <th style="width: 150px;">C程序设计</th>
            <th style="width: 150px;">操作系统</th>
            <th style="width: 150px;">计算机网络</th>
            <th style="width: 100px;">软件工程</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.list}" var="temp">
            <tr>
                <td style="width: 150px;">${temp.no}</td>
                <td style="width: 150px;">${temp.name}</td>
                <td style="width: 150px;">${temp.stuclass}</td>
                <td style="width: 150px;">${temp.cscore}</td>
                <td style="width: 150px;">${temp.osscore}</td>
                <td style="width: 150px;">${temp.ciscore}</td>
                <td style="width: 100px;">${temp.sescore}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div id="studentpage" style="position: absolute;margin-left: 587px;margin-top: 500px;">
    <ul class="pagination">
        <li><a href="scoresearch.do?page=1">首页</a></li>
        <c:choose>
            <c:when test="${pageInfo.hasPreviousPage}">
                <li><a href="scoresearch.do?page=${pageInfo.pageNum-1}">上一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>上一页</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${pageInfo.navigatepageNums}" var="item">
            <li <c:if test="${item == pageInfo.pageNum}"> class="active"</c:if>><a
                    href="scoresearch.do?page=${item}">${item}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${pageInfo.hasNextPage}">
                <li><a href="scoresearch.do?page=${pageInfo.pageNum+1}">下一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>下一页</a></li>
            </c:otherwise>
        </c:choose>
        <li><a href="scoresearch.do?page=${pageInfo.pages}">尾页</a></li>
    </ul>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        当前第 ${pageInfo.pageNum} 页, 共 ${pageInfo.pages} 页, 共 ${pageInfo.total} 条记录</p>
</div>
</body>
<script>
    function findStudent() {
        var no = $("#no").val();
        var name = $("#name").val();
        var stuclass = $("#stuclass").val();
        if ((no == null || no === "") && (name == null || name === "") && (stuclass == null || stuclass === "")){
            mizhu.alert("提 示 框", "请至少输入一个查询条件！");
            return;
        }
        $.ajax({
            method: "get",
            url: "findstudent.do",
            dataType: "json",
            data: {
                "no": no,
                "name": name,
                "stuclass": stuclass
            },
            success: function (data) {
                $("#students").empty();
                $("#studentpage").empty();
                var html = "<table class=\"table\">\n" +
                    "        <thead>\n" +
                    "        <tr>\n" +
                    "            <th style=\"width: 150px;\">学号</th>\n" +
                    "            <th style=\"width: 150px;\">姓名</th>\n" +
                    "            <th style=\"width: 150px;\">班级</th>\n" +
                    "            <th style=\"width: 150px;\">C程序设计</th>\n" +
                    "            <th style=\"width: 150px;\">操作系统</th>\n" +
                    "            <th style=\"width: 150px;\">计算机网络</th>\n" +
                    "            <th style=\"width: 100px;\">软件工程</th>\n" +
                    "        </tr>\n" +
                    "        </thead>";
                for (var i = 0; i < data.length; i++) {
                    html += "<tr><td>" + data[i].no + "</td>";
                    html += "<td>" + data[i].name + "</td>";
                    html += "<td>" + data[i].stuclass + "</td>";
                    html += "<td>" + data[i].cscore + "</td>";
                    html += "<td>" + data[i].osscore + "</td>";
                    html += "<td>" + data[i].ciscore + "</td>";
                    html += "<td>" + data[i].sescore + "</td></tr>";
                }
                html += "</table>";
                $("#students").html(html);
            }
        })
    }
    function clearselect() {
        $("#no").val("");
        $("#name").val("");
        $("#stuclass").val("");
    }
    function showall() {
        window.location.href="scoresearch.do?page=1";
    }
</script>
</html>
