<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- saved from url=(0058)https://login.xiangxiang.com/Register?url=http://www.xiangxiang.com/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>小象网</title>
    <link rel="shortcut icon" href="https://login.xiangxiang.com/Content/img/xiangxiang.ico">
    <script type="text/javascript" id="veConnect"  crossorigin="anonymous" src="js/capture-apps-4.20.1.js"></script>
    <script type="text/javascript"  src="js/collect.js"></script>
    <script type="text/javascript"  src="js/vds.js"></script>
    <script type="text/javascript"  src="js/adw.js"></script>
    <script src="js/tm.js" ></script>
    <script src="js/ifs.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.js"></script>
    <script src="js/tab.js"></script>
    <script src="js/FormValidate.js"></script>
    <script src="js/bootstrap.js"></script>
	<script src="js/city-picker.data.js"></script>
	<script src="js/city-picker.js"></script>
	<script src="js/main.js"></script>
	<script src="js/easyform.js"></script>
   
	<link href="css/customer.css" rel="stylesheet">	
    <link href="css/zhuce.css" rel="stylesheet">
	<link href="css/nav.css" rel="stylesheet">	
    <link href="css/index.css" rel="stylesheet">	
    <link href="css/zhu.css" rel="stylesheet">
	<link href="css/sex.css" rel="stylesheet">
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/city-picker.css" rel="stylesheet">
	<link href="css/register.css" rel="stylesheet">
   

    <!--IE6png兼容-->
    <!--[if IE 6]>
    <script src="/Content/DD_belatedPNG.js"></script>
    <script src="/Content/IE6png.js"></script>
    <![endif]-->
    <script src="js/topdsp.js"></script>
    <script type="text/javascript"  src="js/tag.js"></script>
</head>


<body id="body">
    <!------- 顶部工具栏开始 ------->
    <div class="w">

        <!------- 顶部工具栏结束 ------->
        <script src="js/Reg.js"></script>





<script type="text/javascript">
    $(function () {
        $(".gray").click(function () {
            $("#imgcode").attr("src", "/verifycode" + "?from=register&_t=" + new Date().getTime());
        });

        $(".nav-tabs a").click(function () {
            var href = $(this).attr("href");

            if (href == "#tab1") {
                $("#verficode_tab1").after($(".gray"));
                $("#verficode_tab1").after($("#imgcode"));
            }
            else {
                $("#verficode_tab2").after($(".gray"));
                $("#verficode_tab2").after($("#imgcode"));
            }
        });
    });
</script>
<div class="popout protocol-poput">
    <div class="popout-wrap">
        <div class="popout-con">
            <div class="title">小象服务协议<a class="close" href="javascript:void(0);"></a></div>
            <div class="con">
                <div class="register-protocol">
                    <div class="doc">
                        <div>
                            <p>
                                <strong>【审慎阅读】</strong> 您在申请注册流程中点击同意本协议之前，应当认真阅读本协议。
                                <strong class="underline">请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款、法律适用和争议解决条款。免除或者限制责任的条款将以粗体下划线标识，您应重点阅读。</strong>                                    如您对协议有任何疑问，可向客服咨询。
                            </p>
                        </div>
                    </div>

                </div>
                <div class="btnbox"><a class="btn-gn" href="javascript:void(0);">同意并继续</a></div>
            </div>
        </div>
    </div>
    <div class="popout-bg">&nbsp;</div>
</div>

<div class="header clearfix">
    <div class="wrap">
        <div class="logo">
            <a href="http://www.xiaoxiang.com/" target="_blank"></a>
            <a href="#" target="_blank" class="l2 goTop"></a>
            <span class="h-tit">用户注册</span>
        </div>
    </div>
