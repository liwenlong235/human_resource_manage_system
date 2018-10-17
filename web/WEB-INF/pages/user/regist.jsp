<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/11
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $("#ip1").blur(function () {
                var name = $(this).val();
                $.ajax({
                    url:"user/ajaxName",
                    data:{"name":name},
                    type:"post",
                    dataType:"text",
                    success:function (data) {
                        if(data=="null"){
                            $("#s1").text("账号不能为空");
                            $("#submit1").attr("disabled",true);
                        }else if(data=="NG"){
                            $("#s1").text("账号已存在");
                            $("#submit1").attr("disabled",true);
                        }else {
                            $("#s1").text("账号可以使用");
                            $("#s1").css("color","lightgreen");
                            $("#submit1").removeAttr("disabled");
                        }
                    }
                })
            })
            $("#submit1").click(function () {
                var password = $("#ip2").val();
                var password1 = $("#ip3").val();
                if(password!=password1){
                    $("#s3").text("两次密码不一致");
                    return false;
                }
                $("#s2").text("密码不能为空");
                if(password!=""&&password1!=""&password==password1){
                    $("#s2").text("");
                    return true;
                }
                return false;
            })
        })
    </script>
    <style>
        span{ color: red;  }
         body{
             background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
             background-size: 100% 100%;
             text-align: center;
         }
    </style>
</head>
<body>
    <form action="user/regist" method="post">
        <table border="0" cellpadding="15px" align="center"style="margin-top: 15%">
            <tr>
                <td>账号</td>
                <td><input id="ip1" type="text" name="name"></td>
                <td><span id="s1"></span></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input id="ip2" type="password" name="password"></td>
                <td><span id="s2"></span></td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td><input id="ip3" type="password" name="password1"></td>
                <td><span id="s3"></span></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center"><input type="submit" id="submit1" value="注册">
                    <button><a href="user/begin" style="text-decoration: none;color: black">返回</a></button></td>
            </tr>
        </table>
    </form>
</body>
</html>
