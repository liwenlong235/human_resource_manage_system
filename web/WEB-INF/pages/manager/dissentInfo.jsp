<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/23
  Time: 11:18
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
            $(".a1").click(function () {
                var $td = $(this).parent().parent().children();
                var dId = $td[0].innerHTML;
                var str = prompt("输入反馈金额");
                if(str!=null&&str!=""){
                    $.ajax({
                        url:"managers3/updateDissent",
                        data:{"dId":dId,"str":str},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                alert("更新成功");
                            }else {
                                alert("已更新，请勿重复提交")
                            }
                        }
                    })
                }
            })
            $(".a2").click(function () {
                var $td = $(this).parent().parent().children();
                var dId = $td[0].innerHTML;
                var str = confirm("确认拒绝申请吗")
                if(str){
                    $.ajax({
                        url:"managers3/updateDissent",
                        data:{"dId":dId,"flag":-1},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                alert("已拒绝此复议");
                            }else {
                                alert("已拒绝，请勿重复提交")
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
<c:if test="${empty requestScope.dissents}">
    <h3 style="color: red">暂时没有相关信息</h3>
</c:if>
<c:if test="${!empty requestScope.dissents}">
    <table>
        <tr>
            <td>复议记录ID</td>
            <td>工资ID</td>
            <td>复议内容</td>
            <td>是否同意</td>
        </tr>
        <c:forEach items="${requestScope.dissents}" var="dissent">
            <tr>
                <td>${dissent.dId}</td>
                <td>${dissent.sId}</td>
                <td>${dissent.dissent}</td>
                <td><a class="a1" href="#">是</a>
                <a class="a2" href="#">否</a></td>
            </tr>
        </c:forEach>
    </table>

</c:if>
</body>
</html>
