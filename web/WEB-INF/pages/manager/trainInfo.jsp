<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/21
  Time: 12:03
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
            $(".delete").click(function () {
                var $td = $(this).parent().parent().children();
                var tId = $td[0].innerHTML;
                var flag = confirm("确定要删除这个培训信息吗？")
                if(flag){
                    $.ajax({
                        url:"managers3/deleteTrain",
                        type:"post",
                        dataType:"text",
                        data:{"tId":tId},
                        success:function (data) {
                            if (data == "OK") {
                                $td.remove();
                                alert("删除成功");
                            }else {
                                alert("不能删除");
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
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${empty requestScope.trains}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.trains}">
    <table border="2px" cellspacing="0" align="center" style="text-align: center">
        <tr>
            <td>培训ID</td>
            <td>培训主题</td>
            <td>部门</td>
            <td>职位</td>
            <td>培训时间</td>
            <td>修改</td>
            <td>删除</td>
        </tr>
        <c:forEach items="${requestScope.trains}" var="train">
            <tr>
                <td>${train.tId}</td>
                <td>${train.title}</td>
                <td><c:forEach items="${requestScope.departments}" var="department">
                    <c:if test="${department.id==train.dId}">
                        ${department.name}
                    </c:if>
                </c:forEach> </td>
                <td><c:if test="${train.pId==0}">
                    部门内所有职位
                </c:if>
                    <c:if test="${train.pId>0}">
                        <c:forEach items="${requestScope.positions}" var="position">
                            ${position.pName}
                        </c:forEach>
                    </c:if></td>
                <td><f:formatDate value="${train.startTime}"/></td>
                <td><a href="managers3/updateTrainInput?tId=${train.tId}">修改</a> </td>
                <td><a class="delete" href="">删除</a> </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>
