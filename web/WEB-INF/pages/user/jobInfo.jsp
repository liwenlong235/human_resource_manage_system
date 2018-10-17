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
    <style>
        ul{  list-style-type: none;  }
        div{  height: 80px;  width: 100%;  text-align: center;  }
        .li1{  float: left;  width: 33%;  }
    </style>
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
    </style>
</head>
<body style="font-size: 30px;">
    <c:if test="${!empty requestScope.job}">
        <input id="input1" type="hidden" value="${requestScope.job.jId}">
        <div style="height: 100px;">
            <ul>
                <li class="li1"><h1>${requestScope.job.position.pName}</h1></li>
                <li class="li1"><h1 style="color: red">${requestScope.job.salaryRange}元/月</h1></li>
                <li class="li1"><button id="button1"><a href=""><h1>立即申请</h1></a></button></li></ul></div>
        <div>
            <ul>
                <li class="li1" style="display: block">${requestScope.job.company}</li>
                <li class="li1">${requestScope.job.address}</li>
                <li class="li1"><f:formatDate value="${requestScope.job.pubdate}"/></li>
            </ul></div>
        <div style="text-align: left;margin-left: 10%">
            <ul>
                <li><h3>职位描述</h3></li>
                <ul>
                    <li>岗位职责：<br>
                        <ol><li>${requestScope.job.duty}</li></ol>
                    </li>
                    <li>
                        任职要求：<br>
                        <ol><li>${requestScope.job.requirements}</li></ol>
                    </li></ul>
            </ul>
            <ul><li>${requestScope.job.address}</li></ul>
        </div>
    </c:if>
    <button><a href="/user/jobs">返回</a></button></td>
</body>
</html>
