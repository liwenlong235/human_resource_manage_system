<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/20
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <style>
        body{  background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
            background-size: 100% 100%;  }
        span{ color:red;}
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $("#submit").click(function () {
                var name = $("#ip1").val();
                var password = $("#ip2").val();
                if(name!=""&&password!=""){
                    return true;
                }else if(name==""){
                    $("#s1").text("账号不能为空");
                }else{
                    $("#s2").text("密码不能为空");
                }
                return false;
            })
        })
    </script>
</head>
<body style="text-align: center">
<c:if test="${!empty requestScope.updateFlag}">
    <h3 style="color: lawngreen;">密码修改成功，请重新登陆</h3>
</c:if>
<form action="employee/login" method="post">
    <table border="0px" cellpadding="15px" align="center" style="margin-top: 16%">
        <tr>
            <td>用户名</td>
            <td><input id="ip1" type="text" name="name"></td>
            <td><span id="s1"> </span></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input id="ip2" type="password" name="password"></td>
            <td><span id="s2"> </span></td>
        </tr>
        <c:if test="${requestScope.flag=='NG'}">
            <tr style="text-align: center"><td colspan="3"><span style="color: red">账号或密码错误</span></td></tr>
        </c:if>
        <c:if test="${requestScope.flag=='overtime'}">
            <tr style="text-align: center"><td colspan="3"><span style="color: red">该员工已离职，不能登陆</span></td></tr>
        </c:if>
        <tr style="text-align: center">
            <td colspan="3"><input type="submit" id="submit">
                <button><a href="user/begin" style="text-decoration: none;color: black">返回</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
