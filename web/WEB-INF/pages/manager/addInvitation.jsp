<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/18
  Time: 14:03
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
            $("#submit").click(function () {
                var inviteTime = $("#ip1").val();
                var address = $("#p2").val();
                if(inviteTime!=""&&address!=""){
                    return true;
                }else if(inviteTime==""){
                    alert("面试时间不能为空");
                }else {
                    alert("面试地点不能为空")
                }
                return false;
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<form action="managers2/addInvitation" method="post">
    <table border="1px" cellspacing="0" cellpadding="15px" align="center">
        <input type="hidden" name="cId" value="${requestScope.cId}">
        <tr>
            <td>面试时间</td>
            <td><input id="ip1" type="date" name="inviteTime"></td>
        </tr>
        <tr>
            <td>部门主管</td>
            <td><select name="manager">
                <c:forEach items="${requestScope.managers}" var="manager">
                    <c:if test="${manager.type==1}">
                        <option>${manager.pName}</option>
                    </c:if>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>面试地点</td>
            <td><input id="ip2" type="text" name="address"></td>
        </tr>
        <tr><td colspan="2"><input type="submit" id="submit"></td></tr>
    </table>
</form>
</body>
</html>
