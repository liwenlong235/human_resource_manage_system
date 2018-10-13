<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/11
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
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

    <script>
        $(function () {
            $("input").blur(function () {
                var $this = $(this);
                var value = $(this).val();
                if(value==null||value==""){
                    if(!($(".s1").length>0)){
                        $this.after("<span class='s1' style='color: red'>内容不能为空</span>");
                    }
                    $("#submit").attr("disabled","true");
                }else {
                    if($(".s1").val()!=null){
                        $(".s1").remove();
                    }
                    $("#submit").removeAttr("disabled");
                }
            })
        })
    </script>
</head>
<body style="text-align: center">
<form action="user/regist" method="post">
    <table border="0px" cellspacing="0px" align="center" style="text-align: center">
        <tr>
            <td>账  号</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>密  码</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td><input type="password" name="password1"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="submit" value="注册">
                <button><a href="user/jobInfo" style="text-decoration: none">返回</a></button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
