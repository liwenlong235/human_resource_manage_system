<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/18
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty requestScope.invitations}">
    <table border="1px" cellspacing="0px" cellpadding="15px" align="center">
        <tr>
            <td>面试Id</td>
            <td>提交记录</td>
            <td>面试时间</td>
            <td>面试官</td>
            <td>面试地址</td>
            <td>是否同意面试<br>(1同意/0不同意/-1未查看)</td>
            <td>是否通过面试<1通过/0未面试/-1未通过</td>
        </tr>
        <c:forEach items="${requestScope.invitations}" var="invitation">
            <tr>
                <td>${invitation.iId}</td>
                <td>${invitation.cId}</td>
                <td><f:formatDate value="${invitation.inviteTime}"/></td>
                <td>${invitation.manager}</td>
                <td>${invitation.address}</td>
                <td>${invitation.confirmed}</td>
                <td>${invitation.pass}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
