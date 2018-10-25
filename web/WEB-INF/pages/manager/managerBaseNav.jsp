<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/10
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link href="/bootstrap/css/tableexport.css">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>

    <script src="/bootstrap/js/Blob.js/Blob.js"></script>
    <script src="/bootstrap/js/FileSaver.js/FileSaver.js"></script>
    <script src="/bootstrap/js/js-xlsx/xlsx.core.min.js"></script>

    <script src="/bootstrap/js/Bootstrap/bootstrap.min.js"></script>
    <script src="/bootstrap/js/TableExport.js/jquery.tableexport.js"></script>
    <script src="/bootstrap/dist/bootstrap-table.min.css"></script>
    <script src="/bootstrap/dist/bootstrap-table-export.min.js"></script>
    <script src="/bootstrap/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <base href="${pageContext.request.contextPath}/">
    <script>
        $(function () {
            $("#ul1 li a").each(function () {
                var $this = $(this);
                if($this[0].href==String(window.location)){
                    $("#ul1 li").removeClass("active");
                    $this.parent().addClass("active");  //active表示被选中效果的类名
                }
            }) 
        })
    </script>
    <style>
        nav{  background: url('${pageContext.request.contextPath}/img/img1.jpg') repeat-x;  }
        body{
            background: url('${pageContext.request.contextPath}/img/img1.jpg') no-repeat;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" style="background-color: lightgoldenrodyellow">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <c:if test="${!empty sessionScope.manager}">
                <h4 style="color:red;">当前用户：${sessionScope.manager.mName}</h4>
                <a href="/managers/loginInput"><h4>切换账号</h4></a>
            </c:if>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="ul1">
                <li class="dropdown"><a href="user/userInfo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理员<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/managerInfo">查看管理员</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="page2.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">员工管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/queryPass">查看可入职员工信息</a></li>
                        <li><a href="managers/emplInfo">查看全部员工信息</a></li>
                        <li><a href="managers/emplInfoByInput">查看指定条件的员工信息</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="page2.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">部门管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers2/departmentInfo">查看部门职位信息</a></li>
                        <li><a href="managers2/addDeptInput?dId=1">新增部门</a></li>
                        <li><a href="managers2/addDeptInput">新增职位</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">考勤管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers3/queryAttendances">查看全部考勤</a></li>
                        <li><a href="/managers3/queryAttendanceInput">按条件查询考勤</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="user/userInfo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">奖惩管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/awardInfo">查看奖励记录</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="user/userInfo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">培训管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers3/addTrainInput">新增培训</a></li>
                        <li><a href="managers3/trainInfo">查看培训信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">工资管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers3/addSalary">发放工资</a></li>
                        <li><a href="managers3/querySalary">查看工资信息</a></li>
                        <li><a href="managers3/queryDissent">查看工资异议信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">面试信息管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers2/queryCommit">查看申请简历</a></li>
                        <li><a href="managers2/invitationInfo">查看面试信息</a></li>
                        <li><a href="managers2/addJobInput">创建招聘信息</a></li>
                        <li><a href="managers2/jobsInfo">查看招聘信息</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><button><a href="user/begin"><h4>退出</h4></a></button></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>
