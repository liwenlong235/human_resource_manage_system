<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/22
  Time: 20:12
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
            $(".dissent").click(function () {
                var $this = $(this);
                var $td = $(this).parent().parent().children();
                var sId = $td[0].innerHTML;
                var dissent = prompt("输入异议内容");
                if(dissent!=null&&dissent!=""){
                    $.ajax({
                        url:"employee/dissentAdd",
                        data:{"dissent":dissent,"sId":sId},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                alert("已提交复议申请");
                            }else {
                                alert("请勿重复提交");
                            }
                        }
                    })
                }else {
                    alert("异议内容为空，异议无效")
                }
                return false;
            })
        })
    </script>
</head>
<body style="text-align: center">
<jsp:include page="emplBaseNav.jsp"/>
<c:if test="${empty requestScope.salaries}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.salaries}">
    <table border="2px" cellspacing="0" align="center" style="text-align: center">
        <tr>
            <td>工资ID</td>
            <td>发放月份</td>
            <td>员工ID</td>
            <td>员工姓名</td>
            <td>基本工资</td>
            <td>奖金</td>
            <td>应减金额</td>
            <td>补发工资</td>
            <td>实发工资</td>
            <td>工资反馈</td>
            <td>是否有异议</td>
        </tr>
        <c:forEach items="${requestScope.salaries}" var="salary">
            <tr>
                <td>${salary.sId}</td>
                <td>${salary.sMonth}</td>
                <td>${salary.eId}</td>
                <td>${salary.eName}</td>
                <td>${salary.sBasic}</td>
                <td>${salary.bonus}</td>
                <td>${salary.sDeduct}</td>
                <td>${salary.backPay}</td>
                <td>${salary.sReal}</td>
                <td>${salary.remarks}</td>
                <td><a class="dissent" href="">异议</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
