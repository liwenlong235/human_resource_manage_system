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
            var pId1 = "${requestScope.resume.position.pId}"
            $.ajax({
                url:"user/deptAjax",
                data:{"dId":dId},
                type:"post",
                dataType:"json",
                success:function (data) {
                    $(data).each(function (index,item) {
                        if(pId1==item.pId){
                            $select.append("<option class='opt' value='"+item.pId+"' selected='selected'>"+item.pName+"</option>");
                        }else {
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
                if(ip1==""||ip2==""||ip3==""||ip4==""||ip5==""){
                    alert("所填内容不能为空")
                    return false;
                }
                return true;
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty requestScope.resume}">
    <form action="managers/addEmpl" method="post">
        <table border="2px" cellspacing="0px" cellpadding="16px" align="center">
            <input type="hidden" name="rId" value="${requestScope.resume.rId}">
            <tr style="text-align: center"><td colspan="4"><h3>新增员工信息</h3></td></tr>
            <tr>
                <td>姓名</td>
                <td><input id="ip1" type="text" name="eName" value="${requestScope.resume.uName}"></td>
                <td>密码</td>
                <td><input id="ip2" type="text" name="ePassword" value="000000" readonly="readonly"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><c:if test="${requestScope.resume.uGender=='男'}">
                    <input type="radio" name="gender" value="男" checked="checked">男
                    <input type="radio" name="gender" value="女">女
                </c:if>
                    <c:if test="${requestScope.resume.uGender=='女'}">
                        <input type="radio" name="gender" value="男" >男
                        <input type="radio" name="gender" value="女" checked="checked">女
                    </c:if></td>
                <td>联系方式</td>
                <td><input id="ip3" type="tel" name="tel" value="${requestScope.resume.tel}"></td>
            </tr>
            <tr>
                <td>电子邮箱</td>
                <td><input id="ip4" type="email" name="email" value="${requestScope.resume.email}"></td>
                <td>学历</td>
                <td><select name="education">
                    <c:forEach items="${sessionScope.educations}" var="education">
                        <c:if test="${requestScope.resume.education==education}">
                            <option selected="selected">${education}</option>
                        </c:if>
                        <c:if test="${requestScope.resume.education!=education}">
                            <option>${education}</option>
                        </c:if>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>部门</td>
                <td><select name="dId" id="s1">
                    <c:forEach items="${sessionScope.departments}" var="department">
                        <c:if test="${department.id==requestScope.resume.department.id}">
                            <option value="${department.id}" selected="selected">${department.name}</option>
                        </c:if>
                        <c:if test="${department.id!=requestScope.resume.department.id}">
                            <option value="${department.id}">${department.name}</option>
                        </c:if>
                    </c:forEach>
                </select></td>
                <td>职位</td>
                <td><select name="pId" id="s2"></select></td>
            </tr>
            <tr>
                <td>入职时间</td>
                <td><input type="date" name="entryTime" id="ip5"></td>
                <td>离职时间</td>
                <td><input type="date" name="dimissionTime" readonly="readonly"></td>
            </tr>
            <tr style="text-align: center"><td colspan="4"><input type="submit" id="submit"></td></tr>
        </table>
    </form>
</c:if>
</body>
</html>
