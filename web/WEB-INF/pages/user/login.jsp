<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/11
  Time: 15:13
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
            $("#ip2").blur(function () {
                var password = $(this).val();
                if(password==""||password==null){
                    $("#s2").text("密码不能为空");
                    $("#submit").attr("disabled",true);
                }else {
                    $("#s2").text("");
                    $("#submit").attr("disabled",false);
                }
            })
            $("#ip3").blur(function () {
                var name = $(this).val();
                $.ajax({
                    url:"user/ajaxName",
                    data:{"name":name},
                    type:"post",
                    dataType:"text",
                    success:function (data) {
                        if(data=="null"){
                            $("#s3").text("账号不能为空");
                            $("#submit").attr("disabled",true);
                        }else if(data=="OK"){
                            $("#s3").text("账号不存在");
                            $("#submit").attr("disabled",true);
                        }else {
                            $("#s3").text("账号存在");
                            $("#s3").css("color","lightgreen");
                            $("#submit").attr("disabled",false);
                        }
                    }
                })
            })
            $("#ip4").blur(function () {
                var password = $(this).val();
                if(password==""||password==null){
                    $("#s4").text("密码不能为空");
                    $("#submit").attr("disabled",true);
                }else {
                    $("#s4").text("");
                    $("#submit").attr("disabled",false);
                }
            })
        })
    </script>
    <style>
      span{ color: red;  }
      .setpg{
        height: 100%;width: 100%;
      }
       body{
         background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
         background-size: 100% 100%;
         text-align: center;
       }
      li{
        height: 20px;
      }
    </style>
  </head>
  <body>
  <div class="setpg">
    <form action="user/login" method="post">
      <ul style="list-style-type: none;margin-top: 20%;">
        <c:if test="${empty requestScope.userR}">
          <li>账号：<input id="ip1" type="text" name="name">
            <span id="s1"></span></li><p/>
          <li>密码：<input id="ip2" type="password" name="password">
            <span id="s2"></span></li><p/>
        </c:if>
        <c:if test="${!empty requestScope.userR}">
          <li><h1 style="color: lightgreen">恭喜您，注册成功</h1></li><p/>
          <li>账号：<input id="ip3" type="text" name="name" value="${requestScope.userR.name}">
            <span id="s3"></span></li><p/>
          <li>密码：<input id="ip4" type="password" name="password" value="${requestScope.userR.password}">
            <span id="s4"></span></li><p/>
        </c:if>
        <c:if test="${!empty requestScope.userL1}">
          <li><h2 style="color: red">登陆失败，密码错误</h2></li><p/>
        </c:if>
        <li><input type="submit" id="submit" value="登陆">
          <button><a href="user/begin" style="text-decoration: none;color: black">返回</a></button></li>
      </ul>
    </form>
  </div>

  </body>
</html>
