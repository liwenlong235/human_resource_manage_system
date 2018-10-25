<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/19
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
</head>
<body style="text-align: center">
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${empty requestScope.commitRecords}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.commitRecords}">
<table border="2px" cellspacing="0" cellpadding="15x" align="center">
    <tr>
        <td>面试Id</td>
        <td>简历Id</td>
        <td>提交记录</td>
        <td>面试时间</td>
        <td>面试官</td>
        <td>面试地址</td>
        <td>是否通过面试<1通过/0未面试/-1未通过</td>
        <td>新增员工</td>
    </tr>
    <c:forEach items="${requestScope.invitations}" var="invitation">
        <c:forEach items="${requestScope.commitRecords}" var="commit">
            <c:if test="${invitation.cId==commit.cId&&invitation.pass==1}">
                <tr>
                    <td>${commit.rId}</td>
                    <td>${invitation.iId}</td>
                    <td>${invitation.cId}</td>
                    <td><f:formatDate value="${invitation.inviteTime}"/></td>
                    <td>${invitation.manager}</td>
                    <td>${invitation.address}</td>
                    <td>${invitation.pass}</td>
                    <td><a href="managers/emplInput?rId=${commit.rId}">新增员工</a></td>
                </tr>
            </c:if>
        </c:forEach>
    </c:forEach>
</table>
</c:if>
</body>
</html>
