<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/20
  Time: 11:27
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
            $("#button1").click(function () {
                $.ajax({
                    url:"employee/addAttendance",
                    type:"post",
                    dateType:"text",
                    success:function (data) {
                        if(data=="weekend"){
                            alert("休息日不用打卡，好好休息吧！！！")
                        }else if(data=="NG"){
                            alert("上班打卡信息已存在，请勿重复打卡")
                        }else {
                            alert("上班打卡成功，祝您工作愉快！！！")
                        }
                    }
                })
                return false;
            })
            $("#button2").click(function () {
                var flag = confirm("下班时间为下午6点，确认要打卡吗？");
                if(flag){
                    $.ajax({
                        url:"employee/updateAttendance",
                        type:"post",
                        dateType:"text",
                        success:function (data) {
                            if(data=="weekend"){
                                alert("休息日不用打卡，好好休息吧！！！")
                            }else if(data=="null"){
                                alert("没有上班打卡信息，请先打上班卡")
                            }else if(data=="OK"){
                                alert("下班打卡成功，祝您下班愉快！！！")
                            }else {
                                alert("下班打信息已存在，请勿重复打卡")
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
<jsp:include page="emplBaseNav.jsp"/>
<c:if test="${!empty requestScope.trains}">
    <h3 style="color: red">部门有培训信息，请及时查看</h3>
</c:if>
<c:if test="${!empty requestScope.work}">
    <button id="button1" style="background: yellowgreen"><h3>上班打卡</h3></button><br>
    <button id="button2" style="background: yellowgreen"><h3>下班打卡</h3></button>
</c:if>
<c:if test="${!empty requestScope.emplInfo}">
    <table border="2px" cellspacing="0" cellpadding="15px" align="center">
        <tr>
            <td colspan="4">个人基本信息</td>
        </tr>
        <tr>
            <td>姓名</td>
            <td>${sessionScope.employee.eName}</td>
            <td>密码</td>
            <td>${sessionScope.employee.ePassword}</td>
        </tr>
        <tr>
            <td>性别</td>
            <td>${sessionScope.employee.gender}</td>
            <td>学历</td>
            <td>${sessionScope.employee.education}</td>
        </tr>
        <tr>
            <td>联系电话</td>
            <td>${sessionScope.employee.tel}</td>
            <td>邮箱</td>
            <td>${sessionScope.employee.email}</td>
        </tr>
        <tr>
            <td>部门</td>
            <td><c:forEach items="${requestScope.departments}" var="department">
                <c:if test="${sessionScope.employee.dId==department.id}">
                    ${department.name}
                </c:if>
            </c:forEach></td>
            <td>职位</td>
            <td><c:forEach items="${requestScope.positions}" var="position">
                <c:if test="${sessionScope.employee.pId==position.pId}">
                    ${position.pName}
                </c:if>
            </c:forEach> </td>
        </tr>
        <tr>
            <td>入职日期</td>
            <td>${sessionScope.employee.entryTime}</td>
            <td>离职日期</td>
            <td>${sessionScope.employee.dimissionTime}</td>
        </tr>
    </table>
</c:if>
</body>
</html>
