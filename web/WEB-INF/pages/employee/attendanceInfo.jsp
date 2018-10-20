<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/20
  Time: 10:55
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
<c:if test="${empty requestScope.attendances}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.attendances}">
    <table border="2px" cellpadding="15px" cellspacing="0" align="center">
        <tr>
            <td colspan="8">${sessionScope.employee.eName}的考勤记录</td>
        </tr>
        <tr>
            <td>考勤ID</td>
            <td>员工ID</td>
            <td>月份</td>
            <td>上班日期</td>
            <td>上班时间</td>
            <td>下班时间</td>
            <td>迟到时间</td>
            <td>矿工时间</td>
        </tr>
        <c:forEach items="${requestScope.attendances}" var="attendance">
            <tr>
                <td>${attendance.aId}</td>
                <td>${attendance.eId}</td>
                <td>${attendance.month}</td>
                <td>${attendance.day}</td>
                <td>${attendance.morning}</td>
                <td>${attendance.night}</td>
                <td>${attendance.lateTime}</td>
                <td>${attendance.absenteeism}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
