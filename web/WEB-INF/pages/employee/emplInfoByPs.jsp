<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/20
  Time: 17:31
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
            var $select = $("#s2");
            var dId = $("#s1").val();
            $.ajax({
                url:"user/deptAjax",
                data:{"dId":dId},
                type:"post",
                dataType:"json",
                success:function (data) {
                    $(data).each(function (index,item) {
                        $select.append("<option class='opt' value='"+item.pId+"'>"+item.pName+"</option>");
                    })
                }
            })
            $("#s1").change(function () {
                var $select = $("#s2");
                var dId = $("#s1").val();
                $.ajax({
                    url:"user/deptAjax",
                    data:{"dId":dId},
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        $("#s2 option[class='opt']").remove();
                        $(data).each(function (index,item) {
                            $select.append("<option class='opt' value='"+item.pId+"'>"+item.pName+"</option>");
                        })
                    }
                })
            })
        })
    </script>
</head>
<body style="text-align: center">
<jsp:include page="emplBaseNav.jsp"/>
<form action="employee/emplInfoByPs" method="post">
    <table align="center">
        <tr>
            <td><select id="s1" name="dId">
                <c:forEach items="${requestScope.departments}" var="department">
                    <option value="${department.id}">${department.name}</option>
                </c:forEach>
            </select></td>
            <td><select id="s2" name="pId">
            </select>
            </td>
            <td><input type="submit"></td>
        </tr>
    </table>
</form>
<c:if test="${!empty requestScope.flag}">
    <c:if test="${empty requestScope.employees}">
        <h3 style="color: red">暂时没有相关信息</h3>
    </c:if>
    <c:if test="${!empty requestScope.employees}">
        <table border="2px" cellspacing="0" cellpadding="15px" align="center">
            <tr style="text-align: center">
                <td>ID</td>
                <td>姓名</td>
                <td>性别</td>
                <td>联系方式</td>
                <td>电子邮箱</td>
                <td>部门</td>
                <td>职位</td>
            </tr>
            <c:forEach items="${requestScope.employees}" var="employee">
                <tr>
                    <td>${employee.eId}</td>
                    <td>${employee.eName}</td>
                    <td>${employee.gender}</td>
                    <td>${employee.tel}</td>
                    <td>${employee.email}</td>
                    <td><c:forEach items="${sessionScope.departments}" var="department">
                        <c:if test="${department.id==employee.dId}">
                            ${department.name}
                        </c:if>
                    </c:forEach></td>
                    <td><c:forEach items="${sessionScope.positions}" var="position">
                        <c:if test="${position.pId==employee.pId}">
                            ${position.pName}
                        </c:if>
                    </c:forEach></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</c:if>
</body>
</html>
