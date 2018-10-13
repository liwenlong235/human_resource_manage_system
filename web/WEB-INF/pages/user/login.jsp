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
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $("input").blur(function () {
                var $this = $(this);
                var value = $(this).val();
                if(value==null||value==""){
                    if(!($(".s1").length>0)){
                        $this.after("<br><span class='s1' style='color: red'>内容不能为空</span>");
                    }
                    $("#submit").attr("disabled","true");
                }else {
                    if($(".s1").val()!=null){
                        $(".s1").remove();
                    }
                    $("#submit").removeAttr("disabled");
                }
            })
        })
    </script>
  </head>
  <body>
  <form action="user/login" method="post">
    <table border="0px" cellspacing="0px" align="center" style="text-align: center">
      <c:if test="${empty requestScope.userR1}">
        <tr>
          <td>账  号</td>
          <td><input type="text" name="name"><br>
          </td>
        </tr>
        <tr>
          <td>密  码</td>
          <td><input type="password" name="password"></td>
        </tr>
      </c:if>
      <c:if test="${!empty requestScope.userR1}">
        <tr>
          <td colspan="2"><span style="color: lightgreen">注册成功，请登录</span></td>
        </tr>
        <tr>
          <td>账  号</td>
          <td><input type="text" name="name" value="${requestScope.userR1.name}"></td>
        </tr>
        <tr>
          <td>密  码</td>
          <td><input type="password" name="password" value="${requestScope.userR1.password}"></td>
        </tr>
      </c:if>
      <c:if test="${!empty requestScope.userL1}">
        <tr>
          <td colspan="2"><span>账号或密码错误</span></td>
        </tr>
      </c:if>
      <tr>
        <td colspan="2">
          <input type="submit" value="登陆">
          <button><a href="user/jobInfo" style="text-decoration: none">返回</a></button>
        </td>
      </tr>
    </table>
  </form>

  </body>
</html>
