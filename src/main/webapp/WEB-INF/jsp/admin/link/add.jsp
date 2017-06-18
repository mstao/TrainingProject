<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>新增栏目</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js" ></script>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layer-2.4/layer.js"></script>
<style type="text/css">
.add-role-div{
margin-top:10px;
}
.add-role-input{
margin-bottom:30px;
}
label{
color:#444444;
margin-left:30px;
font-weight: bold;
}
input{
width:500px;
border-radius: 3px;
height: 30px;
border: 1px solid #CCCCCC;
padding-left: 10px;
margin-left:30px;
margin-top:10px;
}
input:foucs{
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
	margin-left: 10px;
	color: #FFFFFF;
	cursor: pointer;
	float:right;
	margin-top:20px;
}
.close{
color:#444444 !important;

}
.save{

background:#0088CC;
}
</style>

<script type="text/javascript">
var CTPPATH="${pageContext.request.contextPath}";
$(function(){
	//添加栏目
	
	$(".save").bind("click",function(){
		//获取栏目名称
		var name = $(".name").val();
		//获取栏目标识
		var url = $(".url").val();
		
		if( name.replace(/(^s*)|(s*$)/g, "").length !=0 && url.replace(/(^s*)|(s*$)/g, "").length !=0){
			//start
			$.ajax({
				type:'post',
				dataType:'text',
				url:CTPPATH+'/admin/link/save',
				data:{"linkName":name,"linkUrl":url},
			
				beforeSend:function(){
					//显示正在加载
					layer.load(2);
				},
				success:function(data){

					//关闭正在加载
					setTimeout(function(){
						  layer.closeAll('loading');
					}, 1000);
		
					 if(data>0){
						layer.msg('添加成功', {icon: 1,time:2000});
						window.close();
						window.location.href=CTPPATH+"/admin/link/show";

					}else{
						layer.msg("添加出错了", {icon: 2,time:2000});
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
		}else{
			layer.msg("内容不能为空！");
		}
	});

	
	$(".close").bind("click",function(){
		$(".name").val("");
		$(".url").val("");
	});

});
</script>
</head>
<body>

<div class="add-role-div">
<div class="add-role-input">
<label>链接名称</label><br>
<input type="text"  placeholder="请填入栏目名称" class="name"><br><br>
<label>链接url</label><br>
<input type="text"  placeholder="请填入栏目标识" class="url">
</div>
<div class="active">
<button class="close">清空</button><button class="save">保存</button>
</div>
</div>

</body>
</html>