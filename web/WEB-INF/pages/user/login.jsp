<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/11
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
    <base href="${pageContext.request.contextPath}/">
  </head>
  <body>
  <form action="user/login" method="post">
    <c:if test="${empty requestScope.userR1}">
      账号：<input type="text" name="name"><br>
      密码：<input type="password" name="password"><br>
    </c:if>
    <c:if test="${!empty requestScope.userR1}">
      账号：<input type="text" name="name" value="${requestScope.userR1.name}"><br>
      密码：<input type="password" name="password" value="${requestScope.userR1.password}"><br>
      <span style="color: lightgreen">注册成功，请登录</span><br>
    </c:if>
    <c:if test="${!empty requestScope.userL1}">
      <span>账号或密码错误</span><br>
    </c:if>
    <input type="submit" value="登陆">
    <button><a href="user/jobInfo" style="text-decoration: none">返回</a></button>
  </form>

  </body>
</html>
