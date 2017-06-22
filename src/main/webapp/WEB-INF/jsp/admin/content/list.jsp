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
<link href="${CTP}/resources/common/js/extends/select-tether/dist/css/select-theme-dark.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${CTP_ADMIN}/js/module/common.js"></script>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/select-tether/js/tether.js"></script>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/select-tether/dist/js/select.min.js"></script>

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
				<div class="layui-input-inline"> <input   placeholder="请输入文章标题" autocomplete="off" class="layui-input article-input"> </div>
			</div>
			
        </form>
		<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn  btn-yellow find">查询</button> 
					<button class="layui-btn layui-btn-danger delete">删除</button> 
				</div>
		</div>

		 <div class="layui-form-item item-right">
			<div class="layui-form-item">
		    <div class="layui-input-block">
		      <select name="interest"  class="select-category">
		      <option value="-1">--选择栏目--</option>
		      <c:forEach items="${typeList}" var="list">
		       
		        <option value="${list.id}">${list.itemType}</option>
		      </c:forEach>
		      </select>
		    </div>
		 </div>	
		</div>
		
	</div>
	<table class="layui-table article-table">
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
				<td>${myTag:substr(list.itemTitle,0,20,true)}</td>
				<td>${myTag:substr(list.itemContent,0,20,true)}</td>
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
				 <span class="table-operation update-article-btn" data-id="${list.id}" title="编辑"><i class="layui-icon">&#xe642;</i>   </span>
				 <span class="table-operation user-update only-delete" dx-type="update" title="删除"><i class="layui-icon">&#xe640;</i></span> 
				
				 </td>
			</tr>
		</c:forEach>
			
        <c:if test="${empty list}">
           <tr>
           	<td colspan="9">暂无内容</td>
           </tr>
        </c:if> 			
		</tbody>
		
	</table>
	<!-- 分页 -->
	${toolBar}
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
    
    
    $('select.select-category').each(function(){
		new Select({
			el: this,
			selectLikeAlignment: $(this).attr('data-select-like-alignement') || 'auto',
			className: 'select-theme-dark'
		});
	});
    
   var sub=function(str,Len){
		var maxLen=Len;
		var len=str.length;
		if(len>maxLen){
		    //此时需要截取
			return str.substring(0,maxLen)+"...";
		}else{
			return str;
		}
   } 
   //监听下拉框选择，进行url跳转
   $(".select-category").change(function(){

	   var value = $(this).val();
	   if(value > 0){
		   window.location.href=CTPPATH+"/admin/article/list?typeId="+value+"&p=1";
	   }else if(value == -1){
		   window.location.href=CTPPATH+"/admin/article/list?p=1";
	   }
   });

	 //格式化时间     - 年月日
	 function showLocale(ds){
	 	
	     date = new Date(ds);
	     var seperator1 = "-";
	     var month = date.getMonth() + 1;
	     var strDate = date.getDate();
	     if (month >= 1 && month <= 9) {
	         month = "0" + month;
	     }
	     if (strDate >= 0 && strDate <= 9) {
	         strDate = "0" + strDate;
	     }
	     
	    var hh = date.getHours();
	 	if(hh<10) hh = '0' + hh;
	 	var mm = date.getMinutes();
	 	if(mm<10) mm = '0' + mm;
	 	var ss = date.getSeconds();
	 	if(ss<10) ss = '0' + ss;
	 	
	 	
	    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
	     
	    return currentdate;
	 }
	 
    //批量删除
	$(".delete").bind("click",function(){
		var t=document.getElementsByName("info_id");
		var ids = "";
       for (var i = 0; i < t.length; i++) {
           if (t[i].checked) {
           	ids +=t[i].value+',';
           }
       }
       ids = ids.substring(0, ids.length - 1);
       if(ids==""){
      	 layer.msg("请选择您要删除的选项");
       }else{
         layer.confirm('确定删除所选择的记录？', {
 			  btn: ['确定','取消'] 
 			}, function(){
 				//已选定，可以进行批量删除操作
 				//调用Ajax向后台发送请求 ，删除所选项
 				
 				$.ajax({
					type:'post',
					dataType:'text',
					url:CTPPATH+"/admin/article/delete",
					data:{"ids":ids},
				
					beforeSend:function(){
						//显示正在加载
						layer.load(1,{offset: 10,time:2000});
					},
					success:function(data){
	
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						
						if(data==1){
							layer.msg('删除成功', {icon: 1,time:2000});
							window.location.href=CTPPATH+"/admin/article/list?p=1";
						
						}else{
							layer.msg("删除出错了", {icon: 2,time:2000});
						}
					},
					error:function(){
	
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						layer.msg("出错了", {icon: 2,time:2000});
					}
				});
 				
 			   //end
 			}, function(){
 			    //取消操作 ，这里可以为空
 			});
      	
       }
		
	});
	
	
	
	//单项删除
	$(document).on("click",".only-delete",function(){
		//获取id的值
		var id=$(this).parent().parent().children().eq(0).find("input").val();
		if(id==""){
          	 layer.msg("请选择您要删除的选项");
           }else{
             layer.confirm('确定删除所选择的记录？', {
     			  btn: ['确定','取消'] 
     			}, function(){
     				//已选定，可以进行批量删除操作
     				//调用Ajax向后台发送请求 ，删除所选项
     				
     				$.ajax({
						type:'post',
						dataType:'text',
						url:CTPPATH+"/admin/article/delete",
						data:{"ids":id},
					
						beforeSend:function(){
							//显示正在加载
							layer.load(1,{offset: 10,time:2000});
						},
						success:function(data){
		
							//关闭正在加载
							setTimeout(function(){
								  layer.closeAll('loading');
							}, 1000);
							
							if(data==1){
								layer.msg('删除成功', {icon: 1,time:2000});
								window.location.href=CTPPATH+"/admin/article/list?p=1";
							
							}else{
								layer.msg("删除出错了", {icon: 2,time:2000});
							}
						},
						error:function(){
		
							//关闭正在加载
							setTimeout(function(){
								  layer.closeAll('loading');
							}, 1000);
							layer.msg("出错了", {icon: 2,time:2000});
						}
					});
     				
     			   //end
     			}, function(){
     			    //取消操作 ，这里可以为空
     			});
          	
           }
	});
			
	
	//模糊查询获取角色信息
	
	$(".find").bind("click",function(){
		
		//获取token
		var token=$(".article-input").val();
		
		if(token.replace(/\s/g , '')!="" ){
			
			//start
			$.ajax({
				type:'post',
				dataType:'json',
				url:CTPPATH+'/admin/article/findArticle',
				data:{"token":token},
			
				beforeSend:function(){
					//显示正在加载
					layer.load(1,{offset: 0,time:2000});
				},
				success:function(data){

					//关闭正在加载
					setTimeout(function(){
						  layer.closeAll('loading');
					}, 1000);
		
					 
			        var xhtml="";
			        xhtml+="<thead><tr><th><input type='checkbox' class='checked_input'/></th><th>标题</th>"
						+"<th>内容</th>"						
						+"<th>作者</th>"
						+"<th>栏目</th>"
						+"<th>发布时间</th>"
						+"<th>状态</th>"
						+"<th>浏览量</th><th>操作</th></tr></thead>";
			       
			        xhtml+="<tbody>"
			        if(data.length>0){
			        	
			        		$.each(data,function(idx,item){ 
			        			
			        			xhtml+="<tr><td data-id='"+item.id+"'> <input type='checkbox' name='info_id' value="+item.id+"></td>"
			        			+"<td>"+sub(item.itemTitle,20)+"</td><td>"+sub(item.itemContent,32)+"</td>"
			        			+"<td>"+item.author+"</td>"
			        			+"<td>"+item.articleType.itemType+"</td><td>"+showLocale(item.addTime)+"</td>";
			        			
			        			if(item.isPublish == 1){
			        				xhtml+="<td>已发布</td>";
			        				
			        			}else{
			        				xhtml+="<td>草稿</td>";
			        			}
			        				
			        			
			        			xhtml+="<td>"+item.viewCount+"</td>"
			        				 +"<td class='table-operation-box'><span class='table-operation update-article-btn' data-id='"+item.id+"' title='编辑'><i class='layui-icon'>&#xe642;</i>   </span><span class='table-operation user-update only-delete' dx-type='update' title='删除'><i class='layui-icon'>&#xe640;</i></span></td> ";
			        		   
			        		}); 
			        	
			        	
			        	
			        }else{
			        	xhtml+="<tr><td colspan='9' style='background:#F2DEDE; color:#444444;'>没有找到文章信息</td></tr>";
			        }
			        
			        xhtml+="</tbody>";
			        $(".article-table").html(xhtml);
			        $(".pager").hide();
				},
				error:function(){

					//关闭正在加载
					setTimeout(function(){
						  layer.closeAll('loading');
					}, 1000);
					layer.msg("出错了", {icon: 2,time:2000});
				}
			});
			//end
		}else{
			layer.msg("请输入您要查询的内容！");
		}
		
	});  
	
    
	//修改跳转
	$(document).on("click",".update-article-btn",function(){
		var id = $(this).attr("data-id");
		window.location.href=CTPPATH+"/admin/article/showUpdate?id="+id;
	});
	
	
});
</script>