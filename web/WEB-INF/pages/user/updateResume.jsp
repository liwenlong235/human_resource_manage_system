<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/15
  Time: 12:04
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
            var pId = "${sessionScope.resume.position.pId}";
            $.ajax({
                url:"user/deptAjax",
                data:{"dId":dId},
                type:"post",
                dataType:"json",
                success:function (data) {
                    $(data).each(function (index,item) {
                        if(item.pId==pId){
                            $select.append("<option class='opt' value='"+item.pId+"' selected='selected'>"+item.pName+"</option>");
                        }
                        if(item.pId!=pId){
                            $select.append("<option class='opt' value='"+item.pId+"'>"+item.pName+"</option>");
                        }
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
            $("#submit").click(function () {
                var ip1 = $("#ip1").val();
                var ip2 = $("#ip2").val();
                var ip3 = $("#ip3").val();
                var ip4 = $("#ip4").val();
                var ip5 = $("#ip5").val();
                var ip6 = $("#ip6").val();
                var ip7 = $("#ip7").val();
                var ip8 = $("#ip8").val();
                var ip9 = $("#ip9").val();
                if(ip1==""||ip2==""||ip3==""||ip4==""||ip5==""||ip6==""||ip7==""||ip8==""||ip9==""){
                    alert("所填内容不能为空")
                    return false;
                }
                return true;
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
<form action="user/updateResume" method="post">
    <table border="2px" cellspacing="0px" cellpadding="16px" align="center" >
        <tr style="text-align: center">
            <td colspan="4"><h2>修改简历</h2></td>
        </tr>
        <tr>
            <td colspan="2">简历名称</td>
            <td colspan="2"><input id="ip1" type="text" name="rTitle" value="${sessionScope.resume.rTitle}"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input id="ip2" type="text" name="uName" value="${sessionScope.resume.uName}"></td>
            <td>性别</td>
            <c:if test="${sessionScope.resume.uGender=='男'}">
                <td><input type="radio" name="uGender" checked="true" value="男">男
                    <input type="radio" name="uGender" value="女">女
                </td>
            </c:if>
            <c:if test="${sessionScope.resume.uGender=='女'}">
                <td><input type="radio" name="uGender" value="男">男
                    <input type="radio" name="uGender" value="女" checked="true">女
                </td>
            </c:if>
        </tr>
        <tr>
            <td>出生年月</td>
            <td><input id="ip3" type="date" name="uBirth1" value="${sessionScope.resume.uBirth}"></td>
            <td>参加工作时间</td>
            <td><input id="ip4" type="date" name="firstWorkTime1" value="${sessionScope.resume.firstWorkTime}"></td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td><input id="ip5" type="tel" name="tel" value="${sessionScope.resume.tel}"></td>
            <td>电子邮箱</td>
            <td><input id="ip6" type="email" name="email" value="${sessionScope.resume.email}"></td>
        </tr>
        <tr>
            <td>应聘部门</td>
            <td><select name="deptId" id="s1">
                <option value="${sessionScope.resume.department.id}">${sessionScope.resume.department.name}</option>
                <c:forEach items="${sessionScope.departments}" var="department">
                    <c:if test="${department.name!=sessionScope.resume.department.name}">
                        <option value="${department.id}">${department.name}</option>
                    </c:if>
                </c:forEach>
            </select></td>
            <td>应聘职位</td>
            <td><select name="position" id="s2">
            </select></td>
        </tr>
        <tr>
            <td>期望薪资</td>
            <td><input id="ip7" type="number" name="expectSalary" value="${sessionScope.resume.expectSalary}"></td>
            <td>学历</td>
            <td><select name="education">
                <option>${sessionScope.resume.education}</option>
                <c:forEach items="${sessionScope.educations}" var="education">
                    <c:if test="${education!=sessionScope.resume.education}">
                        <option>${education}</option>
                    </c:if>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>工作经验</td>
            <td colspan="3"><input id="ip8" type="text" name="workExperience" value="${sessionScope.resume.workExperience}"></td>
        </tr>
        <tr>
            <td>兴趣爱好</td>
            <td colspan="3"><input id="ip9" type="text" name="hobbies" value="${sessionScope.resume.hobbies}"></td>
        </tr>
        <tr style="text-align: center">
            <td colspan="4"><input type="submit" id="submit">
                <button><a href="user/userInfo">返回</a></button></td>
        </tr>
    </table>
</form>
</body>
</html>
