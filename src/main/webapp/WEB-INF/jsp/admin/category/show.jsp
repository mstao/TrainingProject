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
<style type="text/css">
.update-role{
display: none;
}
.add-role-input{
width:520px;
margin-top:10px;
margin:0 auto;
margin-bottom:30px;
}
label{
color:#444444;

font-weight: bold;
}
.update-property{
width:500px;
border-radius: 3px;
height: 30px;
border: 1px solid #CCCCCC;
padding-left: 10px;

margin-top:10px;
}

.update-property:foucs{
   border: 1px solid #0088CC;
}
.active{
border-top:1px solid #E5E5E5;

}
.active button{
    border: 1px solid #FFFFFF;
	min-width: 50px;
	height: 30px;	
	border-radius: 5px;
    margin-right:10px;
	color: #FFFFFF;
	cursor: pointer;
	float:right;
	margin-top:20px;
}
.clear{
color:#444444 !important;

}
.save{

background:#0088CC;
}
</style>
</head>
<body>
<section class="dx-list-default">
	<div class="dx-operation-bar">
		<form class="layui-form">
			<div class="layui-form-item">
				<div class="layui-input-inline"> <input   placeholder="请输入栏目名称" autocomplete="off" class="layui-input category-input"> </div>
			</div>
			
		</form>
		<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn  btn-yellow find">查询</button> 
					<button class="layui-btn layui-btn-danger delete">删除</button> 
				</div>
			</div>
		<div class="layui-form-item item-right">
			<div class="layui-input-block"> <button class="layui-btn btn-simple-blue layui-btn-primary" id="add" dx-type="add" style="font-weight: bold">  <i class="layui-icon">&#xe608;</i> 新增 </button> </div>
		</div>
	</div>
	<table class="layui-table category-table">
		<thead>
			<tr>
				<th><input type="checkbox" class="checked_input"/></th>
				<th>栏目名称</th>
				<th>栏目标识</th>
		
				<th class="table-operation-box">操作</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="${typeList}" var="list"> 
			<tr>
				<td data-id="${list.id}"> <input type="checkbox" name="info_id" value="${list.id}"></td>
				<td>${list.itemType}</td>
				<td>${list.itemFlag}</td>
				<td class="table-operation-box"> 
				 <span class="table-operation update-category-btn" title="编辑"><i class="layui-icon">&#xe642;</i>   </span>
				 <span class="table-operation user-update only-delete" dx-type="update" title="删除"><i class="layui-icon">&#xe640;</i></span> 
			    </td>
			</tr>
		</c:forEach>
			
		</tbody>
	</table>

</section>
	
	
<!--S 修改页面 -->
<div class="update-category update-role">
<br>
<input type="hidden" class="hide-id"/>
<div class="add-category-input add-role-input">
<label>角色名称</label><br>
<input type="text"  placeholder="请填入角色名称" class="update-type  update-property"><br><br>
<label>角色code</label><br>
<input type="text"  placeholder="请填入角色code" class="update-flag update-property">
</div>
<!-- <div class="active">
<button class="clear">清空</button><button class="save">保存</button>
</div> -->
</div>	
<!--E 修改页面  -->


