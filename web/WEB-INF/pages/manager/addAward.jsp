<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/21
  Time: 10:07
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
                var money = $("#ip1").val();
                var reason = $("#p2").val();
                if(money!=""&&reason!=""){
                    return true;
                }else if(money==""){
                    alert("奖赏金额不能为空");
                }else {
                    alert("奖赏说明不能为空")
                }
                return false;
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<form action="managers/addAward" method="post">
    <table border="2px" cellspacing="0" align="center">
        <tr>
            <td colspan="2"><h3>新增奖励表</h3></td>
        </tr>
        <tr>
            <td>员工ID</td>
            <td><input type="text" name="eId" value="${requestScope.eId}"></td>
        </tr>
        <tr>
            <td>奖赏金额</td>
            <td><input id="ip1" type="number" name="money"></td>
        </tr>
        <tr>
            <td>奖赏说明</td>
            <td><input id="ip2" type="text" name="reason"> </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" id="submit"></td>
        </tr>
    </table>
</form>
</body>
</html>
