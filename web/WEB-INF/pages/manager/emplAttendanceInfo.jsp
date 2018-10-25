<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/20
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
</head>
<body style="text-align: center">
<jsp:include page="managerBaseNav.jsp"/>
<form action="managers3/queryEmplAttendance" method="post">
    <table border="2px" cellpadding="15px" align="center">
        <tr>
            <td>员工姓名</td>
            <td><input type="text" name="name"></td>
            <td>查询月份</td>
            <td  style="color:grey"><input type="number" name="month"></td>
            <td><input type="submit" value="搜索"></td>
        </tr>
    </table>
</form>
<c:if test="${requestScope.flag=='monthNG'}">
    <h3 style="color: red">输入月份错误,请输入1~12之间的整数</h3>
</c:if>
<c:if test="${requestScope.flag=='nameNG'}">
    <h3 style="color: red">输入名字错误</h3>
</c:if>
<c:if test="${!empty requestScope.attendances}">
    <table border="2px" cellpadding="15px" cellspacing="0" align="center">
        <tr style="text-align: center">
            <td colspan="5">${requestScope.employee.eName}的考勤记录</td>
        </tr>
        <tr>
            <td>上班日期</td>
            <td>上班时间</td>
            <td>下班时间</td>
            <td>迟到时间</td>
            <td>矿工时间</td>
        </tr>
        <c:forEach items="${requestScope.attendances}" var="attendance">
            <tr>
                <td>${attendance.day}</td>
                <td>${attendance.morning}</td>
                <td>${attendance.night}</td>
                <td>${attendance.lateTime}</td>
                <td>${attendance.absenteeism}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${!empty requestScope.attendances1}">
    <table border="2px" cellpadding="15px" cellspacing="0" align="center">
        <tr style="text-align: center">
            <td colspan="5">${requestScope.employee.eName}的${requestScope.month}月份考勤记录</td>
        </tr>
        <tr>
            <td>上班日期</td>
            <td>上班时间</td>
            <td>下班时间</td>
            <td>迟到时间</td>
            <td>矿工时间</td>
        </tr>
        <c:forEach items="${requestScope.attendances1}" var="attendance">
            <tr>
                <td>${attendance.day}</td>
                <td>${attendance.morning}</td>
                <td>${attendance.night}</td>
                <td>${attendance.lateTime}</td>
                <td>${attendance.absenteeism}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${!empty requestScope.attendances2}">
    <table border="2px" cellpadding="15px" cellspacing="0" align="center" style="text-align: center">
        <tr style="text-align: center">
            <td colspan="8">${requestScope.month}月份员工考勤记录</td>
        </tr>
        <tr>
            <td>考勤ID</td>
            <td>员工姓名</td>
            <td>月份</td>
            <td>上班日期</td>
            <td>上班时间</td>
            <td>下班时间</td>
            <td>迟到时间</td>
            <td>矿工时间</td>
        </tr>
        <c:forEach items="${requestScope.attendances2}" var="attendance">
            <tr>
                <td>${attendance.aId}</td>
                <td><c:forEach items="${requestScope.employees}" var="employee">
                    <c:if test="${employee.eId==attendance.eId}">
                        ${employee.eName}
                    </c:if>
                </c:forEach></td>
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
