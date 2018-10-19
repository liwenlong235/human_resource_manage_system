<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/18
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
</head>
<body>
<c:if test="${!empty requestScope.invitation}">
    <form action="user/invitationUpdate" method="post">
        <table border="1px" cellspacing="0" cellpadding="15px" align="center">
            <input type="hidden" name="iId" value="${requestScope.invitation.iId}"/>
            <tr>
                <td>提交记录Id</td>
                <td>${requestScope.invitation.cId}</td>
            </tr>
            <tr>
                <td>面试时间</td>
                <td>${requestScope.invitation.inviteTime}</td>
            </tr>
            <tr>
                <td>面试官</td>
                <td>${requestScope.invitation.manager}</td>
            </tr>
            <tr>
                <td>面试地点</td>
                <td>${requestScope.invitation.address}</td>
            </tr>
            <tr>
                <td>是否面试</td>
                <td><c:if test="${requestScope.invitation.confirmed==1}">
                    <input type="radio" name="confirmed" value="1" checked="checked">是
                    <input type="radio" name="confirmed" value="0">否</c:if>
                    <c:if test="${requestScope.invitation.confirmed==0}">
                        <input type="radio" name="confirmed" value="1">是
                        <input type="radio" name="confirmed" value="0" checked="checked">否</c:if>
                    <c:if test="${requestScope.invitation.confirmed<0}">
                        <input type="radio" name="confirmed" value="1">是
                        <input type="radio" name="confirmed" value="0">否</c:if>
                </td>
            </tr>
            <tr><td colspan="2"><c:if test="${requestScope.invitation.confirmed>=0}">
                <a href="user/userInfo">返回</a></c:if>
                <c:if test="${requestScope.invitation.confirmed<0}"><input type="submit"></c:if></td></tr>
        </table>
    </form>
</c:if>
</body>
</html>
