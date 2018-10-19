<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/11
  Time: 17:16
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
            $("#button1").click(function () {
                var jId = $("#input1").val();
                var rId = "${sessionScope.resume.rId}";
                if(rId<=0){
                    alert("请先创建简历");
                }else {
                    $.ajax({
                        url:"user/commit",
                        type:"post",
                        data:{"jId":jId,"rId":rId},
                        dataType:"text",
                        success:function (data) {
                            if(data=="OK"){
                                alert("提交成功");
                            }else {
                                alert("您已申请这个职位，请勿重复申请");
                            }
                        }
                    })
                }
                return false;
            })
        })
    </script>
    <style>
        body{
            background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
            background-size: 100% 100%;
            text-align: center;
        }
        td{width: 15%}
    </style>
</head>
<body style="font-size: 30px;">
    <c:if test="${!empty requestScope.job}">
        <input id="input1" type="hidden" value="${requestScope.job.jId}">
        <table border="0px" cellpadding="10px" cellspacing="0px" align="center" style="margin-top: 10%;width: 45%">
            <tr>
                <td><h2>${requestScope.job.position.pName}</h2></td>
                <td><h2 style="color: red">${requestScope.job.salaryRange}元/月</h2></td>
                <td><button id="button1"><a href=""><h2>立即申请</h2></a></button></td>
            </tr>
            <tr>
                <td>${requestScope.job.company}</td>
                <td>${requestScope.job.address}</td>
                <td><f:formatDate value="${requestScope.job.pubdate}"/></td>
            </tr>
            <tr>
                <td colspan="3"><hr></td></tr>
            <tr>
            <tr>
                <td colspan="3"><h4>职位描述</h4></td></tr>
            <tr>
                <td colspan="3">1、岗位职责：<br>${requestScope.job.duty}</td>
            </tr>
            <tr>
                <td colspan="3">2、任职要求：<br>${requestScope.job.requirements}</td>
            </tr>
            <tr>
                <td colspan="3"><hr></td></tr>
            <tr>
            <tr>
                <td>工作地址</td>
                <td colspan="3">${requestScope.job.address}</td>
            </tr>
            <tr>
                <td colspan="3"><hr></td></tr>
            <tr>
        </table>
    </c:if>
    <button><a href="/user/jobs"><span style="font-size: 20px">返回</span></a></button></td>
</body>
</html>
