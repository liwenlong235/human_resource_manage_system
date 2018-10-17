<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 11:31
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
        span{ color: red}
    </style>
    <script>
        $(function () {
            var $select = $("#select2");
            var dId = $("#select1").val();
            $.ajax({
                url:"user/deptAjax",
                data:{"dId":dId},
                type:"post",
                dataType:"json",
                success:function (data) {
                    $(data).each(function (index,item) {
                        $select.append("<option class='opt'>"+item.pName+"</option>");
                    })
                }
            })
            $("#select1").change(function () {
                var $select = $("#select2");
                var dId = $("#select1").val();
                $.ajax({
                    url:"user/deptAjax",
                    data:{"dId":dId},
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        $("#select2 option[class='opt']").remove();
                        $(data).each(function (index,item) {
                            $select.append("<option class='opt'>"+item.pName+"</option>");
                        })
                    }
                })
            })
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
                        }else if(data=="NG"){
                            $("#s1").text("账号已存在");
                            $("#submit").attr("disabled",true);
                        }else if(data=="OK"){
                            $("#s1").text("账号可以使用");
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
<form action="managers/regist" method="post">
    <table border="0px" cellpadding="15px" align="center" style="margin-top: 16%">
        <tr>
            <td>用户名</td>
            <td><input id="ip1" type="text" name="name"></td>
            <td><span id="s1"></span></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input id="ip2" type="password" name="password"></td>
            <td><span id="s2"></span></td>
        </tr>
        <tr>
            <td>类型</td>
            <td colspan="2"><input type="radio" name="type" checked="checked" value="0">管理员
                <input type="radio" name="type" value="1">部门主管</td>
        </tr>
        <tr>
            <td>部门</td>
            <td><select name="dId" id="select1">
                <c:forEach items="${sessionScope.departments}" var="department">
                    <option value="${department.id}">${department.name}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>职位</td>
            <td><select id="select2" name="pName">
            </select></td>
        </tr>
        <tr style="text-align: center">
            <td colspan="3"><input id="submit" type="submit" value="注册">
                <button><a href="/managers/loginInput" style="text-decoration: none;color: black">返回</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
