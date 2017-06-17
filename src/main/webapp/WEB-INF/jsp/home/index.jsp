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
                    <!-- <span class="sp_signout">退出</span> -->
                </div>
            </div> 
            <div class="nav">
            	<ul class="navUI">
            	<li><a href="${CTP}/home/index">首页</a></li>
            	<c:forEach items="${typeList }" var="list">
                	<li><a href="javascript:void(0);">${list.itemType}</a></li>
                </c:forEach>    
                </ul>
            </div>
            <div class="banner">
            	<div class="banimg"><img src="${CTP_HOME}/theme/1/images/front/banner.png"></div>
            </div>
        </div>
    </div>
    <div class="content">
    	<div class="congw">
            
            <div class="clear"></div>
            <div class="box">
            	
             <c:forEach items="articleList" var="list">
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
                        <c:forEach items="${list.articles}" var="article">
                        	<li>
                            	<a href="javascript:void(0)" class="txt_title">${myTag:substr(article.itemTitle,0,10,true)}</a><span class="txt_discipline">${article.author }</span><span class="txt_time"><fmt:formatDate value="${article.addTime}" pattern="yyyy-MM-dd"/></span>
                            </li>
                       </c:forEach>
                          
                        </ul>
                    </div>
                </div>
                
             </c:forEach>	
             
            </div>
            <div class="box">
            	<div class="box_f">
                	<div class="title">
                    	<span class="txt_title">教育科研</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
	                        	<a href="#">更多>></a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                        	<li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                    
                        </ul>
                    </div>
                </div>
                
                <div class="box_f">
                	<div class="title">
                    	<span class="txt_title">智慧课堂</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
	                        	<a href="#">更多>></a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                        	<li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                       
                        </ul>
                    </div>
                </div>
                
               <div class="box_f">
                	<div class="title">
                    	<span class="txt_title">智慧课堂</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
	                        	<a href="#">更多>></a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                        	<li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                            <li>
                            	<a href="javascript:void(0)" class="txt_title">地壳运动的奥秘</a><span class="txt_discipline">张三</span><span class="txt_time">2016-03-20</span>
                            </li>
                       
                        </ul>
                    </div>
                </div>
            </div>
            <div class="link">
            	<div class="linelink">
            		<span>友情链接：</span>
					<a href="javascript:void(0)">上海教育网</a>
					<a href="javascript:void(0)">上海杰普软件科技有限公司</a>
					<a href="javascript:void(0)">XX学院</a>
					<a href="javascript:void(0)">XX大学</a>
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