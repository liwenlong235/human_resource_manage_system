<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/23
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $("#submit").click(function () {
                var company = $(":text[name='company']").val();
                var address = $(":text[name='address']").val();
                var duty = $(":text[name='duty']").val();
                var requirements = $(":text[name='requirements']").val();
                var salary = $("#ip1").val();
                if(company==""||address==""||duty==""||requirements==""||salary==""){
                    alert("所有内容都不能为空")
                    return false;
                }
                return true;
            })
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
<form action="managers2/addJob" method="post">
    <table border="2px" cellspacing="0" align="center" style="text-align: center">
        <tr>
            <td>部门</td>
            <td><select id="s1" name="dId">
                <c:forEach items="${requestScope.departments}" var="department">
                    <option value="${department.id}">${department.name}</option>
                </c:forEach>
            </select></td>
            <td>职位</td>
            <td><select name="pId" id="s2"></select></td>
        </tr>
        <tr>
            <td>公司</td>
            <td><input type="text" name="company"></td>
            <td>地址</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>岗位职责</td>
            <td><input type="text" name="duty"></td>
            <td>任职要求</td>
            <td><input type="text" name="requirements"></td>
        </tr>
        <tr>
            <td>薪水</td>
            <td colspan="3"><input name="salary" type="number" id="ip1"></td>
        </tr>
        <tr>
            <td colspan="4"><input type="submit" id="submit"></td>
        </tr>
    </table>
</form>
</body>
</html>
