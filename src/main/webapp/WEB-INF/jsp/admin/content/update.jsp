<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布内容界面</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
<link rel="stylesheet" href="${CTP}/resources/common/js/extends/layui/css/layui.css">
<link rel="stylesheet" href="${CTP_ADMIN}/css/content.css">    
<link href="${CTP}/resources/static/wangEditor/dist/css/wangEditor.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${CTP_ADMIN}/js/module/common.js"></script>

<script type="text/javascript">
var CTPPATH = "${pageContext.request.contextPath}";
var DEFAULT_USERNAME = "<shiro:principal/>";
</script>
</head>
<body>

<section class="dx-list-default">
	
<br><br>	
<blockquote class="layui-elem-quote">
    修改内容
</blockquote>	

<!-- 标题 -->

<form class="layui-form">
<input type="hidden" value="${articles.id }" class="a_id">
  <div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
      <input type="text" name="title" value="${articles.itemTitle }" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input title">
    </div>
  
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">作者</label>
    <div class="layui-input-block">
      <input type="text" name="title" value="${articles.author }" required  lay-verify="required" placeholder="请输入作者名" autocomplete="off" class="layui-input author">
    </div>
  
  </div>
  
<div class="layui-form-item">
    <label class="layui-form-label">栏目名</label>
    
    <div class="layui-input-block">
      <select name="interest" lay-filter="aihao" class="select-category">
      <c:forEach items="${typeList}" var="list">
     
        <option value="${list.id}" <c:if test="${list.id eq articles.typeId }">selected</c:if> >${list.itemType}</option>
      </c:forEach>
      </select>
    </div>
  </div>

<div class="editor-div">

<label>撰写</label>
	<!--S 编辑器 -->              
	<div id="editor-container" class="answercontainer"><div id="editor-trigger">${articles.itemContent }</div></div>
	<!--E 编辑器  -->

</div>



</form>

<div class="layui-input-block">
  <button class="layui-btn publish-btn" lay-submit lay-filter="zzz">立即提交</button>
  <button class="layui-btn layui-btn-primary draft-btn">保存草稿</button>
</div>



</section>
</body>
</html>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layui/layui.js"></script>
<script type="text/javascript" src="${CTP}/resources/static/wangEditor/dist/js/wangEditor.js"></script>

<script type="text/javascript">
layui.use(['layer','element','form','flow'], function() {
    var element    = layui.element()
    ,layer      = layui.layer
    ,form       = layui.form   
    ,flow       = layui.flow
    ,$          = layui.jquery;
    
    //编辑器初始化

  // 阻止输出log
  // wangEditor.config.printLog = false;

  var editor = new wangEditor('editor-trigger');
  editor.config.pasteFilter=true;
  editor.config.pasteText = true;
  // 上传图片
  editor.config.uploadImgUrl = CTPPATH+'/admin/upload/uploadpic';
  editor.config.uploadParams = {
      // token1: 'abcde',
      // token2: '12345'	
  };
  editor.config.uploadHeaders = {
      // 'Accept' : 'text/x-json'
  }
   editor.config.uploadImgFileName = 'myEditorImgName';

  // 普通的自定义菜单
  editor.config.menus = [
      'source',
      '|',     // '|' 是菜单组的分割线
      'bold',
      'underline',
      'italic',
      'eraser',
      '|',
      'head',
      'quote',
      'unorderlist',
      'orderlist',
      'alignleft',
      'aligncenter',
      'alignright',
      '|',
      'table',
      'link',
      'unlink',
      'img',
      '|',
      'undo',
      'redo',
      'fullscreen'
   ];
    

  
  //创建编辑器
  editor.create();
    
  //修改发布
  $(".publish-btn").bind("click",function(){
	 var id = $(".a_id").val();
	 var title = $(".title").val();
	 var category_id = $(".select-category").val();
	 var content = editor.$txt.html();
	 var text = editor.$txt.text();
	 var author = $(".author").val();
	 
	 var is_publish = 1;
	 var add_time = showLocale()+" "+hms();
	 if(text != "" &&  title != "" &&  category_id != ""){
		 $.ajax({
			type:'post',
			dataType:'text',
			url:CTPPATH+'/admin/article/update',
			data:{"id":id,"itemTitle":title,"itemContent":content,"author":author,"addTime":add_time,"isPublish":is_publish,"typeId":category_id},
		
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
					layer.msg('修改成功', {icon: 1,time:2000});

					window.location.href=CTPPATH+"/admin/article/list?p=1";
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
	 }else{
		 layer.msg("不允许有空!");
	 }
  });
  
  //保存为草稿
  $(".draft-btn").bind("click",function(){
	     var id = $(".a_id").val();
		 var title = $(".title").val();
		 var category_id = $(".select-category").val();
		 var content = editor.$txt.html();
		 var text = editor.$txt.text();
		 var author = $(".author").val();
		 //保存草稿
		 var is_publish = 0;
		 var add_time = showLocale()+" "+hms();
		 if(text != "" && title != "" &&  category_id != ""){
			 $.ajax({
				type:'post',
				dataType:'text',
				url:CTPPATH+'/admin/article/update',
				data:{"id":id,"itemTitle":title,"itemContent":content,"author":author,"addTime":add_time,"isPublish":is_publish,"typeId":category_id},
			
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
						layer.msg('保存草稿成功', {icon: 1,time:2000});
					
						window.location.href=CTPPATH+"/admin/article/list?p=1";
					}else{
						layer.msg("保存草稿出错了", {icon: 2,time:2000});
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
		 }else{
			 layer.msg("不允许有空!");
		 }
	  });
  
  
});
</script>