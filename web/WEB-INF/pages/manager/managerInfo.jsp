<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty sessionScope.manager}">
    <table border="0px" cellpadding="20px" align="center" style="font-size: 25px;text-align: center">
        <tr>
            <td colspan="2"><h3>${sessionScope.manager.mName}的详细信息</h3></td>
        </tr>
        <tr>
            <td>ID</td>
            <td>${sessionScope.manager.mId}</td>
        </tr>
        <tr>
            <td>账号</td>
            <td>${sessionScope.manager.mName}</td>
        </tr>
        <tr>
            <td>密码</td>
            <td>${sessionScope.manager.mPassword}</td>
        </tr>
        <tr>
            <td>类型</td>
            <td><c:if test="${sessionScope.manager.type==0}">管理员</c:if>
                <c:if test="${sessionScope.manager.type==1}">部门主管</c:if>
            </td>
        </tr>
        <tr>
            <td>所属部门</td>
            <td>${sessionScope.manager.dName}</td>
        </tr>
        <tr>
            <td>职位</td>
            <td>${sessionScope.manager.pName}</td>
        </tr>
    </table>
</c:if>
</body>
</html>
