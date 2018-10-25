<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/23
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
</head>
<body style="text-align: center">
<jsp:include page="emplBaseNav.jsp"/>
<c:if test="${empty requestScope.trains}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.trains}">
    <table border="2px" cellspacing="0" align="center"  style="text-align: center">
        <tr>
            <td colspan="5"><h3>培训通知</h3></td>
        </tr>
        <tr>
            <td><h5>培训ID</h5></td>
            <td><h5>主题</h5></td>
            <td><h5>部门名称</h5></td>
            <td><h5>职位名称</h5></td>
            <td><h5>培训时间</h5></td>
        </tr>
        <c:forEach items="${requestScope.trains}" var="train">
            <tr>
                <td>${train.tId}</td>
                <td>${train.title}</td>
                <td><c:forEach items="${requestScope.departments}" var="department">
                    <c:if test="${train.dId==department.id}">
                        ${department.name}
                    </c:if>
                </c:forEach> </td>
                <td><c:if test="${train.pId==0}">全部职位</c:if>
                    <c:if test="${train.pId!=0}">
                        <c:forEach items="${requestScope.positions}" var="position">
                            <c:if test="${position.pId==train.pId}">
                                ${position.pName}
                            </c:if>
                        </c:forEach>
                    </c:if></td>
                <td>${train.startTime}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
