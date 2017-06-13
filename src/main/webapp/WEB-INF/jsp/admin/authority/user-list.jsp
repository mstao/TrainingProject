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
		<!-- <div class="layui-form-item item-right">
			<div class="layui-input-block"> <button class="layui-btn btn-simple-blue layui-btn-primary" id="add" dx-type="add" style="font-weight: bold">  <i class="layui-icon">&#xe608;</i> 新增 </button> </div>
		</div> -->
	</div>
	<table class="layui-table role-table">
		<thead>
			<tr>
				<th><input type="checkbox" class="checked_input"/></th>
				<th>用户名称</th>
				<th>用户邮箱</th>						
				<th>用户状态</th>
				<th>拥有的角色</th>
						
				<th class="table-operation-box">操作</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="${user}" var="user_list"> 
			<tr>
				
				<td data-id="${user_list.id}"> <input type="checkbox" name="info_id" value="${user_list.id}"></td>
				<td>${user_list.userName}</td>
				<td>${user_list.email }</td>
	
				<td>
					<c:choose>
					 <c:when test="${user_list.status eq 1}">有效</c:when>
					 <c:otherwise>无效</c:otherwise>
					</c:choose>
				</td>
				<td>${user_list.roleName}</td>
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
    
   
   //获取用户id并写入隐藏域
   $(document).on("click",".only-select",function(){

		
		$(".mark").show();
		$(".dialog").show();
		
		//获取id的值
		var id=$(this).parent().parent().children().eq(0).attr("data-id");
		$(".hide-checked-id").val(id);
		//$("input[type='radio']:checked").val();
	});
	
   //更改用戶角色信息
	$(".save").bind("click",function(){
		
		var uid=$(".hide-checked-id").val();
		var  role_id= $("input[type='radio']:checked").val();
		
		$.ajax({
			type:'post',
			dataType:'json',
			url:CTPPATH+"/admin/authority/updateUserRole",
			data:{"roleId":role_id,"userId":uid},
		
			beforeSend:function(){
				//显示正在加载
				layer.load(2);
			},
			success:function(data){

				//关闭正在加载
				setTimeout(function(){
					  layer.closeAll('loading');
				}, 1000);
				
				if(data==1){
					layer.msg('角色分配成功', {icon: 1,time:3000});
					//window.location.href="${pageContext.request.contextPath}/admin/authority/allocation?p=1";
				
				}else{
					layer.msg("角色分配失败", {icon: 2,time:2000});
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
		
	});
		
	//模糊查询
	$(".find").bind("click",function(event){
		

		//获取token
		var token=$(".user-input").val();
		
		if(token.replace(/\s/g , '')!="" ){
			//start
			$.ajax({
				type:'post',
				dataType:'json',
				url:CTPPATH+'/admin/authority/findUserByName',
				data:{"token":token},
			
				beforeSend:function(){
					//显示正在加载
					layer.load(2);
				},
				success:function(data){

					//关闭正在加载
					setTimeout(function(){
						  layer.closeAll('loading');
					}, 1000);
		
					 
			        var xhtml="";
			        xhtml+="<thead><tr><th><input type='checkbox' class='checked_input'/></th><th>用户名称</th><th>用户邮箱</th><th>用户状态</th><th>拥有的角色</th><th class='table-operation-box'>操作</th></tr></thead>";
			        xhtml+="<tbody>";
			        if(data.length>0){
			        
			        		$.each(data,function(idx,item){ 
			        			
			        			xhtml+="<td data-id='"+item.id+"'> <input type='checkbox' name='info_id' value='"+item.id+"'></td><td>"+item.userName+"</td><td>"+item.email+"</td>";
			        		   
			        			if(item.status==1){
			        				xhtml+="<td>有效</td>";
			        			}else{
			        				xhtml+="<td>无效</td>";
			        			}
			        			xhtml+="<td>"+item.roleName+"</td>";
			        			xhtml+="<td class='table-operation-box'>"
									 +"<span class='table-operation user-update only-delete' dx-type='update' title='删除'><i class='layui-icon'>&#xe640;</i></span>"
									 +"<span class='table-operation user-update only-select' dx-type='update' title='分配角色'><i class='layui-icon'>&#xe620;</i></span>"									
									 +"</td>";
			        			xhtml+="</tr>";
			        		}); 
			        	
			        	
			        }else{
			        	xhtml+="<tr><td colspan='7' style='background:#F2DEDE; color:#444444;'>没有找到用户</td></tr>";
			        }
			        
			        xhtml+="</tbody></table>";
			        $(".role-table").html(xhtml);
						
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
	
	//删除用户
	//批量删除
	
	$(document).on("click",".delete",function(){
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
					dataType:'json',
					url:CTPPATH+"/admin/authority/deleteUser",
					data:{"ids":ids},
				
					beforeSend:function(){
						//显示正在加载
						layer.load(2);
					},
					success:function(data){
	
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						
						if(data==1){
							layer.msg('删除成功', {icon: 1,time:2000});
							window.location.href="${pageContext.request.contextPath}/admin/authority/allocation?p=1";
						
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
						dataType:'json',
						url:CTPPATH+"/admin/authority/deleteUser",
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
								window.location.href="${pageContext.request.contextPath}/admin/authority/allocation?p=1";
							
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
	
    
});
</script>