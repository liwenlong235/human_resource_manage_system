<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/23
  Time: 11:18
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
<c:if test="${empty requestScope.dissents}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.dissents}">
    <table border="2px" cellspacing="0" align="center" style="text-align: center">
        <tr>
            <td>复议记录ID</td>
            <td>工资ID</td>
            <td>复议内容</td>
            <td>是否同意</td>
        </tr>
        <c:forEach items="${requestScope.dissents}" var="dissent">
            <tr>
                <td>${dissent.dId}</td>
                <td>${dissent.sId}</td>
                <td>${dissent.dissent}</td>
                <td><c:if test="${dissent.agree==0}">未查阅</c:if>
                    <span style="color: lawngreen"><c:if test="${dissent.agree>0}">已同意<br>异议结果会下月工资中增加</c:if></span>
                    <span style="color: red"><c:if test="${dissent.agree<0}">异议被拒绝<br>若有疑问请及时联系管理员</c:if></span></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
