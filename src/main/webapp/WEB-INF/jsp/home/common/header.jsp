<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<div class="top">
    	<div class="topbg">
            <div class="logo_sign">
            	<div class="logo"></div>
                <div class="sign">
                    <span class="sp_home"><a href="${CTP}/home/index">首页</a></span>
                    <span class="sp_backstage"><a href="${CTP}/admin/index">后台管理</a></span>
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
    