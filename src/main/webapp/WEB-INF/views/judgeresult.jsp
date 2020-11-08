<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评教结果</title>
</head>
<body style="background-color: floralwhite">
<%@ include file="./commom/head.jsp" %>
<%@ include file="commom/sidebar.jsp" %>
<%@ include file="./commom/foot.jsp" %>
<div class="input-group" style="position: absolute;margin-left: 300px;margin-top: 30px;width: 240px;">
    <span class="input-group-addon">工号</span>
    <input type="text" class="form-control" id="no" placeholder="请输入工号">
</div>
<div class="input-group" style="position: absolute;margin-left:550px;margin-top: 30px;width: 240px;">
    <span class="input-group-addon">姓名</span>
    <input type="text" class="form-control" id="name" placeholder="请输入姓名">
</div>
<div class="input-group" style="position: absolute;margin-left: 800px;margin-top: 30px;width: 240px;">
    <span class="input-group-addon">所教科目</span>
    <select class="form-control" id="subject">
        <option value="" hidden style="diaplay:none">请输入所教科目</option>
        <option value="C程序设计">C程序设计</option>
        <option value="操作系统">操作系统</option>
        <option value="计算机网络">计算机网络</option>
        <option value="软件工程">软件工程</option>
    </select>
</div>
<div style="position: absolute;margin-left: 1050px;margin-top: 30px;">
    <button class="btn btn-info" style="width: 80px;height: 33px;text-align: center;" onclick="findTeacher()">搜&nbsp;&nbsp;&nbsp;&nbsp;索
    </button>
    <button class="btn btn-warning" style="width: 80px;height: 33px;text-align: center;" onclick="clearconditions()">
        清空条件
    </button>
    <button class="btn btn-success" style="width: 80px;height: 33px;text-align: center;" onclick="showalljudge()">显示全部
    </button>
</div>
<div id="teachers" style="position: absolute;margin-left: 300px;margin-top:83px;">
    <table class="table">
        <thead>
        <tr>
            <th style="width: 150px;">工号</th>
            <th style="width: 150px;">姓名</th>
            <th style="width: 150px;">所教科目</th>
            <th style="width: 150px;">课堂氛围</th>
            <th style="width: 150px;">教学方法</th>
            <th style="width: 150px;">工作状态</th>
            <th style="width: 100px;">答疑态度</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.list}" var="temp">
            <tr style="height: 105px;">
                <td style="width: 150px;">${temp.no}</td>
                <td style="width: 150px;">${temp.name}</td>
                <td style="width: 150px;">${temp.subject}</td>
                <td style="width: 150px;">满&nbsp;&nbsp;&nbsp;意: ${temp.clata}<br>一&nbsp;&nbsp;&nbsp;般: ${temp.clatb}<br>不满意: ${temp.clatc}
                </td>
                <td style="width: 150px;">满&nbsp;&nbsp;&nbsp;意: ${temp.temea}<br>一&nbsp;&nbsp;&nbsp;般: ${temp.temeb}<br>不满意: ${temp.temec}
                </td>
                <td style="width: 150px;">满&nbsp;&nbsp;&nbsp;意: ${temp.wocoa}<br>一&nbsp;&nbsp;&nbsp;般: ${temp.wocob}<br>不满意: ${temp.wococ}
                </td>
                <td style="width: 150px;">满&nbsp;&nbsp;&nbsp;意: ${temp.qaata}<br>一&nbsp;&nbsp;&nbsp;般: ${temp.qaatb}<br>不满意: ${temp.qaatc}
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div id="teacherpage" style="position: absolute;margin-left: 607px;margin-top: 512px;">
    <ul class="pagination">
        <li><a href="judgeresult.do?page=1">首页</a></li>
        <c:choose>
            <c:when test="${pageInfo.hasPreviousPage}">
                <li><a href="judgeresult.do?page=${pageInfo.pageNum-1}">上一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>上一页</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${pageInfo.navigatepageNums}" var="item">
            <li <c:if test="${item == pageInfo.pageNum}"> class="active"</c:if>><a
                    href="judgeresult.do?page=${item}">${item}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${pageInfo.hasNextPage}">
                <li><a href="judgeresult.do?page=${pageInfo.pageNum+1}">下一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a>下一页</a></li>
            </c:otherwise>
        </c:choose>
        <li><a href="judgeresult.do?page=${pageInfo.pages}">尾页</a></li>
    </ul>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        当前第 ${pageInfo.pageNum} 页, 共 ${pageInfo.pages} 页, 共 ${pageInfo.total} 条记录</p>
</div>
</body>
<script>
    function clearconditions() {
        $("#no").val("");
        $("#name").val("");
        $("#subject").val("");
    }

    function showalljudge() {
        window.location.href = "judgeresult.do?page=1";
    }

    function findTeacher() {
        var no = $("#no").val();
        var name = $("#name").val();
        var subject = $("#subject").val();
        if ((no == null || no === "") && (name == null || name === "") && (subject == null || subject === "")) {
            mizhu.alert("提 示 框", "请至少输入一个查询条件！");
            return;
        }
        $.ajax({
            method: "get",
            url: "findteacher.do",
            dataType: "json",
            data: {
                "no": no,
                "name": name,
                "subject": subject
            },
            success: function (data) {
                $("#teachers").empty();
                $("#teacherpage").empty();
                var html = "<table class=\"table\">\n" +
                    "        <thead>\n" +
                    "        <tr>\n" +
                    "            <th style=\"width: 150px;\">工号</th>\n" +
                    "            <th style=\"width: 150px;\">姓名</th>\n" +
                    "            <th style=\"width: 150px;\">所教科目</th>\n" +
                    "            <th style=\"width: 150px;\">课堂氛围</th>\n" +
                    "            <th style=\"width: 150px;\">教学方法</th>\n" +
                    "            <th style=\"width: 150px;\">工作状态</th>\n" +
                    "            <th style=\"width: 100px;\">答疑态度</th>\n" +
                    "        </tr>\n" +
                    "        </thead>";
                for (var i = 0; i < data.length; i++) {
                    html += "<tr style=\"height: 105px;\"><td>" + data[i].no + "</td>";
                    html += "<td>" + data[i].name + "</td>";
                    html += "<td>" + data[i].subject + "</td>";
                    html += "<td>满&nbsp;&nbsp;&nbsp;意: " + data[i].clata + "<br>" + "一&nbsp;&nbsp;&nbsp;般: " + data[i].clatb +  "<br>" + "不满意: " + data[i].clatc + "</td>";
                    html += "<td>满&nbsp;&nbsp;&nbsp;意: " + data[i].temea + "<br>" + "一&nbsp;&nbsp;&nbsp;般: " + data[i].temeb +  "<br>" + "不满意: " + data[i].temec + "</td>";
                    html += "<td>满&nbsp;&nbsp;&nbsp;意: " + data[i].wocoa + "<br>" + "一&nbsp;&nbsp;&nbsp;般: " + data[i].wocob +  "<br>" + "不满意: " + data[i].wococ + "</td>";
                    html += "<td>满&nbsp;&nbsp;&nbsp;意: " + data[i].qaata + "<br>" + "一&nbsp;&nbsp;&nbsp;般: " + data[i].qaatb +  "<br>" + "不满意: " + data[i].qaatc + "</td></tr>";
                }
                html += "</table>";
                $("#teachers").html(html);
            }
        })
    }
</script>
</html>
