<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 16:37
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
            var $select = $("#select2");
            var dId = $("#select1").val();
            var pValue = "${sessionScope.manager.pName}";
            $.ajax({
                url:"user/deptAjax",
                data:{"dId":dId},
                type:"post",
                dataType:"json",
                success:function (data) {
                    $select.append("<option class='opt'>"+pValue+"</option>");
                    $(data).each(function (index,item){
                        if(item.pName!=pValue){
                            $select.append("<option class='opt'>"+item.pName+"</option>");
                        }
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
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<form action="managers/managerUpdate" method="post">
    <table border="0px" cellpadding="15px" align="center" style="margin-top: 16%">
        <tr>
            <td>用户名</td>
            <td><input id="ip1" type="text" name="name" value="${sessionScope.manager.mName}"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input id="ip2" type="password" name="password" value="${sessionScope.manager.mPassword}"></td>
        </tr>
        <tr>
            <td>类型</td>
            <c:if test="${sessionScope.manager.type==0}">
                <td><input type="radio" name="type" checked="checked" value="0">管理员
                    <input type="radio" name="type" value="1">部门主管</td>
            </c:if>
            <c:if test="${sessionScope.manager.type==1}">
                <td><input type="radio" name="type" value="0">管理员
                    <input type="radio" name="type" checked="checked" value="1">部门主管</td>
            </c:if>
        </tr>
        <tr>
            <td>部门</td>
            <td><select name="dId" id="select1">
                <option value="${requestScope.mDepartment.id}">${sessionScope.manager.dName}</option>
                <c:forEach items="${sessionScope.departments}" var="department">
                    <c:if test="${sessionScope.manager.dName!=department.name}">
                        <option value="${department.id}">${department.name}</option>
                    </c:if>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>职位</td>
            <td><select id="select2" name="pName">
            </select></td>
        </tr>
        <tr style="text-align: center">
            <td colspan="2"><input id="submit" type="submit"></td>
        </tr>
    </table>
</form>
</body>
</html>
