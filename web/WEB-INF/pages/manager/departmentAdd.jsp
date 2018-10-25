<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/19
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $("#input1").blur(function () {
                var dName = $(this).val();
                var flag = "dept";
                $.ajax({
                    url:"managers2/deptAjax",
                    type:"post",
                    data:{"name":dName,"flag":flag},
                    dataType:"text",
                    success:function (data) {
                        if(data=="null"){
                            alert("内容不能为空");
                            $("#submit1").attr("disabled",true);
                        }else if(data=="OK"){
                            $("#submit1").attr("disabled",false);
                        }else {
                            alert("名字已存在");
                            $("#submit1").attr("disabled",true);
                        }
                    }
                })
            })
            $("#input2").blur(function () {
                var pName = $(this).val();
                $.ajax({
                    url:"managers2/deptAjax",
                    type:"post",
                    data:{"name":pName},
                    dataType:"text",
                    success:function (data) {
                        if(data=="null"){
                            alert("内容不能为空");
                            $("#submit2").attr("disabled",true);
                        }else if(data=="OK"){
                            $("#submit2").attr("disabled",false);
                        }else {
                            alert("名字已存在");
                            $("#submit2").attr("disabled",true);
                        }
                    }
                })
            })
            $("#submit1").click(function () {
                var ip1 = $("#input1").val();
                if(ip1==""){
                    alert("内容不能为空")
                    return false;
                }
                return true;
            })
            $("#submit2").click(function () {
                var ip2 = $("#input2").val();
                if(ip2==""){
                    alert("内容不能为空")
                    return false;
                }
                return true;
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${requestScope.flag=='dept'}">
    <form action="managers2/addDepartment" method="post">
        <table border="2px" cellspacing="0px" cellpadding="20px" align="center" style="text-align: center">
            <tr>
                <td>输入新增部门</td>
                <td><input id="input1" type="text" name="deptName"></td>
            </tr>
            <tr><td colspan="2"><input id="submit1" type="submit"></td></tr>
        </table>
    </form>
</c:if>
<c:if test="${requestScope.flag=='position'}">
    <form action="managers2/addPosition" method="post">
        <table border="2px" cellspacing="0px" cellpadding="20px" align="center" style="text-align: center">
            <tr>
                <td>部门</td>
                <td><select name="dId">
                    <c:forEach items="${requestScope.departments}" var="department">
                        <option value="${department.id}">${department.name}</option>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>输入新增职位</td>
                <td><input id="input2" type="text" name="pName"></td>
            </tr>
            <tr><td colspan="2"><input id="submit2" type="submit"></td></tr>
        </table>
    </form>
</c:if>
</body>
</html>
