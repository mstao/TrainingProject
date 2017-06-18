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

<jsp:include page="common/header.jsp"></jsp:include>
    
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
            		<span>友情链接：</span>
            		<c:forEach items="${link}" var="link">
					<a href="http://${link.linkUrl}">${link.linkName}</a>
					</c:forEach>
                </div>
            </div>
        </div>
    </div>
  <jsp:include page="common/footer.jsp"></jsp:include>
</div>
</body>
</html>