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
<div style="margin-top: 15%">
<button><a href="user/loginInput"><h4>游客登陆</h4></a></button>&nbsp;
<button><a href="user/registInput"><h4>游客注册</h4></a></button><p/>
    <button><a href="employee/loginInput"><h4>员工登陆</h4></a></button>
    <button><a href="managers/loginInput"><h4>管理员/主管登陆</h4></a></button><p/>



</div>
</body>
</html>
