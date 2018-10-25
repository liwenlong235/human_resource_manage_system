<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/14
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <style>
        body{
            background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
            background-size: 100% 100%;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $(".delete").click(function () {
                var $td = $(this).parent().parent().children();
                var jId = $td[0].innerHTML;
                var flag = confirm("确定要删除这个信息吗？");
                if(flag){
                    $.ajax({
                        url:"managers2/deleteJob",
                        data:{"jId":jId},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                $td.remove();
                                alert("删除成功")
                            }
                        }
                    })
                }
                return false;
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<table border="2px" cellspacing="0px" cellpadding="20px" align="center" style="text-align: center;text-decoration: blink" >
    <tr>
        <td colspan="9"><span style="text-decoration: blink;font-size: 15px">招聘信息</span></td>
    </tr>
    <tr>
        <td>记录ID</td>
        <td>职位名</td>
        <td>公司名</td>
        <td>工作地点</td>
        <td>薪资</td>
        <td>岗位职责</td>
        <td>任职要求</td>
        <td>发布时间</td>
        <td>删除</td>
    </tr>
    <c:if test="${!empty requestScope.jobs}">
        <c:forEach items="${requestScope.jobs}" var="job">
            <tr>
                <td>${job.jId}</td>
                <td>${job.position.pName}</td>
                <td>${job.company}</td>
                <td>${job.address}</td>
                <td>${job.salaryRange}</td>
                <td>${job.duty}</td>
                <td>${job.requirements}</td>
                <td><f:formatDate value="${job.pubdate}"/></td>
                <td><a class="delete" href="#">删除</a> </td>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
