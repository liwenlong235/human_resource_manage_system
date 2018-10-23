<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/19
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $(".delete1").click(function () {
                var $td = $(this).parent().parent().children();
                var dId = $td[0].innerHTML;
                var flag = confirm("确定要删除这个部门吗?");
                if(flag){
                    $.ajax({
                        url:"managers2/deptDelete",
                        data:{"dId":dId},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                $td.remove();
                                alert("删除成功")
                            }else {
                                alert("删除失败，请先确认该部门没有职位后在进行删除操作")
                            }
                        }
                    })
                }
                return false;
            })
            $(".delete2").click(function () {
                var $td = $(this).parent().parent().children();
                var pId = $td[0].innerHTML;
                var flag = confirm("确定要删除这个职位吗?");
                if(flag){
                    $.ajax({
                        url:"managers2/positionDelete",
                        data:{"pId":pId},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                $td.remove();
                                alert("删除成功")
                            }else {
                                alert("删除失败，请先确认该职位没有员工后再进行删除操作")
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
<c:if test="${requestScope.flagP=='OK'}">
    <h3 style="color: lawngreen">职位更新成功</h3>
</c:if>
<c:if test="${requestScope.flagP=='NG'}">
    <h3 style="color: red">职位更新失败，该职位还有员工存在</h3>
</c:if>
<c:if test="${requestScope.flagD=='OK'}">
    <h3 style="color: lawngreen">部门更新成功</h3>
</c:if>
<c:if test="${requestScope.flagD=='NG'}">
    <h3 style="color: red">部门更新失败，该职位还有职位存在</h3>
</c:if>
<c:if test="${!empty requestScope.departments}">
    <table border="2px" cellspacing="0px" cellpadding="15px" align="center" style="text-align: center">
        <tr>
            <td>部门编号</td>
            <td>部门名称</td>
            <td>创建时间</td>
            <td>修改部门</td>
            <td>删除部门</td>
        </tr>
        <c:forEach items="${requestScope.departments}" var="department">
            <tr>
                <td>${department.id}</td>
                <td>${department.name}</td>
                <td><f:formatDate value="${department.createTime}"/></td>
                <td><a class="edit1" href="managers2/updateDeptInput?dId=${department.id}">修改</a></td>
                <td><a class="delete1" href="">删除</a></td>
            </tr>
        </c:forEach>
    </table><hr>
</c:if>
<c:if test="${!empty requestScope.positions}">
    <table border="2px" cellspacing="0px" cellpadding="15px" align="center" style="text-align: center">
        <tr>
            <td>职位编号</td>
            <td>职位名称</td>
            <td>部门编号</td>
            <td>创建时间</td>
            <td>修改职位</td>
            <td>删除职位</td>
        </tr>
        <c:forEach items="${requestScope.positions}" var="position">
            <tr><td>${position.pId}</td>
                <td>${position.pName}</td>
                <td>${position.dId}</td>
                <td><f:formatDate value="${position.createTime}"/></td>
                <td><a class="edit2" href="managers2/updateDeptInput?pId=${position.pId}">修改</a></td>
                <td><a class="delete2" href="">删除</a></td></tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
