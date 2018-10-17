<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/11
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <style>
        body{
            background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
            background-size: 100% 100%;
            text-align: center;
        }
        a{text-decoration: blink;  }
    </style>
</head>
<body>
<div style="margin-top: 20%">
<button><a href="user/loginInput">游客登陆</a></button>
<button><a href="user/registInput">游客注册</a></button><p/>
    <button><a href="employee/loginInput">员工登陆</a></button>
    <button><a href="managers/loginInput">管理员/主管登陆</a></button><p/>



</div>
</body>
</html>
