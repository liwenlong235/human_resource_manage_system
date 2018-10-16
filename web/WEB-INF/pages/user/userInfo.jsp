<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/15
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
</head>
<body style="text-align: center">
<h1>基本信息</h1>
    <table border="2px" cellspacing="0" cellpadding="10px" align="center">
        <tr>
            <td>账号：</td>
            <td>${sessionScope.userL.name}</td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>${sessionScope.userL.password}</td>
        </tr>
    </table>
<hr>
<h1>我的简历</h1>
<c:if test="${empty sessionScope.resume}">
    <h2 style="color: red">您没有创建简历</h2>
    <a href="user/resumeInput"><span style="color: red;font-size: 10px">新建简历</span></a>
    <button><a href="user/jobs">返回</a></button>
</c:if>
<c:if test="${!empty sessionScope.resume}">
    <table border="0px" cellspacing="0px" cellpadding="15px" align="center">
        <input type="hidden" name="userId" value=""/>
        <tr>
            <td colspan="4">${sessionScope.resume.rTitle}</td>
        </tr>
        <tr>
            <td>姓名</td>
            <td>${sessionScope.resume.uName}</td>
            <td>性别</td>
            <td>${sessionScope.resume.uGender}</td>

        </tr>
        <tr>
            <td>出生年月</td>
            <td>${sessionScope.resume.uBirth}</td>
            <td>参加工作时间</td>
            <td>${sessionScope.resume.firstWorkTime}</td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td>${sessionScope.resume.tel}</td>
            <td>电子邮箱</td>
            <td>${sessionScope.resume.email}</td>
        </tr>
        <tr>
            <td>应聘部门</td>
            <td>${sessionScope.resume.department.name}</td>
            <td>应聘职位</td>
            <td>${sessionScope.resume.position.pName}</td>
        </tr>
        <tr>
            <td>期望薪资</td>
            <td>${sessionScope.resume.expectSalary}</td>
            <td>学历</td>
            <td>${sessionScope.resume.education}</td>
        </tr>
        <tr>
            <td>工作经验</td>
            <td colspan="3">${sessionScope.resume.workExperience}</td>
        </tr>
        <tr>
            <td>兴趣爱好</td>
            <td colspan="3">${sessionScope.resume.hobbies}</td>
        </tr>
        <tr>
            <td colspan="4"><button><a href="user/resumeInput?rId=${sessionScope.resume.rId}">修改简历</a></button>
                <button><a href="user/jobs">返回</a></button></td>
        </tr>
    </table>
</c:if>
</body>
</html>
