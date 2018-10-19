<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/18
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $(".button2").click(function () {
                var $this = $(this);
                var $s1 = $(".button1");
                var $td = $(this).parent().parent().children();
                var id = $td[0].innerHTML;
                $.ajax({
                    url:"managers2/commitAjax",
                    data:{"id":id},
                    type:"post",
                    dataType:"text",
                    success:function (data) {
                        if(data=="ok"){
                            alert("已经拒绝邀请，按钮被禁用");
                            $s1.attr("disabled",true);
                            $this.attr("disabled",true);
                        }
                    }
                })
                return false;
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${empty sessionScope.commitRecords}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty sessionScope.commitRecords}">
    <table border="2px" cellspacing="0" cellpadding="15x" align="center">
        <tr>
            <td>记录ID</td>
            <td>应聘职位</td>
            <td>简历信息</td>
            <td>投递时间</td>
            <td>邀请面试</td>
        </tr>
        <c:forEach var="commit" items="${sessionScope.commitRecords}">
            <tr>
                <td>${commit.cId}</td>
                <td><c:forEach var="job" items="${sessionScope.jobs}">
                    <c:if test="${job.jId==commit.jId}">
                        ${job.position.pName}
                    </c:if>
                </c:forEach></td>
                <td><a href="managers2/resumeInfo?rId=${commit.rId}">点击查看简历</a></td>
                <td><f:formatDate value="${commit.commitTime}"/></td>
                <td><button class="button1"><a href="managers2/addInvitationInput?cId=${commit.cId}">是</a></button>
                <button class="button2"><a href="">否</a></button></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
