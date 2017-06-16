<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="myTag" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
<link rel="stylesheet" href="${CTP}/resources/common/js/extends/layui/css/layui.css">
<link rel="stylesheet" href="${CTP_ADMIN}/css/role-list.css">   
<link rel="stylesheet" href="${CTP_ADMIN}/css/page.css"/> 
<link href="${CTP_ADMIN }/css/auth.css" rel="stylesheet" type="text/css" />
<link href="${CTP_ADMIN }/css/magic-check.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${CTP_ADMIN}/js/module/common.js"></script>

<script type="text/javascript">
var CTPPATH = "${pageContext.request.contextPath}";
var DEFAULT_USERNAME = "<shiro:principal/>";
</script>

</head>
<body>
<section class="dx-list-default">
	<div class="dx-operation-bar">
		<form class="layui-form">
			<div class="layui-form-item">
				<div class="layui-input-inline"> <input   placeholder="请输入用戶名" autocomplete="off" class="layui-input user-input"> </div>
			</div>
			
        </form>
		<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn  btn-yellow find">查询</button> 
					<button class="layui-btn layui-btn-danger delete">删除</button> 
				</div>
		</div>
		<form class="layui-form">
		<div class="layui-form-item">
		    <div class="layui-input-block">
		      <select name="interest"  class="select-category">
		      <c:forEach items="${typeList}" var="list">
		        <option value="${list.id}">${list.itemType}</option>
		      </c:forEach>
		      </select>
		    </div>
		 </div>	
		 </form>
		 <div class="layui-form-item item-right">
			<div class="layui-input-block"> <button class="layui-btn btn-simple-blue layui-btn-primary" id="add" dx-type="add" style="font-weight: bold">  <i class="layui-icon">&#xe608;</i> 新增 </button> </div>
		</div>
		
	</div>
	<table class="layui-table role-table">
		<thead>
			<tr>
				<th><input type="checkbox" class="checked_input"/></th>
				<th>标题</th>
				<th>内容</th>						
				<th>作者</th>
				<th>栏目</th>
				<th>发布时间</th>
				<th>状态</th>
				<th>浏览量</th>
				<th class="table-operation-box">操作</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="${list}" var="list"> 
			<tr>
				
				<td data-id="${list.id}"> <input type="checkbox" name="info_id" value="${list.id}"></td>
				<td>${list.itemTitle}</td>
				<td>${myTag:substr(list.itemContent,0,32,true)}</td>
				<td>${list.author}</td>
				<td>${list.articleType.itemType}</td>
				<td><fmt:formatDate value="${list.addTime}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:choose>
					 <c:when test="${list.isPublish eq 1}">发布</c:when>
					 <c:otherwise>草稿</c:otherwise>
					</c:choose>
				</td>
				<td>${list.viewCount}</td>
				<td class="table-operation-box">
				 <span class="table-operation user-update only-delete" dx-type="update" title="删除"><i class="layui-icon">&#xe640;</i></span> 
				 <span class="table-operation user-update only-select" dx-type="update" title="分配角色"><i class="layui-icon">&#xe620;</i></span>
				
				 </td>
			</tr>
		</c:forEach>
			
		</tbody>
		
	</table>
	<!-- 分页 -->
	${toolBar}
</section>
	
	
<!-- 弹窗 -->
<div class="mark"></div>
<div class="dialog">
     
        <div class="dialog-close" onclick="$('.mark,.dialog').hide();">
        <img src="${CTP_ADMIN}/image/close.png">
        </div> 
        <div class="dialog-title">
                                        分配角色
        </div> 
        <div class="dialog-content"> 
            <input type="hidden" class="hide-checked-id" value="">
            <div class="opt-div">
            <h4>请选择一个角色</h4>
			
			<c:forEach items="${roles}" var="role_list">
			<div class="opt">
				<input class="magic-radio" type="radio" name="radio" id="rr${role_list.id}" value="${role_list.id}">
				<label for="rr${role_list.id}">${role_list.roleName}</label>
			</div>
	     	</c:forEach>
            </div>
           
           <div class="active">
				<button  onclick="$('.mark,.dialog').hide();">关闭</button><button class="save">保存</button>
		  <br>
		   </div>
        </div>
</div> 
</body>
</html>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layui/layui.js"></script>
<script type="text/javascript">
layui.use(['layer','element','form'], function() {
    var element    = layui.element()
    ,layer      = layui.layer
    ,form       = layui.form   
    ,$          = layui.jquery;
    
   //监听下拉框选择，进行url跳转
   $(".select-category").change(function(){
	   var value = $(this).val();
	   alert(value);
   });
   
	
    
});
</script>