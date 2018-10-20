<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/20
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <style>
        span{ color:red;}
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $("#submit").click(function () {
                var password1= $("#ip1").val();
                var password2 = $("#ip2").val();
                var password3 = $("#ip3").val();
                if(password1!=""&&password2!=""&&password3!=""){
                    return true;
                }else if(password1==""){
                    $("#s1").text("账号不能为空");
                }else if(password2==""){
                    $("#s2").text("密码不能为空");
                }else {
                    $("#s3").text("确认密码不能为空");
                }
                return false;
            })
            $("#ip3").blur(function () {
                var password1 = $("#ip2").val();
                var password2 = $("#ip3").val();
                if(password1!=password2){
                    $("#s3").text("两次密码不一致");
                    $("#submit").attr("disabled",true);
                }else {
                    $("#s3").text("");
                    $("#submit").removeAttr("disabled");
                }
            })
        })
    </script>
</head>
<body>
<jsp:include page="emplBaseNav.jsp"/>
<form action="employee/updateEmpl" method="post">
    <table border="0px" cellpadding="15px" align="center" style="margin-top: 16%">
        <tr>
            <td>原密码</td>
            <td><input id="ip1" type="password" name="password1"></td>
            <td><span id="s1"></span></td>
        </tr>
        <tr>
            <td>新密码</td>
            <td><input id="ip2" type="password" name="password2"></td>
            <td><span id="s2"> </span></td>
        </tr>
        <tr>
            <td>确认新密码</td>
            <td><input id="ip3" type="password" name="password3"></td>
            <td><span id="s3"> </span></td>
        </tr>
        <c:if test="${!empty requestScope.flag}">
            <tr><td colspan="3"><span>原密码错误，修改失败</span></td></tr>
        </c:if>
        <tr style="text-align: center">
            <td colspan="3"><input type="submit" id="submit">
                <button><a href="user/begin" style="text-decoration: none;color: black">返回</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
