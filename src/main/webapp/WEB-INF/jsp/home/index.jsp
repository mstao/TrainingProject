<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="myTag" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_HOME" value="${pageContext.request.contextPath}/resources/home"></c:set>
<link rel="stylesheet" type="text/css" href="${CTP}/resources/common/js/extends/pace/pace-theme-minimal.tmpl.css">
<link rel="stylesheet" type="text/css" href="${CTP_HOME}/theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="${CTP_HOME}/theme/1/css/front/style.css">
<script type="text/javascript" src="${CTP}/resources/common/js/extends/pace/pace.min.js"></script>
</head>
<body>
<div id="main">
<jsp:include page="common/header.jsp"></jsp:include>
    <div class="content">
    	<div class="congw">
            
            <div class="clear"></div>
            <div class="box">
            	
             <c:forEach items="${articleList}" var="list" varStatus="count">
              <c:choose>
	              <c:when test="${count.index lt 3}">
	              <div class="box_b">
                	<div class="title">
                    	<span class="txt_title">${list.itemType}</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
	                        	<a href="#">更多>></a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                        <c:forEach items="${list.articles}" var="article" varStatus="c">
                        	<c:if test="${c.index lt 5}">
                        	
	                        	<li>
	                            	<a href="${CTP}/home/details?id=${article.id}" class="txt_title">${myTag:substr(article.itemTitle,0,10,true)}</a><span class="txt_discipline">${article.author }</span><span class="txt_time"><fmt:formatDate value="${article.addTime}" pattern="yyyy-MM-dd"/></span>
	                            </li>
                            </c:if>
                       </c:forEach>
                          
                        </ul>
                    </div>
                </div>
	              </c:when>
	              
	              <c:otherwise>
	              
	              <!--S 大于3的情况 -->
	              <div class="box_f">
                	<div class="title">
                    	<span class="txt_title">${list.itemType}</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
	                        	<a href="#">更多>></a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                        	<c:forEach items="${list.articles}" var="article" varStatus="c">
	                        	<c:if test="${c.index lt 5}">
		                        	<li>
		                            	<a href="${CTP}/home/details?id=${article.id}" class="txt_title">${myTag:substr(article.itemTitle,0,10,true)}</a><span class="txt_discipline">${article.author }</span><span class="txt_time"><fmt:formatDate value="${article.addTime}" pattern="yyyy-MM-dd"/></span>
		                            </li>
	                            </c:if>
                            </c:forEach>
                          
                    
                        </ul>
                    </div>
                </div>
	              <!--E 大于3的情况 -->
	              
	              </c:otherwise>
              </c:choose>
                     
             </c:forEach>	
             
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