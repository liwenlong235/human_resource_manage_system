<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/19
  Time: 14:39
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
                            $("#s1").css("color","red");
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
                            $("#submit1").attr("disabled",true);
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty requestScope.department}">
    <form action="managers2/departmentUpdate" method="post">
        <table border="2px" cellspacing="0px" cellpadding="20px" align="center" style="text-align: center">
            <input type="hidden" name="id" value="${requestScope.department.id}">
            <tr>
                <td>修改部门</td>
                <td><input id="input1" type="text" name="deptName" value="${requestScope.department.name}"></td>
            </tr>
            <tr><td colspan="2"><input id="submit1" type="submit">
                <button><a href="/managers2/departmentInfo">返回</a></button></td></tr>
        </table>
    </form>
</c:if>
<c:if test="${!empty requestScope.position}">
    <form action="managers2/positionUpdate" method="post">
        <table border="2px" cellspacing="0px" cellpadding="20px" align="center" style="text-align: center">
            <input type="hidden" name="pId" value="${requestScope.position.pId}">
            <tr>
                <td>更新部门</td>
                <td><select name="dId">
                    <c:forEach items="${requestScope.departments}" var="department">
                        <c:if test="${department.id==requestScope.positon.dId}">
                            <option value="${department.id}" selected="selected">${department.name}</option>
                        </c:if>
                        <c:if test="${department.id!=requestScope.positon.dId}">
                            <option value="${department.id}">${department.name}</option>
                        </c:if>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>更新职位</td>
                <td><input id="input2" type="text" name="pName" value="${requestScope.position.pName}"></td>
            </tr>
            <tr><td colspan="2"><input id="submit2" type="submit">
                <button><a href="/managers2/departmentInfo">返回</a></button></td></tr>
        </table>
    </form>
</c:if>
</body>
</html>
