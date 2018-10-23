<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 9:57
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
<c:if test="${requestScope.award=='OK'}">
    <h3 style="color: lawngreen">奖励添加成功</h3>
</c:if>
<c:if test="${requestScope.awardUpdate=='OK'}">
    <h3 style="color: lawngreen">奖励修改成功</h3>
</c:if>
<c:if test="${requestScope.updateTrain=='OK'}">
    <h3 style="color: lawngreen">培训信息修改成功</h3>
</c:if>
<c:if test="${requestScope.addTrain=='OK'}">
    <h3 style="color: lawngreen">培训信息添加成功</h3>
</c:if>
<c:if test="${requestScope.salaryTime=='NG'}">
    <h3 style="color: lawngreen">还未到发放工资的时间，发放时间为每月5号</h3>
</c:if>
</body>
</html>
