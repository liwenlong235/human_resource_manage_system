<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<jsp:include page="leaderBaseNav.jsp"/>
<c:if test="${!empty requestScope.invitations}">
    <c:forEach var="invitation" items="${requestScope.invitations}">
        <c:if test="${invitation.manager==sessionScope.leader.pName&&invitation.confirmed==1}">
            <h1 style="color: red">您在<f:formatDate value="${invitation.inviteTime}"/>时候需要主持一次面试</h1>
        </c:if>
    </c:forEach>
</c:if>
</body>
</html>
