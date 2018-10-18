<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            var $select = $("#select2");
            var dId = $("#select1").val();
            var pValue = $("#input").val();
            var pId1 = "${requestScope.employee.pId}";
            $.ajax({
                url:"user/deptAjax",
                data:{"dId":dId},
                type:"post",
                dataType:"json",
                success:function (data) {
                    $select.append("<option class='opt' value='"+pId1+"'>"+pValue+"</option>");
                    $(data).each(function (index,item){
                        if(item.pName!=pValue){
                            $select.append("<option class='opt' value='"+item.pId+"'>"+item.pName+"</option>");
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
                            $select.append("<option class='opt'value='"+item.pId+"'>"+item.pName+"</option>");
                        })
                    }
                })
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty requestScope.eployee}">
    <form action="managers/updateEmpl" method="post">
        <table border="2px" cellspacing="0px" cellpadding="16px" align="center">
            <input type="hidden" name="eId" value="${requestScope.employee.eId}">
            <tr><td colspan="4"><h3>修改员工信息</h3></td></tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="eName" value="${requestScope.employee.eName}"></td>
                <td>密码</td>
                <td><input type="text" name="ePassword" value="${requestScope.employee.ePassword}"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><c:if test="${requestScope.employee.gender=='男'}">
                    <input type="radio" name="gender" value="男" checked="checked">男
                    <input type="radio" name="gender" value="女">女
                </c:if>
                    <c:if test="${requestScope.employee.gender=='女'}">
                        <input type="radio" name="gender" value="男">男
                        <input type="radio" name="gender" value="女" checked="checked">女
                    </c:if>
                </td>
                <td>联系方式</td>
                <td><input type="tel" name="tel" value="${requestScope.employee.tel}"></td>
            </tr>
            <tr>
                <td>电子邮箱</td>
                <td><input type="email" name="email" value="${requestScope.employee.email}"></td>
                <td>学历</td>
                <td><select name="education">
                    <option>${requestScope.employee.education}</option>
                    <c:forEach items="${sessionScope.educations}" var="education">
                        <c:if test="${education!=requestScope.employee.education}">
                            <option>${education}</option>
                        </c:if>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>部门</td>
                <td><select name="dId" id="select1">
                    <c:forEach items="${sessionScope.departments}" var="department">
                        <c:if test="${requestScope.employee.dId==department.id}">
                            <option selected="selected" value="${department.id}">${department.name}</option>
                        </c:if>
                        <c:if test="${requestScope.employee.dId!=department.id}">
                            <option value="${department.id}">${department.name}</option>
                        </c:if>
                    </c:forEach>
                </select></td>
                <td>职位</td>
                <td><select name="pId" id="select2">
                    <c:forEach items="${sessionScope.positions}" var="position">
                        <c:if test="${position.pId==requestScope.employee.pId}">
                            <input id="input" type="hidden" value="${position.pName}">
                        </c:if>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>入职时间</td>
                <td><input type="date" name="entryTime" value="${requestScope.employee.entryTime}"></td>
                <td>离职时间</td>
                <td><input type="date" name="dimissionTime" value="${requestScope.employee.dimissionTime}"></td>
            </tr>
            <tr><td colspan="4"><input type="submit"></td></tr>
        </table>
    </form>
</c:if>
</body>
</html>
