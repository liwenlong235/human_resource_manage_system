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
    <link href="/bootstrap/dist/bootstrap-table.min.css">
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
                        <li><a href="managers/managerUpdate">更改管理员</a></li>
                        <li><a href="managers/managerDelete">删除管理员</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="page2.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">员工管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/addEmpl">新增员工</a></li>
                        <li><a href="managers/emplInfo">查看员工信息</a></li>
                        <li><a href="managers/updateEmpl">更改员工信息</a></li>
                        <li><a href="managers/deleteEmpl">删除员工信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">考勤管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/queryMonthAttendance">查看当月考勤</a></li>
                        <li><a href="managers/queryEmplAttendance">查看员工当月考勤</a></li>
                        <li><a href="managers/updateEmplAttendance">修改员工考勤信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">工资管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/addSalary">新建工资记录</a></li>
                        <li><a href="managers/updateSalary">修改工资信息</a></li>
                        <li><a href="managers/deleteSalary">删除工资信息</a></li>
                        <li><a href="managers/queryMonthSalary">查看当月工资</a></li>
                        <li><a href="managers/queryEmplSalary">查看员工当月工资</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">培训管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/addTrain">新建培训信息</a></li>
                        <li><a href="managers/updateTrain">修改培训信息</a></li>
                        <li><a href="managers/deleteTrain">删除工资信息</a></li>
                        <li><a href="managers/queryDeptTrain">查看部门培训记录</a></li>
                        <li><a href="managers/queryEmplTrain">查看员工培训记录</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">面试信息管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="managers/queryCommit">查看申请简历</a></li>
                        <li><a href="managers/addInvitation">创建面试邀请</a></li>
                        <li><a href="managers/updateInvitation">更新面试信息</a></li>
                        <li><a href="managers/queryInvitation">查看面试信息</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>
