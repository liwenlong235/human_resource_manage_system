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
</head>
<body>
<div style="height: 100px">
    <a href="user/userInfo"><h2>当前账号：${sessionScope.userL.name}</h2></a>
    <button><a href="/user/loginInput"><span style="text-decoration: blink;font-size: 20px">切换账号</span></a></button>
</div>
<table border="0px" cellspacing="0px" cellpadding="20px" align="center" style="text-align: center;text-decoration: blink" >
    <tr>
        <td colspan="5"><span style="text-decoration: blink;font-size: 15px">招聘信息</span></td>
    </tr>
    <tr>
        <td>职位名</td>
        <td>公司名</td>
        <td>工作地点</td>
        <td>薪资</td>
        <td>发布时间</td>
    </tr>
    <c:if test="${!empty requestScope.jobs}">
        <c:forEach items="${requestScope.jobs}" var="job">
            <tr>
                <td><a href="user/jobInfo?id=${job.jId}">${job.position.pName}</a></td>
                <td>${job.company}</td>
                <td>${job.address}</td>
                <td>${job.salaryRange}</td>
                <td><f:formatDate value="${job.pubdate}"/></td>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