</div>
<form action="register" method="post" id="reg-form" >   
	<div class="register">
        <div class="wrap">
            <div class="tabbable">
                <!-- tabs -->
                <ul class="nav-tabs" style="display:none;">
                    <li id="tab1li" class="active"><a href="#" data-toggle="tab">手机注册</a></li>
                    <li id="tab2li"><a href="https://login.xiangxiang.com/Register?url=http://www.xiangxiang.com/#tab2" data-toggle="tab">邮箱注册</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane clearfix active" id="tab1">
                        <div class="fl">
                            <p class="clearfix" style="line-height:38px;">
                                <span></span>
                            </p>
                            <p>
                            <form  enctype="application/x-www-form-urlencoded" >
                                <span class="field-name"  name="userName">用户名</span>
                                <input class="input input-phone"  name="uid" type="text" id="uid" easyform="length:4-16;char-normal;real-time;" message="用户名必须为4—16位的英文字母或数字" easytip="disappear:lost-focus;theme:blue;" ajax-message="用户名已存在!" placeholder="请输入您的用户名" value="">
                                	<span id="msg">请输入用户名</span>
                                	<div id="divcheck" ></div>
                              </form>
                              
                            </p>
                            
                            <p>
                                <span class="field-name" name="password" >设置密码</span>
                                <input class="input input-key"  placeholder="6-20位字母、符号或数字"  name="psw1" type="password" id="psw1" easyform="length:6-16;" message="密码必须为6—16位" easytip="disappear:lost-focus;theme:blue;">
                                <span></span>
                            </p>
                            <p>
                                <span class="field-name" name="repassword" >确认密码</span>
                                <input class="input input-key"  placeholder="再次输入密码" name="psw2" type="password" id="psw2" easyform="length:6-16;equal:#psw1;" message="两次密码输入要一致" easytip="disappear:lost-focus;theme:blue;">
                                <!--<span class="pass-tip"><i></i>密码不能为空</span>-->
                            </p>
                            	<span class="field-name" name="age" >年龄</span>
                            	
                            	 	<select name="qx" id="qx" onchange="jump_qx(this)" >
                            	 		<script language="javascript">
                            	 			for(var i = 5; i <= 90; i++) document.write('<option value="' + i + '">' + i + '</option>');
                            	 		</script>
                            	 		<select>
                            	 			岁
                            	 			
                            </p>
                            <p>
                            	<span class="field-name" name="sex" >性别</span>
                            	<input type="radio" checked="checked" class="rdo" name="sex" value="男"/>男
									<input type="radio" name="sex" class="rdo"  value="女"/>女
                            	 
                            </p>
                             <p>
                            	<span class="field-name" name="address" >家庭住址</span>
                            	<div class="form-group">
									<div style="position: relative;     margin-left: 138px;">
										
										<input id="city-picker3" name="city" class="form-control" readonly type="text" value="江苏省/常州市/溧阳市" data-toggle="city-picker">
									</div>
								</div>
				
			
                            </p>
                            <p>
                                <span class="field-name" name="email" >邮箱账号</span>
                                <input class="input input-key" name="email" id="email" easyform="email;real-time;" message="Email格式要正确" easytip="disappear:lost-focus;theme:blue;" ajax-message="这个Email地址已经被注册过，请换一个吧!" id="" name="" placeholder="邮箱" type="email" value="">
                                <span></span>
                            </p>
                            <p>
                               
                                <input id="DeviceId" name="DeviceId" type="hidden" value="">
                            </p>
                            <span></span>
                            <p>
                            	<span class="field-name">
                            		
                            	</span>
                            	<!--<a href=""# class="btn-green-l" id="PhoneReg">立即注册</a>-->
                            	 <input value="立即注册" id="zhuceb"  type="submit" style="     cursor: pointer;margin-right:20px; margin-top:20px;    border: 0px;width: 306px;height: 50px;background-color: #008842;    font-family: -webkit-body;font-size: 27px;color: white;">
                            </p>
                           
                        </div>
                        <div class="fr">
                            <div class="rimg"><img src="img/register.png"></div>
                           
                            
                        </div>
                    </div>
                    
                </div>
                <div class="right">                    
                    我已经注册，现在就 <a class="orange" href="./Login.jsp">登录</a>
                    
                </div>
            </div>
        </div>
    </div>
   
<input id="HdAction" name="HdAction" type="hidden" value="">
<input value="ad2c8a7f-25a4-4c1c-baa0-9118c296ee41" id="UserID" name="UserID" type="hidden">
</form>
 
 <script type="text/javascript" src="js/easyform.js"></script>
 <script type="text/javascript" >
