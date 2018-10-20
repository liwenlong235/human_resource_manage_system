<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 99234
  Date: 2018/10/20
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="managerBaseNav.jsp"/>
<form action="managers/employeeInfo" method="post">
    <table>
        <tr>
            <td><select id="select1" name="dId">
                <c:formatDate value="${requestScope.departments}" var="department">
                    <option value="${department.id}">${department.name}</option>
                </c:formatDate>
            </select></td>
            <td><select id="select2" name="pId">

            </select>

            </td>
        </tr>
    </table>
</form>
</body>
</html>
