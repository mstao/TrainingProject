<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
<link rel="stylesheet" href="${CTP}/resources/common/js/extends/layui/css/layui.css">
<link rel="stylesheet" href="${CTP_ADMIN}/css/role-list.css">    
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${CTP_ADMIN}/js/module/common.js"></script>

<script type="text/javascript">
var CTP_PATH = "${pageContext.request.contextPath}";
var DEFAULT_USERNAME = "<shiro:principal/>";
</script>
</head>
<body>
<section class="dx-list-default">
	
	<table class="layui-table role-table">
		<thead>
			<tr>
				<th>序号</th>
				<th>value</th>
				<th>permission</th>
		
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="${resources}" var="list" varStatus="xh"> 
		<tr>
			<td>${xh.count}</td>
			<td>${list.value}</td>
			<td>${list.permission }</td>
			
     	</tr>
		
        </c:forEach>
			
		</tbody>
	</table>

</section>
</body>
</html>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layui/layui.js"></script>
<script type="text/javascript">
layui.use(['layer','element','form'], function() {
    var element    = layui.element()
    ,layer      = layui.layer
    ,form       = layui.form   
    ,$          = layui.jquery;
});
</script>