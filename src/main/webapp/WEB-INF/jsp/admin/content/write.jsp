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
    发布内容
</blockquote>	

<!-- 标题 -->

<form class="layui-form">
  <div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
      <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
  
  </div>

<div class="editor-div">

<label>撰写</label>
	<!--S 编辑器 -->              
	<div id="editor-container" class="answercontainer"><div id="editor-trigger"></div></div>
	<!--E 编辑器  -->

</div>

<div class="layui-input-block">
  <button class="layui-btn" lay-submit="" lay-filter="zzz">立即提交</button>
  <button type="reset" class="layui-btn layui-btn-primary">重置</button>
</div>


</form>



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
    
  //监听提交
  form.on('submit(zzz)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
  
  
  
});
</script>