<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/21
  Time: 10:41
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
            $("#button1").click(function () {
                var $td = $(this).parent().parent().children();
                var aId = $td[0].innerHTML;
                var flag = confirm("确定要删除这条记录吗？")
                if(flag){
                    $.ajax({
                        url:"managers/deleteAward",
                        data:{"aId":aId},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                $td.remove();
                                alert("删除成功")
                            }
                        }
                    })
                }
            })
        })
    </script>
</head>
<body style="text-align: center">
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${empty requestScope.awards}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.awards}">
    <table border="2px" cellspacing="0px" align="center">
        <tr>
            <td colspan="7"><h3>奖赏记录表</h3></td>
        </tr>
        <tr>
            <td>记录ID</td>
            <td>员工ID</td>
            <td>奖励金额</td>
            <td>奖励说明</td>
            <td>创建时间</td>
            <td>修改</td>
            <td>删除</td>
        </tr>
        <c:forEach items="${requestScope.awards}" var="award">
            <tr>
                <td>${award.aId}</td>
                <td>${award.eId}</td>
                <td>${award.money}</td>
                <td>${award.reason}</td>
                <td><f:formatDate value="${award.createTime}"/></td>
                <td><button><a href="managers/updateAwardInput?aId=${award.aId}">修改</a></button></td>
                <td><button id="button1">删除</button></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
