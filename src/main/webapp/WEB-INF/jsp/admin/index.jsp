<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>后台管理</title>
    <c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
	<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
    
    <link rel="stylesheet" href="${CTP}/resources/common/js/extends/layui/css/layui.css">
    <link rel="stylesheet" href="${CTP}/resources/common/js/extends/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${CTP_ADMIN}/css/index.css">
	<script type="text/javascript" src="${CTP_ADMIN}/js/module/common.js"></script>
	<script type="text/javascript">
	var CTPPATH = "${pageContext.request.contextPath}";
	var DEFAULT_USERNAME = "<shiro:principal/>";
	</script>
	<style type="text/css">
	    	
	    	
	.admin-side-toggle,.admin-side-full{
		position: absolute; 
		cursor: pointer;
	    z-index: 19940201;
	    left: 200px;
	    color: white;
	    text-align: center;
	    width: 30px;
	    height: 30px;
	    background-color: #1AA094;
	    line-height: 30px;
	    top: 25%;
	}
	.admin-side-toggle:hover{
		background-color: #5FB878;
	}
	.admin-side-full{
		left: 240px;
	}
	    	
	</style>
</head>

<body>
    <!-- 布局容器 -->
    <div class="layui-layout layui-layout-admin">
        <!-- 头部 -->
        <div class="layui-header">
            <div class="layui-main">
                <!-- logo -->
              
              <div class="admin-login-box">
						 <a href="javascript:void(0);" style="color: #c2c2c2; font-size: 18px; line-height: 60px;">后台管理系统</a>
						<div class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
						<div class="admin-side-full">
							<i class="fa fa-life-bouy" aria-hidden="true"></i>
						</div>
					</div>
           
                
       
                	
                <!-- 水平导航 -->
                <ul class="layui-nav" style="position: absolute; top: 0; right: 0; background: none;">
                    <li class="layui-nav-item">
                        <a href="${CTP}/home/index" target="_blank">
                         	   进入前台
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" title="当前用户角色">
                         	   ${sessionScope.role}
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                     	  <shiro:principal/>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" class="look-myself-btn">
                                                                                                      个人信息
                                </a>
                            </dd>
                          
                            <dd>
                                <a href="${CTP}/admin/user/logout">
                                                                                                     退出登录
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 侧边栏 -->
        <div class="layui-side layui-bg-black" id="admin-side">
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="left-nav" style="border-radius: 0;">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" data-url="${CTP}/admin/welcome" data-id="1">
                                                                            后台主页
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                                                                                     权限管理
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="${CTP}/admin/authority/roleList" data-id="2">
                               	   角色列表
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="${CTP}/admin/authority/allocation?p=1" data-id="3">
                           	             角色分配
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="${CTP}/admin/authority/resources" data-id="4">
                               	  权限列表
                                </a>
                            </dd>
  
                        </dl>
                    </li>
                    
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                                                                                 内容管理
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="${CTP}/admin/article/list?p=1" data-id="5">
                                                                                                       内容列表
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="${CTP}/admin/article/write" data-id="6">
                             	       发布内容
                                </a>
                            </dd>
                            
                        </dl>
                    </li>
                    <!-- 栏目管理 -->
                    
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                                                                                 栏目管理
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="${CTP}/admin/category/show" data-id="7">
                                                                                                       栏目列表
                                </a>
                            </dd>
                          
                            
                        </dl>
                    </li>
                    
                     <li class="layui-nav-item">
                        <a href="javascript:;">
      				             系统管理
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="${CTP}/admin/link/list" data-id="8">
                             	      友链管理
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="http://cn.bing.com/" data-id="9">
                           		         清除缓存
                                </a>
                            </dd>
                            
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 主体 -->
        <div class="layui-body" id="admin-body">
            <!-- 顶部切换卡 -->
            <div class="layui-tab layui-tab-brief" lay-filter="top-tab" lay-allowClose="true" style="margin: 0;">
                <ul class="layui-tab-title"></ul>
                <div class="layui-tab-content" style="padding: 0;"></div>
            </div>
        </div>

        <!-- 底部 -->
        <div class="layui-footer" id="admin-footer" style="text-align: center; line-height: 44px;">
            Copyright © 2017 <a href="#" target="_blank">左手代码、右手诗 .Team</a> 
        </div>

    </div>