window.onload = function() {
	//通过id获取页面button的onclick点击事件
	    document.getElementById("uid").onblur = function() {
	        var username = document.getElementById("uid").value;
	        //测试打印出username(输入值)
	       
	        //1.创建ajax对象
	        var xhr = ajaxFunction();
	        xhr.onreadystatechange = function() {
	            //处理后台返回的数据
	            if(xhr.readyState == 4) {
	                if(xhr.status == 200) {
	                    var data= xhr.responseText;
	                   // document.getElementById("divcheck").innerHTML = data;
	                    
	                    var msg=document.getElementById("msg");
	                    if(data.trim()=="true"){
	                    	 msg.innerHTML="<font color='green'>可以使用</font>";
	                    }else{
	                       msg.innerHTML="<font color='red'>该昵称已注册</font>";
	                    }
	                    
	                }
	            }
	        }
	    //规定发送数据的形式（post/get），url，以及传输方式(同步/异步)
	        xhr.open("post","./RUserServlet?timeStamp="+new Date().getTime(),true);
	        //post方式需要加下边这句，get方式不需要
	        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	        //将页面输入数据发送到后台
	        xhr.send("username="+username);
	    }
	}

	function ajaxFunction() {
	    var xmlHttp;
	    try {
	        xmlHttp = new XMLHttpRequest();
	    } catch(e) {
	        try {
	            xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
	        } catch(e) {
	            try {
	                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	            } catch(e) {}
	        }
	    }
	    return xmlHttp;
	}
</script>
 

 
 <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('#reg-form').easyform();
	});
	
</script>

<!-- 生产地址 -->
<script src="js/ygtracker.js"></script>


        <!------- 页尾开始 ------->
       <div class="footer">
				<div class="wrap">
					<dl class="col1">
						<dt>新手指南</dt>
						<dd>
							<p>
								<a href="/help/registersteps.html">账户注册</a>
							</p>
							<p>
								<a href="/help/gouwuliucheng.html">购物流程</a>
							</p>
							<p>
								<a href="/help/ordering.html">订购方式</a>
							</p>
							<p>
								<a href="/help/ubremark.html">悠币说明</a>
							</p>
							<p>
								<a href="http://www.yiguo.com/activity/sale/2998">会员等级<i class="ml5"><img src="http://img06.yiguoimg.com/e/web/170315/00941/154425/icon-new.png"></i></a>
							</p>

						</dd>
					</dl>
					<dl class="col2">
						<dt>付款方式</dt>
						<dd>
							<p>
								<a href="/help/payment.html">支付方式</a>/
								<a href="/help/invoiceremark.html">发票说明</a>
							</p>
							<p>
								<a href="/help/chongzhiliucheng.html">充值说明</a>
								<a href="/help/usechuzhika.html">/储值卡说明</a>
							</p>
							<p>
								<a href="/help/usegiftcard.html">优惠代码/礼品卡说明</a>
							</p>
							<p>
								<a href="/help/cardbuynotes.html">卡券购买章程</a>
							</p>
						</dd>
					</dl>
					<dl class="col3">
						<dt>配送方式</dt>
						<dd>
							<p>
								<a href="/help/sendyuefei.html">配送运费</a>
							</p>
							<p>
								<a href="/help/sendquyu.html">配送范围</a>
							</p>
							<p>
								<a href="/help/sendtime.html">配送时间</a>
							</p>
						</dd>
					</dl>
					<dl class="col4">
						<dt>售后服务</dt>
						<dd>
							<p>
								<a href="/help/tuihuanhuoshuoming.html">退换货政策</a>
							</p>
							<p>
								<a href="/help/huanhuolc.html">退换货流程</a>
							</p>
							<p>
								<a href="/help/qa.html">常见问题</a>
							</p>
							<p>
								<a href="/help/quicknessrefund.html">极速退款</a>
								<p>
									<p>
										<a href="http://home.yiguo.com/Trade/Advice">投诉与建议</a>
									</p>
						</dd>
					</dl>
					<dl class="col5">
						<dt>关于我们</dt>
						<dd>
							<p>
								<a href="/help/introduction.html">公司介绍</a>
							</p>
							<p>
								<a href="/help/contact.html">联系我们</a>
							</p>
							<p>
								<a href="/help/procooperation.html">业务合作</a>
							</p>
							<p>
								<a href="/help/chengxinjubao.html">诚信举报</a>
							</p>
							<p>
								<a href="http://yiguo.zhiye.com/home" target="_blank" rel="nofollow">人才招聘</a>
							</p>
							<p>
								<a href="/help/friendurl.html">友情链接</a>
							</p>

						</dd>
					</dl>
					<div class="service"><span>客服热线 400-888-8888 企业采购或团购，请转2号键咨询</span><span>周一至周日 9:00-21:00</span></div>
					<div class="copyright">
						<p>
							<a href="http://www.miibeian.gov.cn/state/outPortal/loginPortal.action" target="_blank" rel="nofollow">津ICP备098491015号 </a> Copyright © 2017-2018
							<a href="http://www.xiaoxiang.com/">天津Spark商务有限公司</a>版权所有</p>
					</div>
				</div>
			</div>
        <!------- 页尾结束 ------->

    </div>




