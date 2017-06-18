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
<c:set var="CTP_HOME" value="${pageContext.request.contextPath}/resources/home"></c:set>
   
<link rel="stylesheet" type="text/css" href="${CTP_HOME}/theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="${CTP_HOME}/theme/1/css/front/style.css">

</head>
<body>
<div id="main">
    <div class="top">
    	<div class="topbg">
            <div class="logo_sign">
            	<div class="logo"></div>
                <div class="sign">
                	<span>欢迎您系统管理员</span>
                    <span class="sp_home">首页</span>
                    <span class="sp_backstage">后台管理</span>
                    <span class="sp_signout">退出</span>
                </div>
            </div> 
            <div class="nav">
            	<ul class="navUI">
                	<li><a href="${CTP}/home/index">首页</a></li>
	            	<c:forEach items="${typeList }" var="list">
	                	<li><a href="${CTP}/home/list?typeId=${list.id}&p=1">${list.itemType}</a></li>
	                </c:forEach> 
                </ul>
            </div>
            
        </div>
    </div>
    <div class="content">
    	<div class="congw">
           <div class="conarticle">
                    <div class="position">
                    	<span class="poshome">您现在的位置：</span>
                        <a href="${CTP}/home/index">首页</a> >> <a href="javascript:;">${details.articleType.itemType}</a>
                    </div>
                    <div class="title">${details.itemTitle}</div>
                    <div class="abstract">
                    	<span>发布时间：<fmt:formatDate value="${details.addTime}" pattern="yyyy-MM-dd"/></span>
                        <span>作者：${details.author}</span>
                        <span>点击${details.viewCount}次</span>
                    </div>
                    <div class="details">
                    	${details.itemContent}
                    </div>
           </div>
            <div class="link">
            	<div class="linelink">
            		<span>友情链接：</span><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
    	<div class="foot">
        	<p>杰普信息发布系统 技术支持：<a href="javascript:void(0)">上海杰普软件科技有限公司</a>      电话：021-xxxxxxx</p>
        </div>
    </div>
</div>
</body>
</html>