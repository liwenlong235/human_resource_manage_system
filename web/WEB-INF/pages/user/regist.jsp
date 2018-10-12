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
            $("input").blur(function () {
                var $this = $(this);
                var value = $(this).val();
                if(value==null||value==""){
                    $this.after("<span class='s1' style='color: red'>内容不能为空</span>")
                    $("#submit").attr("disabled","true");
                }else {
                    if($(".s1").val()!=null){
                        $(".s1").text("");
                    }
                    $("#submit").removeAttr("disabled");
                }
            })
        })
    </script>
</head>
<body>
<form action="user/regist" method="post">
    账号：<input type="text" name="name"><br>
        密码：<input type="password" name="password"><br>
        密码：<input type="password" name="password1"><br>
    <input type="submit" id="submit" value="注册">
    <button><a href="user/jobInfo" style="text-decoration: none">返回</a></button>
</form>
</body>
</html>
