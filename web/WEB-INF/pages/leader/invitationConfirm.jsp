<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/19
  Time: 0:29
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
            $(".button1").click(function () {
                var $td = $(this).parent().parent().children();
                var iId = $td[0].innerHTML;
                var flag = "yes";
                $.ajax({
                    url:"managers2/invitationAjax",
                    type:"post",
                    data:{"iId":iId,"flag":flag},
                    dataType:"text",
                    success:function (data) {
                        if(data=="OK"){
                            $td.remove();
                            alert("面试已通过");
                        }
                    }
                })
                return false;
            })
            $(".button2").click(function () {
                var $td = $(this).parent().parent().children();
                var iId = $td[0].innerHTML;
                var flag = "no";
                $.ajax({
                    url:"managers2/invitationAjax",
                    type:"post",
                    data:{"iId":iId,"flag":flag},
                    dataType:"text",
                    success:function (data) {
                        if(data=="NG"){
                            $td.remove();
                            alert("面试未通过");
                        }
                    }
                })
                return false;
            })
        })
    </script>
</head>
<body>
<jsp:include page="leaderBaseNav.jsp"/>
<c:if test="${!empty requestScope.invitations}">
    <table border="2px" cellspacing="0" cellpadding="15px" align="center">
        <tr>
            <td>面试Id</td>
            <td>提交记录</td>
            <td>面试时间</td>
            <td>面试官</td>
            <td>面试地址</td>
            <td>是否同意面试<br>(1同意/0不同意/-1未查看)</td>
            <td>是否通过面试</td>
        </tr>
        <c:forEach items="${requestScope.invitations}" var="invitation">
            <c:if test="${invitation.manager==sessionScope.leader.pName}">
                <tr>
                    <td>${invitation.iId}</td>
                    <td>${invitation.cId}</td>
                    <td><f:formatDate value="${invitation.inviteTime}"/></td>
                    <td>${invitation.manager}</td>
                    <td>${invitation.address}</td>
                    <td>${invitation.confirmed}</td>
                    <td><button class="button1" ><a href="">是</a></button>
                        <button class="button2" ><a href="">否</a></button></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
