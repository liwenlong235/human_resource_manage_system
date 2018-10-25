<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $(".delete").click(function () {
                var $td = $(this).parent().parent().children();
                var id = $td[0].innerHTML;
                var name = $td[1].innerHTML;
                var flag = confirm("确定要删除"+name+"的信息吗？")
                if(flag){
                    $.ajax({
                        url:"managers/deleteEmpl",
                        type:"post",
                        dataType:"text",
                        data:{"id":id},
                        success:function (data) {
                            if (data == "OK") {
                                alert("删除成功");
                                $td.remove();
                            }else {
                                alert("该员工是在职状态，不能删除");
                            }
                        }
                    })
                }
                return false;
            })
        })
    </script>
</head>
<body style="text-align: center">
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty requestScope.flagU}"><h3 style="color: lawngreen">更新成功！</h3></c:if>
<c:if test="${requestScope.flagA=='no'}"><h3 style="color: red">添加失败，存在同名用户</h3></c:if>
<c:if test="${requestScope.flagA=='ok'}"><h3 style="color: lawngreen">添加成功！</h3></c:if>
<c:if test="${empty sessionScope.employees}"><h3 style="color: red">暂时没有相关信息</h3></c:if>
<c:if test="${!empty sessionScope.employees}">
    <table border="2px" cellspacing="0" cellpadding="15px" align="center">
        <tr style="text-align: center">
            <td>ID</td>
            <td>姓名</td>
            <td>密码</td>
            <td>性别</td>
            <td>联系方式</td>
            <td>电子邮箱</td>
            <td>部门</td>
            <td>职位</td>
            <td>入职时间</td>
            <td>离职时间</td>
            <td>学历</td>
            <td>修改</td>
            <td>删除</td>
            <td>奖赏</td>
        </tr>
        <c:forEach items="${sessionScope.employees}" var="employee">
            <tr>
                <td>${employee.eId}</td>
                <td>${employee.eName}</td>
                <td>${employee.ePassword}</td>
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
                <td><f:formatDate value="${employee.entryTime}"/></td>
                <td><f:formatDate value="${employee.dimissionTime}"/></td>
                <td>${employee.education}</td>
                <td><a href="managers/emplInput?id=${employee.eId}">修改</a></td>
                <td><a class="delete" href="managers/deleteEmpl">删除</a></td>
                <td><a href="managers/addAwardInpu?eId=${employee.eId}">奖励</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
