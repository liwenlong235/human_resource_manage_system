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
                            $("#submit1").removeAttr("disabled");
                        }
                    }
                })
            })
            $(":password[name='password']").blur(function () {
                var password = $(this).val();
                if(password==""||password==null){
                    $("#s2").css("disabled","inline");
                    $("#s2").text("密码不能为空");
                    $("#submit1").attr("disabled",true);
                }else {
                    $("#s2").text("");
                    $("#submit1").removeAttr("disabled");
                }
            })
            $(":password[name='password1']").blur(function () {
                var password = $(this).val();
                var password1 = $(":password[name='password']").val()
                if(password!=password1){
                    $("#s3").css("disabled","inline");
                    $("#s3").text("两次密码不一致");
                    $("#submit1").attr("disabled",true);
                }else {
                    $("#s3").text("");
                    $("#submit1").removeAttr("disabled");
                }
            })
            $("#submit1").click(function () {
                var name = $(":text[name='name']").val();
                var password = $(":password[name='password']").val();
                var password1 = $(":password[name='password1']").val();
                if(name!=""&&password!=""&&password1!=""){
                    $("#submit1").removeAttr("disabled");
                }else {
                    $("#submit1").attr("disabled",true);
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
    <form action="user/regist" method="post">
        <table border="0" cellspacing="10px" cellpadding="10px" align="center"style="margin-top: 15%">
            <tr>
                <td>账号</td>
                <td><input type="text" name="name"></td>
                <td><span id="s1"></span></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="password"></td>
                <td><span id="s2"></span></td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td><input type="password" name="password1"></td>
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
