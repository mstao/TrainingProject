<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎界面</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
    
<link rel="stylesheet" href="${CTP}/resources/common/js/extends/layui/css/layui.css">
<link rel="stylesheet" href="${CTP_ADMIN}/css/role-list.css">
<style type="text/css">
iframe{
    position: relative;
    top:5px;
    
}
.layui-elem-quote iframe:NTH-CHILD(2){
	position: relative;
	left:80px;
}
</style>
</head>
<body>
 <blockquote class="layui-elem-quote">
        在github上下载： <a href="https://github.com/mstao/TrainingProject/archive/master.zip" target="_blank">点击下载</a>&nbsp;&nbsp;&nbsp;
      <iframe src="https://ghbtns.com/github-btn.html?user=mstao&repo=TrainingProject&type=watch&count=true" frameborder="0" scrolling="0" width="170px" height="20px"></iframe>
      <iframe src="https://ghbtns.com/github-btn.html?user=mstao&repo=TrainingProject&type=fork&count=true" frameborder="0" scrolling="0" width="170px" height="20px"></iframe>
 
        <hr> 
      基于Spring、SpringMVC、mybatis、shiro、LayUI等前后端框架搭建的内容管理系统    &nbsp;  &nbsp;
    <hr>
  
            
  </blockquote>
  
  
  
    
<blockquote class="layui-elem-quote">
 服务器端信息
</blockquote>


<section class="dx-list-default">
	
	<table class="layui-table role-table">
		<thead>
			<tr>
				<th>序号</th>
				<th>服务器参数名称</th>
				<th>服务器参数值</th>
		
			</tr>
		</thead>
		<tbody>
		

		<tr>
			<td>1</td>
			<td>取得请求对象</td>
			<td>${pageContext.request}</td>			
     	</tr>
		
		<tr>
			<td>2</td>
			<td>取得session对象</td>
			<td>${pageContext.session}</td>			
     	</tr>
     
        <tr>
			<td>3</td>
			<td>取得请求的参数字符</td>
			<td>${pageContext.request.queryString}</td>			
     	</tr>
     
        <tr>
			<td>4</td>
			<td>取得请求的URL，但不包括请求之参数字符串</td>
			<td>${pageContext.request.requestURL}</td>			
     	</tr>
			
		<tr>
			<td>5</td>
			<td>服务的web application的名称</td>
			<td>${pageContext.request.contextPath}</td>			
     	</tr>	
		
		<tr>
			<td>6</td>
			<td>取得HTTP的方法(GET、POST)</td>
			<td>${pageContext.request.method}</td>			
     	</tr>	
     	
     	<tr>
			<td>7</td>
			<td>取得使用的协议(HTTP/1.1、HTTP/1.0)</td>
			<td>${pageContext.request.protocol}</td>			
     	</tr>
     	
     	<tr>
			<td>8</td>
			<td>取得用户名称</td>
			<td>${pageContext.request.remoteUser}</td>			
     	</tr>
     	
     	<tr>
			<td>9</td>
			<td>取得session ID</td>
			<td>${pageContext.session.id} </td>			
     	</tr>
     	
     	<tr>
			<td>10</td>
			<td>取得用户浏览器的版本</td>
			<td>${header["User-Agent"]} </td>			
     	</tr>
     	
     	<tr>
			<td>11</td>
			<td>IP</td>
			<td>${header["Host"]} </td>			
     	</tr>
     	
     	<tr>
			<td>12</td>
			<td>IP地址</td>
			<td>${pageContext.request.remoteAddr } </td>			
     	</tr>
     	
     	<tr>
			<td>13</td>
			<td>取得主机端的服务信息</td>
			<td>${pageContext.servletContext.serverInfo} </td>			
     	</tr>
     	
     	<tr>
			<td>14</td>
			<td>端口信息</td>
			<td>${pageContext.request.serverPort} </td>			
     	</tr>
     	
     	<tr>
			<td>15</td>
			<td>服务器名称</td>
			<td>${pageContext.request.serverName}</td>			
     	</tr>
     	
     	<tr>
			<td>16</td>
			<td>客户机名称</td>
			<td>${pageContext.request.remoteHost}</td>			
     	</tr>
     	
		</tbody>
	</table>

</section> 
    
    <script type="text/javascript" src="${CTP}/resources/common/js/extends/layui/layui.js"></script>
    <script type="text/javascript">
        /**
         * 对layui进行全局配置
         */
         layui.use(['layer','element'], function() {
        	 var element    = layui.element();
             var layer      = layui.layer;
             var $          = layui.jquery;  
         });
    </script>
</body>
</html>