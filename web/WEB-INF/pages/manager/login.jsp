<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <base href="${pageContext.request.contextPath}/">
    <style>
        body{  background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
            background-size: 100% 100%;  }
        span{ color:red;}
    </style>
    <script>
        $(function () {
            $("#ip1").blur(function () {
                var name = $(this).val();
                $.ajax({
                    url:"managers/nameAjax",
                    data:{"name":name},
                    type:"post",
                    dataType:"text",
                    success:function (data) {
                        if(data=="null"){
                            $("#s1").text("账号不能为空");
                            $("#submit").attr("disabled",true);
                        }else if(data=="OK"){
                            $("#s1").text("账号不存在");
                            $("#submit").attr("disabled",true);
                        }else {
                            $("#s1").text("账号存在");
                            $("#s1").css("color","lightgreen");
                            $("#submit").attr("disabled",false);
                        }
                    }
                })
            })
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
<body>
<form action="managers/login" method="post">
    <table border="0px" cellpadding="15px" align="center" style="margin-top: 16%">
        <c:if test="${!empty requestScope.managerR}">
            <tr><td colspan="3"><h4 style="color: lightgreen">注册成功，请登录</h4></td></tr>
        </c:if>
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
        <tr>
            <td>类型</td>
            <td colspan="2"><input type="radio" name="type" checked="checked" value="0">管理员
                <input type="radio" name="type" value="1">部门主管</td>
        </tr>
        <c:if test="${!empty requestScope.flag}">
            <tr style="text-align: center"><td colspan="3"><span>密码或类型错误，登陆失败</span></td></tr>
        </c:if>
        <tr style="text-align: center">
            <td colspan="3"><input type="submit" id="submit" value="登陆">
                <button><a href="managers/registInput" style="text-decoration: none;color: black">注册</a></button>
                <button><a href="user/begin" style="text-decoration: none;color: black">返回</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
