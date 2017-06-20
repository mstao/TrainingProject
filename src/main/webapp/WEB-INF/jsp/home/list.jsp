<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="myTag" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${type.itemType}</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_HOME" value="${pageContext.request.contextPath}/resources/home"></c:set>
   
<link rel="stylesheet" type="text/css" href="${CTP_HOME}/theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="${CTP_HOME}/theme/1/css/front/style.css">
<link rel="stylesheet" type="text/css" href="${CTP}/resources/admin/css/page.css">
</head>
<body>
<div id="main">
  <!-- 导入header -->
  <jsp:include page="common/header.jsp"></jsp:include>
  
    <div class="content">
    	<div class="congw">
           <div class="conlist">
           		<div class="position">
                   	<span class="poshome">您现在的位置：</span>
                       <a href="${CTP}/home/index">首页</a> >> 
                       <a href="javascript;">
                       	${type.itemType}
                       </a>
                </div>
                <div class="search_result">
                
                     <c:forEach items="${list}" var="list">
                    	<div class="art_box">
                        	<div class="art_img"><a href="#"><img src="${CTP_HOME}/theme/1/images/front/doc.png"></a></div>
                            <div class="art_txt">
                            	<div class="title"><a href="${CTP}/home/details?id=${list.id}">${myTag:substr(list.itemTitle,0,15,true)}</a><span class="icon_pen"></span></div>
                                <div class="tag_txt"><span>栏目名称：${list.articleType.itemType}</span><span class="pl30">点击次数：${list.viewCount}</span></div>
                                <div class="tag_txt">
                                	<span>作者：${list.author}</span><span class="pl30">发布时间：<fmt:formatDate value="${list.addTime}" pattern="yyyy-MM-dd"/></span>
                                </div>
                            </div>
                            
                        </div>
                      </c:forEach> 
                      
                        ${toolBar}
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