</body>
</html>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layui/layui.js"></script>
<script type="text/javascript">
layui.use(['layer','element','form'], function() {
    var element    = layui.element()
    ,layer      = layui.layer
    ,form       = layui.form   
    ,$          = layui.jquery;
    
    //新增弹出
	$('#add').on('click', function(){
		 layer.open({
		        type: 2,
		      //  skin: 'layui-layer-lan',
		        title: '新增栏目',
		        fix: false,
		        shadeClose: true,
		        maxmin: true,
		        area: ['600px', '300px'],
		        content: CTP_PATH+'/admin/category/showAddCategory',
		       
	  });
	});
    
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
					dataType:'json',
					url:CTP_PATH+"/admin/category/delete",
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
							window.location.href=CTP_PATH+"/admin/category/show";
						
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
						url:CTP_PATH+"/admin/category/delete",
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
								window.location.href=CTP_PATH+"/admin/category/show";
							
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
		var token=$(".category-input").val();
		
		if(token.replace(/\s/g , '')!="" ){
			
			//start
			$.ajax({
				type:'post',
				dataType:'json',
				url:CTP_PATH+'/admin/category/findCategory',
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
			        xhtml+="<thead><tr><th><input type='checkbox' class='checked_input'/></th><th>栏目名称</th><th>栏目标识</th><th>操作</th></tr></thead>";
			       
			        xhtml+="<tbody>"
			        if(data.length>0){
			        	
			        		$.each(data,function(idx,item){ 
			        			
			        			xhtml+="<tr><td data-id='"+item.id+"'> <input type='checkbox' name='info_id' value="+item.id+"></td><td>"+item.itemType+"</td><td>"+item.itemFlag+"</td><td class='table-operation-box'> <span class='table-operation update-category-btn user-info' ><i class='layui-icon'>&#xe642;</i>   </span> <span class='table-operation only-delete' dx-type='update'><i class='layui-icon'>&#xe640;</i></span>  </td></tr>";
			        		   
			        		}); 
			        	
			        	
			        	
			        }else{
			        	xhtml+="<tr><td colspan='4' style='background:#F2DEDE; color:#444444;'>没有找到栏目信息</td></tr>";
			        }
			        
			        xhtml+="</tbody>";
			        $(".category-table").html(xhtml);
						
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
    
	//更新栏目
	$(document).on("click",".update-category-btn",function(){
	/* $(".update-category-btn").bind("click",function(){ */
		var r_td = $(this).parent().parent().children()
		//获取id
		var id = r_td.eq(0).attr("data-id");
		var type = r_td.eq(1).text();
		var flag = r_td.eq(2).text();
		
		//将信息填充到页面中
		$(".update-type").val(type);
		$(".update-flag").val(flag);
		$(".hide-id").val(id);
		
		layer.open({
		    type: 1,
		    title: '修改栏目信息',		    
		    maxmin: true, //开启最大化最小化按钮
		    area: ['600px', '300px'],
		    skin: 'layui-layer-rim', //加上边框
		    content: $(".update-category"),
		    btn: ['确定', '取消'],
		    yes:function(){
		    	//begin
		    
				var stype = $(".update-type").val();
				var sflag = $(".update-flag").val();
				layer.msg(stype +"--"+sflag);
				 $.ajax({
					type:'post',
					dataType:'text',
					url:CTP_PATH+"/admin/category/update",
					data:{"id":id,"itemType":stype,"itemFlag":sflag},
				
					beforeSend:function(){
						//显示正在加载
						layer.load(1,{offset: 10,time:2000});
					},
					success:function(data){
		
						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						
						if(data>0){
							layer.msg('修改成功', {icon: 1,time:2000});
							r_td.eq(1).text(stype);
							r_td.eq(2).text(sflag);
						}else{
							layer.msg("修改出错了", {icon: 2,time:2000});
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
		    },
		    btn2:function(){
		    	$(".update-type").val("");
				$(".update-flag").val("");
		    }
		   
		});
		
		
	   
			
	});
	
/* 	//清空数据
	$(document).on("click",".clear",function(){
		
		$(".update-type").val("");
		$(".update-flag").val("");
	

	}); */
	 
	/* //调用Ajax向后台发送请求 ，更新
	$(document).on("click",".save",function(){
	 
		var id = $(".hide-id").val();
		var type = $(".update-type").val();
		var flag = $(".update-flag").val();
		layer.msg(type +"--"+flag);
		 $.ajax({
			type:'post',
			dataType:'text',
			url:CTP_PATH+"/admin/category/update",
			data:{"id":id,"itemType":type,"itemFlag":flag},
		
			beforeSend:function(){
				//显示正在加载
				layer.load(1,{offset: 10,time:2000});
			},
			success:function(data){

				//关闭正在加载
				setTimeout(function(){
					  layer.closeAll('loading');
				}, 1000);
				
				if(data>0){
					layer.msg('修改成功', {icon: 1,time:2000});
				
				
				}else{
					layer.msg("修改出错了", {icon: 2,time:2000});
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
	}); */
});
</script>