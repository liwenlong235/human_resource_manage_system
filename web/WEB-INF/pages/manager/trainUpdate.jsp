<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/21
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            var $select = $("#s2");
            var dId = "${requestScope.train.dId}";
            var pId = "${requestScope.train.pId}";
            $.ajax({
                url:"user/deptAjax",
                data:{"dId":dId},
                type:"post",
                dataType:"json",
                success:function (data) {
                    if(pId==0){
                        $select.append("<option class='opt' value='0' selected='selected'>全部职位</option>");
                    }else {
                        $(data).each(function (index,item){
                            if(item.pId==pId){
                                $select.append("<option class='opt' value='"+item.pId+"' selected='selected'>"+item.pName+"</option>");
                            }
                            if(item.pId!=pId){
                                $select.append("<option class='opt' value='"+item.pId+"'>"+item.pName+"</option>");
                            }
                        })
                    }
                }
            })
            $("#s1").change(function () {
                var $select = $("#s2");
                var dId = $("#s1").val();
                $.ajax({
                    url:"user/deptAjax",
                    data:{"dId":dId},
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        $("#select2 option[class='opt']").remove();
                        $select.append("<option class='opt' value='0'>全部职位</option>");
                        $(data).each(function (index,item) {
                            $select.append("<option class='opt'value='"+item.pId+"'>"+item.pName+"</option>");
                        })
                    }
                })
            })
            $("#submit").click(function () {
                var title = $("#ip1").val();
                var time = $("#p2").val();
                if(time!=""&&title!=""){
                    return true;
                }else if(title==""){
                    alert("培训主题不能为空");
                }else {
                    alert("培训时间不能为空")
                }
                return false;
            })
        })
    </script>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<c:if test="${!empty requestScope.train}">
    <form action="managers3/updateTrain" method="post">
        <table border="2px" cellspacing="0" align="center">
            <tr style="text-align: center">
                <td colspan="2">修改培训表单</td>
            </tr>
            <input type="hidden" name="tId" value="${requestScope.train.tId}">
            <tr>
                <td>培训主题</td>
                <td><input id="ip1" type="text" name="title" value="${requestScope.train.title}"></td>
            </tr>
            <tr>
                <td>培训时间</td>
                <td><input id="ip2" type="date" name="time" value="${requestScope.train.startTime}"></td>
            </tr>
            <tr>
                <td>培训部门</td>
                <td><select id="s1" name="dId">
                    <c:forEach items="${requestScope.departments}" var="department">
                        <c:if test="${department.id==requestScope.train.dId}">
                            <option value="${department.id}" selected="selected">${department.name}</option>
                        </c:if>
                        <c:if test="${department.id!=requestScope.train.dId}">
                            <option value="${department.id}">${department.name}</option>
                        </c:if>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>选择职位</td>
                <td><select id="s2" name="pId"></select></td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2"><input id="submit" type="submit"></td>
            </tr>
        </table>
    </form>
</c:if>
</body>
</html>
