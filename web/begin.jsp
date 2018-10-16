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
<jsp:include page="baseNav.jsp"/>
<div style="margin-top: 20%">
<button><a href="user/loginInput">登陆</a></button><br>
<button><a href="user/registInput">注册</a></button><br>
<button><a href="user/info">查看</a></button><br>

</div>
</body>
</html>
