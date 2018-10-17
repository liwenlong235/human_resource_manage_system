<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/15
  Time: 11:10
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
    <style>
        body{
            background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
            background-size: 100% 100%;
            text-align: center;
        }
    </style>
</head>
<body>
<form action="user/addResume" method="post">
    <table border="2px" cellspacing="0px" cellpadding="15px" align="center">
        <tr>
            <td colspan="2">简历名称</td>
            <td colspan="2"><input type="text" name="rTitle"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="uName"></td>
            <td>性别</td>
            <td><input type="radio" name="uGender" value="男" checked="true">男
                <input type="radio" name="uGender" value="女">女
            </td>
        </tr>
        <tr>
            <td>出生年月</td>
            <td><input type="date" name="uBirth1"></td>
            <td>参加工作时间</td>
            <td><input type="date" name="firstWorkTime1"></td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td><input type="tel" name="tel"></td>
            <td>电子邮箱</td>
            <td><input type="email" name="email"></td>
        </tr>
        <tr>
            <td>应聘部门</td>
            <td><select name="deptId" id="s1">
                <c:forEach items="${sessionScope.departments}" var="department">
                    <option value="${department.id}">${department.name}</option>
                </c:forEach>
            </select></td>
            <td>应聘职位</td>
            <td><select id="s2" name="position">
            </select></td>
        </tr>
        <tr>
            <td>期望薪资</td>
            <td><input type="number" name="expectSalary"></td>
            <td>学历</td>
            <td><select name="education">
                <c:forEach items="${sessionScope.educations}" var="education">
                    <option>${education}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>工作经验</td>
            <td colspan="3"><input type="text" name="workExperience"></td>
        </tr>
        <tr>
            <td>兴趣爱好</td>
            <td colspan="3"><input type="text" name="hobbies"></td>
        </tr>
        <tr>
            <td colspan="4"><input type="submit">
                <button><a href="/user/userInfo">返回</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