<!-- 引入个人信息 -->
<jsp:include page="myinfo.jsp"></jsp:include>

    <script type="text/javascript" src="${CTP}/resources/common/js/extends/layui/layui.js"></script>
    <script type="text/javascript">
        layui.use(['layer','element'], function() {
            var element    = layui.element();
            var layer      = layui.layer;
            var $          = layui.jquery;

            var navfilter  = 'left-nav';
            var nav        = $('.layui-nav[lay-filter='+navfilter+']').eq(0);

            var tabfilter  = 'top-tab';
            var tab        = $('.layui-tab[lay-filter='+tabfilter+']').eq(0);
            var tabcontent = tab.children('.layui-tab-content').eq(0);
            var tabtitle   = tab.children('.layui-tab-title').eq(0);

            /**
             * iframe自适应
             */
            $(window).resize(function() {
                //设置顶部切换卡容器度
                tabcontent.height($(this).height() - 60 - 41 - 44); //头部高度 顶部切换卡高度 底部高度
                //设置顶部切换卡容器内每个iframe高度
                tabcontent.find('iframe').each(function () {
                    $(this).height(tabcontent.height());
                });
            }).resize();

            /**
             * 监听侧边栏导航点击事件
             */
            element.on('nav('+navfilter+')', function(elem) {
                var a         = elem.children('a');
                var title     = a.text();
                var src       = elem.children('a').attr('data-url');
                var id        = elem.children('a').attr('data-id');
                var iframe    = tabcontent.find('iframe[data-id='+id+']').eq(0);
                var tabindex  = tabtitle.children('li').length;

                if(src != undefined && src != null && id != undefined && id != null) {
                    if(iframe.length) { //存在 iframe
                        //获取iframe身上的tab index
                        tabindex = iframe.attr('data-tabindex');
                    }else{ //不存在 iframe
                        //显示加载层
                        layer.load(1,{offset: 10,time:2000});
                        setTimeout(function() {
                            layer.closeAll('loading');
                        }, 300);
                        //拼接iframe
                        var iframe = '<iframe';
                        iframe += ' src="'+src+'" data-id="'+id+'" data-tabindex="'+tabindex+'"';
                        iframe += ' style="width: 100%; height: '+tabcontent.height()+'px; border: 0px;"';
                        iframe += '></iframe>';
                        //顶部切换卡新增一个卡片
                        element.tabAdd(tabfilter, {title: title,content: iframe});
                    }

                    //切换到指定索引的卡片
                    element.tabChange(tabfilter, tabindex);
                }
            });

            /**
             * 初始化点击侧边栏第一个导航
             */
            nav.find('li').eq(0).click();
            
            
	         // 关闭/显示右侧导航  
		     $('.admin-side-toggle').on('click', function () {
		        var sideWidth = $('#admin-side').width();
		        if (sideWidth === 200) {
		            $('#admin-body').animate({
		                left: '0'
		            }); //admin-footer
		            $('#admin-footer').animate({
		                left: '0'
		            });
		            $('#admin-side').animate({
		                width: '0'
		            });
		        } else {
		            $('#admin-body').animate({
		                left: '200px'
		            });
		            $('#admin-footer').animate({
		                left: '200px'
		            });
		            $('#admin-side').animate({
		                width: '200px'
		            });
		        }
		    });
	        //全屏
		    $('.admin-side-full').on('click', function () {
		        var docElm = document.documentElement;
		        //W3C  
		        if (docElm.requestFullscreen) {
		            docElm.requestFullscreen();
		        }
		        //FireFox  
		        else if (docElm.mozRequestFullScreen) {
		            docElm.mozRequestFullScreen();
		        }
		        //Chrome等  
		        else if (docElm.webkitRequestFullScreen) {
		            docElm.webkitRequestFullScreen();
		        }
		        //IE11
		        else if (elem.msRequestFullscreen) {
		            elem.msRequestFullscreen();
		        }
		        layer.msg('按Esc即可退出全屏');
		    });
	        
	        //查看我的个人信息
		    var ok_username=false;
			var ok_email=false;
			var ok_old_password=false;
			var ok_new_password=false;
		    var ok_re_new_password=false;
		    var DEFAULT_EMAIL="";
			$(".look-myself-btn").bind("click",function(){
				
				
				//获取用户信息
				$.ajax({
					type:'post',
					dataType:'json',
					url:CTPPATH+"/admin/user/findUserInfo",
					data:{"userName":DEFAULT_USERNAME},
				
					beforeSend:function(){
						//显示正在加载
						layer.load(1,{offset: 10,time:2000});
					},
					success:function(data){

						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
					   //获取信息
						$(".uid").val(data.id);
					    $(".l_username").val(data.userName);
					    $(".l_email").val(data.email);
					    $(".l_time").val(showLocale(data.addTime));
					    DEFAULT_USERNAME = data.userName;
					    DEFAULT_EMAIL = data.email;
						
					},
					error:function(){

						//关闭正在加载
						setTimeout(function(){
							  layer.closeAll('loading');
						}, 1000);
						layer.msg("出错了", {icon: 2,time:2000});
					}
				});
					
				
				
				$('.modalDialog').slideDown();
			    $('html').addClass('overHiden');
			  
			});
			
			$('.info-close').bind('click',function(){
				$('.modalDialog').slideUp();
				$('html').removeClass('overHiden');

		    });
			
			
			if($(".l_username").val == DEFAULT_USERNAME){
				ok_username=true;
			}

			if($(".l_email").val() == DEFAULT_EMAIL){
				ok_username=true;
			}
			
		    /**
		     * 对用户名校验
		     */
		    $(".l_username").bind("blur",function(){
		    	
		    	if($(this).val() !=DEFAULT_USERNAME){
		    	
		    	
		    	var mythis=$(this);
		    	var filter=/^[a-zA-Z\u4e00-\u9fa5]{1}[a-zA-Z0-9_\u4e00-\u9fa5]{1,8}$/;
		    	var str = mythis.val();
				str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
				
		    	if( str ==""|| str==null ){
		    		layer.tips('*用户名不能为空', mythis);
		    		mythis.focus();
		    		ok_username=false;
				}else{
					
					if(filter.test( mythis.val() )){
						//调用ajax验证用户是否已被注册
						
						//start
						$.ajax({
							type:'post',
							dataType:'json',
							url:CTPPATH+"/admin/user/checkUser",
							data:{"userName":str},
						
							beforeSend:function(){
								//显示正在加载
								layer.load(2,{offset: 10,time:2000});
							},
							success:function(data){
			
								//关闭正在加载
								setTimeout(function(){
									  layer.closeAll('loading');
								}, 1000);
								
								//代表用户名可用
								if(data==1){
									layer.tips('恭喜！用户名可用', mythis);
									ok_username=true;
								}else if(data==0){
									//代表用户名不可用
									layer.tips('*抱歉，用户名已被使用', mythis);
									
									ok_username=false;
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
						layer.tips('*用户名为2-9字符,首字不为数字,无特殊字符 !', mythis);
						mythis.focus();
						ok_username=false;
					}
				}
		    	
		      }
		    });
		    
		    /**
		     * 对邮箱校验
		     */
		    $(".l_email").bind("blur",function(){
		    	
		    	if($(this).val() != DEFAULT_EMAIL){
		    		
		    	
		    	var mythis=$(this);
		    	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		    	var str = mythis.val();
				str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
				if( mythis.val() == "" || mythis.val==null ){
					layer.tips('邮箱不能为空', $(this));
					mythis.focus();
		    		ok_email=false;
				}else{
					if(filter.test( mythis.val() )){
						//ajax验证邮箱是否被使用
						//start
						$.ajax({
							type:'post',
							dataType:'json',
							url:CTPPATH+"/admin/user/checkEmail",
							data:{"email":str},
						
							beforeSend:function(){
								//显示正在加载
								layer.load(2,{offset: 10,time:2000});
							},
							success:function(data){
			
								//关闭正在加载
								setTimeout(function(){
									  layer.closeAll('loading');
								}, 1000);
								
								//代表用户名可用
								if(data==1){
									layer.tips('恭喜！邮箱可用', mythis);
									ok_email=true;
								}else if(data==0){
									//代表用户名不可用
									layer.tips('*抱歉，邮箱已被使用', mythis);
								
									ok_email=false;
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
						layer.tips('*邮箱格式不正确', mythis);
						mythis.focus();
						ok_email=false;
					}
				 }
		    	}
		    });
		    
		    /**
		     * 对密码进行校验
		     */
		    
		    
		    //如果都为空，则不进行验证，有一个不为空，需要全部验证通过
		    
		    if($(".l_old_password").val() ==""  && $(".l_new_password").val()=="" && $(".l_re_new_password").val() ==""){
		    	ok_old_password=true;
		    	ok_new_password=true;
		    	ok_re_new_password=true;
		    }
		    
		    if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
		    	ok_old_password=false;
		    	ok_new_password=false;
		    	ok_re_new_password=false;
		    }
		    
		    $(".l_old_password").bind("blur",function(){
		    	var filter=/^[a-zA-Z0-9_]{5,18}$/;
		    	var str = $(this).val();
				str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
				if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
					if(filter.test( $(this).val() )){
						layer.tips('密码格式正确', $(this));
						ok_old_password=true;
					}else{
						layer.tips('*密码5-18字符 ,不能有特殊字符!', $(this));
						$(this).focus();
						ok_old_password=false;
					}
				}
		    });
		    
		    $(".l_new_password").bind("blur",function(){
		    	var filter=/^[a-zA-Z0-9_]{5,18}$/;
		    	var str = $(this).val();
				str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
				if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
					if(filter.test( $(this).val() )){
						layer.tips('密码格式正确', $(this));
						ok_new_password=true;
					}else{
						layer.tips('*密码5-18字符 ,不能有特殊字符!', $(this));
						$(this).focus();
						ok_new_password=false;
					}
				}
		    });
		    
		    /**
		     * 对重复密码校验
		     */
		    $(".l_re_new_password").bind("blur",function(){
		    	var filter=/^[a-zA-Z0-9_]{5,18}$/;
		    	var str = $(this).val();
				str = str.replace(/\s/g , '');//输入空格时自动忽略，\s表示空格
				if($(".l_old_password").val() !=""  ||  $(".l_new_password").val()!="" || $(".l_re_new_password").val() !=""){
					if(filter.test( $(this).val() )){
						 
						if($(this).val()!=$(".l_new_password").val()){
							layer.tips('*两次填写的密码不一致!', $(this));
							$(this).focus();
						}else{
							layer.tips('重复密码正确!', $(this));
							ok_re_new_password=true;
						}
					 
					}else{
						layer.tips('*重复密码5-18字符 ,不能有特殊字符!', $(this));
						$(this).focus();
						ok_re_new_password=false;
					}
				
				}
		    });
		 

		    //执行修改
		    
		    $("form").eq(0).bind("submit",function(e){
		    	
		    	//阻止自动提交
		    	e.preventDefault();
		    	
		    	//xalert(ok_username +" - "+ok_email+" - "+ok_password+" - "+ok_re_password);
		    	var uid=$(".uid").val();
		    	var userName=$(".l_username").val();
		    	var email=$(".l_email").val();
		    	var old_password=$(".l_old_password").val();
		        var new_password=$(".l_new_password").val();  
		    	if(ok_username==true && ok_email ==true && ok_old_password ==true && ok_new_password==true && ok_re_new_password ==true){
		    		
		    		
		    		 
		    		//start
		    		$.ajax({
						type:'post',
						dataType:'text',
						url:CTPPATH+"/admin/user/update",
						data:{"uid":uid,"userName":userName,"email":email,"oldPassword":old_password,"newPassword":new_password},
					
						beforeSend:function(){
							//显示正在加载
							layer.msg('正在修改密码');
						},
						success:function(data){

							//关闭正在加载
							setTimeout(function(){
								  layer.closeAll('loading');
							}, 1000);
							
							//代表用户名可用
							if(data==1){
								layer.msg('恭喜！用户信息修改成功',{time:4000});
								
							}else if(data==0){
								//代表用户名不可用
								layer.msg('*抱歉，用户的原始密码输入错误，请核对后再输入！',{time:4000});
								
							}else{
								layer.msg('*抱歉，用户信息修改失败！',{time:4000});
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
		    		layer.msg("用户信息验证失败，请将信息填写正确后再提交！");
		    	}
		    	
		    });
       });
    </script>
</body>
</html>