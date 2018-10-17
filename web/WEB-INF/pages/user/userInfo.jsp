<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/15
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $(".button1").click(function () {
                var $this = $(this);
                var $td = $(this).parent().parent().children();
                var iId = $td[5].innerHTML;
                var flag = "yes";
                if(iId=="未邀请"){
                    alert("未收到面试邀请");
                    return false;
                }
                $.ajax({
                    url:"user/invitationAjax",
                    type:"post",
                    data:{"iId":iId,"flag":flag},
                    dataType:"text",
                    success:function (data) {
                        if(data=="OK"){
                            $this.parent().children()[1].attr("display","none");
                            $this.attr("disabled",true);
                        }else {
                            $this.attr("display","none");
                            $this.parent().children()[1].attr("disabled",true);
                        }
                    }
                })
                return false;
            })
            $(".button2").click(function () {
                var $this = $(this);
                var $td = $(this).parent().parent().children();
                var iId = $td[5].innerHTML;
                var flag = "no";
                if(iId=="未邀请"){
                    alert("未收到面试邀请");
                    return false;
                }
                $.ajax({
                    url:"user/invitationAjax",
                    type:"post",
                    data:{"iId":iId,"flag":flag},
                    dataType:"text",
                    success:function (data) {
                        $this.parent().children()[0].attr("display","none");
                        $this.attr("disabled",true);
                    }
                })
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
<body style="text-align: center">
<a href="user/userInfo" style="text-align: left"><h2>当前用户：${sessionScope.userL.name}</h2></a>
<h1>基本信息</h1>
    <table border="2px" cellspacing="0" cellpadding="10px" align="center">
        <tr>
            <td>账号：</td>
            <td>${sessionScope.userL.name}</td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>${sessionScope.userL.password}</td>
        </tr>
    </table><hr>
<h1>我的简历</h1>
<c:if test="${empty sessionScope.resume}">
    <h2 style="color: red">您没有创建简历</h2>
    <a href="user/resumeInput"><span style="color: red;text-decoration:underline;font-size: 20px">新建简历</span></a>
    <button><a href="user/jobs"><span style="text-decoration: none;font-size: 20px">返回</span></a></button>
</c:if>
<c:if test="${!empty sessionScope.resume}">
    <table border="2px" cellspacing="0px" cellpadding="13px" align="center">
        <input type="hidden" name="userId" value=""/>
        <tr>
            <td colspan="4" style="text-align: center">${sessionScope.resume.rTitle}</td>
        </tr>
        <tr>
            <td>姓名</td>
            <td>${sessionScope.resume.uName}</td>
            <td>性别</td>
            <td>${sessionScope.resume.uGender}</td>

        </tr>
        <tr>
            <td>出生年月</td>
            <td>${sessionScope.resume.uBirth}</td>
            <td>参加工作时间</td>
            <td>${sessionScope.resume.firstWorkTime}</td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td>${sessionScope.resume.tel}</td>
            <td>电子邮箱</td>
            <td>${sessionScope.resume.email}</td>
        </tr>
        <tr>
            <td>应聘部门</td>
            <td>${sessionScope.resume.department.name}</td>
            <td>应聘职位</td>
            <td>${sessionScope.resume.position.pName}</td>
        </tr>
        <tr>
            <td>期望薪资</td>
            <td>${sessionScope.resume.expectSalary}</td>
            <td>学历</td>
            <td>${sessionScope.resume.education}</td>
        </tr>
        <tr>
            <td>工作经验</td>
            <td colspan="3">${sessionScope.resume.workExperience}</td>
        </tr>
        <tr>
            <td>兴趣爱好</td>
            <td colspan="3">${sessionScope.resume.hobbies}</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center"><button><a href="user/resumeInput?rId=${sessionScope.resume.rId}">修改简历</a></button>
                <button><a href="user/jobs">返回</a></button></td>
        </tr>
    </table><hr>
</c:if>
<c:if test="${!empty sessionScope.commitRecords}">
    <table border="2px" cellspacing="0px" cellpadding="13px" align="center" style="text-align: center">
        <tr>
            <td colspan="6">职位申请记录表</td>
        </tr>
        <tr>
            <td>记录ID</td>
            <td>申请职位</td>
            <td>申请时间</td>
            <td>简历是否被阅读</td>
            <td>邀请面试</td>
            <td>是否面试</td>
        </tr>
    <c:forEach items="${sessionScope.commitRecords}" var="commitRecord">
        <tr>
            <input type="hidden" name="dId" value="${commitRecord.iId}"/>
            <td>${commitRecord.cId}</td>
            <c:forEach var="job" items="${sessionScope.jobs}">
                <c:if test="${job.jId==commitRecord.jId}">
                    <td>${job.position.pName}</td>
                </c:if>
            </c:forEach>
            <td><f:formatDate value="${commitRecord.commitTime}"/></td>
            <c:if test="${commitRecord.rStatus==false}">
                <td>未读</td>
            </c:if>
            <c:if test="${commitRecord.rStatus==true}">
                <td>已读</td>
            </c:if>
            <c:if test="${commitRecord.iId<=0}">
                <td>未邀请</td>
            </c:if>
            <c:if test="${commitRecord.iId>0}">
                <td>已邀请</td>
            </c:if>
            <td><button class="button1"><a href="">是</a></button>
                <button class="button2"><a href="">否</a></button></td>
        </tr>
    </c:forEach>
    </table>
</c:if>
</body>
</html>
