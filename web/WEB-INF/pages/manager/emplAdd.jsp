<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/17
  Time: 22:50
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
<body>
<jsp:include page="managerBaseNav.jsp"/>
<form action="managers/addEmpl" method="post">
    <table border="2px" cellspacing="0px" cellpadding="16px" align="center">
        <tr style="text-align: center"><td colspan="4"><h3>新增员工信息</h3></td></tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="eName"></td>
            <td>密码</td>
            <td><input type="text" name="ePassword" value="000000" readonly="readonly"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type="radio" name="gender" value="男" checked="checked">男
                <input type="radio" name="gender" value="女">女</td>
            <td>联系方式</td>
            <td><input type="tel" name="tel"></td>
        </tr>
        <tr>
            <td>电子邮箱</td>
            <td><input type="email" name="email"></td>
            <td>学历</td>
            <td><select name="education">
                <c:forEach items="${sessionScope.educations}" var="education">
                    <option>${education}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>部门</td>
            <td><select name="dId" id="s1">
                <c:forEach items="${sessionScope.departments}" var="department">
                    <option value="${department.id}">${department.name}</option>
                </c:forEach>
            </select></td>
            <td>职位</td>
            <td><select name="pId" id="s2"></select></td>
        </tr>
        <tr>
            <td>入职时间</td>
            <td><input type="date" name="entryTime"></td>
            <td>离职时间</td>
            <td><input type="date" name="dimissionTime" readonly="readonly"></td>
        </tr>
        <tr style="text-align: center"><td colspan="4"><input type="submit"></td></tr>
    </table>
</form>
</body>
</html>
