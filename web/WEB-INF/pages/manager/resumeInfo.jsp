<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/18
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty requestScope.resume}">
    <table border="2px" cellspacing="0px" cellpadding="13px" align="center">
        <input type="hidden" name="userId" value=""/>
        <tr>
            <td colspan="4" style="text-align: center">${requestScope.resume.rTitle}</td>
        </tr>
        <tr>
            <td>姓名</td>
            <td>${requestScope.resume.uName}</td>
            <td>性别</td>
            <td>${requestScope.resume.uGender}</td>

        </tr>
        <tr>
            <td>出生年月</td>
            <td>${requestScope.resume.uBirth}</td>
            <td>参加工作时间</td>
            <td>${requestScope.resume.firstWorkTime}</td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td>${requestScope.resume.tel}</td>
            <td>电子邮箱</td>
            <td>${requestScope.resume.email}</td>
        </tr>
        <tr>
            <td>应聘部门</td>
            <td>${requestScope.resume.department.name}</td>
            <td>应聘职位</td>
            <td>${requestScope.resume.position.pName}</td>
        </tr>
        <tr>
            <td>期望薪资</td>
            <td>${requestScope.resume.expectSalary}</td>
            <td>学历</td>
            <td>${requestScope.resume.education}</td>
        </tr>
        <tr>
            <td>工作经验</td>
            <td colspan="3">${requestScope.resume.workExperience}</td>
        </tr>
        <tr>
            <td>兴趣爱好</td>
            <td colspan="3">${requestScope.resume.hobbies}</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center"><button><a href="managers2/queryCommit">返回</a></button></td>
        </tr>
    </table><hr>
</c:if>
</body>
</html>
