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
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link href="/bootstrap/css/tableexport.css">
    <link href="/bootstrap/dist/bootstrap-table.min.css">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>

    <script src="/bootstrap/js/Blob.js/Blob.js"></script>
    <script src="/bootstrap/js/FileSaver.js/FileSaver.js"></script>
    <script src="/bootstrap/js/js-xlsx/xlsx.core.min.js"></script>

    <script src="/bootstrap/js/Bootstrap/bootstrap.min.js"></script>
    <script src="/bootstrap/js/TableExport.js/jquery.tableexport.js"></script>
    <script src="/bootstrap/dist/bootstrap-table.min.css"></script>
    <script src="/bootstrap/dist/bootstrap-table-export.min.js"></script>
    <script src="/bootstrap/dist/locale/bootstrap-table-zh-CN.min.js"></script>

    <script>
        $(function () {
            $(":text[name='name']").blur(function () {
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
                            $("#submit1").attr("disabled",false);
                        }
                    }
                })
            })
            $(":password[name='password']").blur(function () {
                var password = $(this).val();
                if(password==""||password==null){
                    $("#s2").text("密码不能为空");
                    $("#submit1").attr("disabled",true);
                }else {
                    $("#s2").text("");
                    $("#submit1").attr("disabled",false);
                }
            })
            $(":password[name='password1']").blur(function () {
                var password = $(this).val();
                var password1 = $(":password[name='password']").val()
                if(password!=password1){
                    $("#s3").text("两次密码不一致");
                    $("#submit1").attr("disabled",true);
                }else {
                    $("#s3").text("");
                    $("#submit1").attr("disabled",false);
                }
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
<div style="height: 100%;width: 100%;">
    <form action="user/regist" method="post">
        <ul style="list-style-type: none;margin-top: 20%">
            <li>账号：<input type="text" name="name" >
                <span id="s1"></span></li><p/>
            <li>密码：<input type="password" name="password">
                <span id="s2"></span></li><p/>
            <li>确认密码：<input type="password" name="password1">
                <span id="s3"></span></li><p/>
            <li><input type="submit" id="submit1" value="注册">
                <button><a href="user/begin" style="text-decoration: none;color: black">返回</a></button></li>
        </ul>
    </form>
</div>
</body>
</html>
