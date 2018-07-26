<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>登录</title>
	<link rel="shortcut icon" href="../Content/img/yiguo.ico">
    <script type="text/javascript" id="veConnect" async="" crossorigin="anonymous" src="https://configch2.veinteractive.com/scripts/4.20/capture-apps-4.20.1.js"></script>
    <script type="text/javascript" async="" src="https://site.cdnmaster.cn/sitemaster/collect.js"></script>
    <script type="text/javascript" async="" src="https://stats.g.doubleclick.net/dc.js"></script>
    <script type="text/javascript" async="" src="https://o8npuqt84.qnssl.com/vds.js"></script>
    <script type="text/javascript" async="" src="https://ssl.emarbox.com/js/adw.js"></script>
    <script src="//tag.cdnmaster.com/tmjs/tm.js?id=TM-5FXI55" async=""></script>
    <script src="/Content/jquery.js"></script>

    <link href="css/public_first.css" rel="stylesheet">


    <link href="css/login.css" rel="stylesheet" type="text/css">

    <link href="css/themes.css" rel="stylesheet">

    <script src="/Content/tab.js"></script>

    <script src="/Content/FormValidate.js"></script>

    <script type="text/javascript">
        $(function () {
          
            $('.mobile .mobile-tit').wrap('<div class="mobile-tit-w"></div>');
            $('.mobile').hover(function () {
                $(this).addClass('mobile-hover');
            }, function () {
                $(this).removeClass('mobile-hover');
            });

            Form.VC = '有无效字符，请重新输入'
        });
    </script>

    <!--IE6png兼容-->
    <!--[if IE 6]>
    <script src="/Content/DD_belatedPNG.js"></script>
    <script src="/Content/IE6png.js"></script>
    <![endif]-->
    <script src="/Content/script/topdsp.js"></script>
    <script type="text/javascript" async="" src="//configch2.veinteractive.com/tags/CBD65260/4995/49F7/B51A/5963EB93BD47/tag.js"></script>
    <link type="text/css" rel="stylesheet" href="chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/content.css">
</head>
<body>
	<%  String username=null;String password=null;
		Cookie[] cookies=request.getCookies();  //数组s
		if(cookies!=null){  //避免空指针异常
			for(Cookie cookie:cookies){   
	         //注意是cookie的名字username，不是对象名usernamecookie
				if(cookie.getName().equals("username")){
					username=cookie.getValue();
				}
				if(cookie.getName().equals("password")){
					password=cookie.getValue();
				}
			}
		}
		if(username!=null&&password!=null){
		//jsp中可以使用跳转方式。必须将cookie中的用户名和密码传给服务器
			request.getRequestDispatcher("Login.do?userName="+username+"&password="+password+"&needVerifyCode="+ "false").forward(request, response);
		} %>
    <div class="w">

        <div class="popout protocol-poput" id="p-code">
            
            <div class="popout-bg">&nbsp;</div>
        </div>

        <div class="header clearfix">
            <div class="wrap">
                <div class="logo">
                    <a href="http://www.xiaoxiang.com" target="_blank">
                        <img src="img/logo.png">
                    </a>
                    <span class="h-tit">登录</span>
                </div>
            </div>
        </div>

        <script type="text/javascript">

            $(function () {
                $('#Pwd').keydown(function (e) {

                    if (e.keyCode == 13) {
                        document.getElementById("btnLogin").click(); //调用登录按钮的登录事件
                    }
                });

                $("#btnLogin").click(function () {
                    if (Form.Validate($("#UserName").val())) {
                        $("#msg-wrap").addClass("msg-wrap").children("div").addClass("msg-error").html(Form.VC);
                        return false;
                    }

                    $('form').submit();
                });

                $(".gray").click(function () {
                    $("#imgcode").attr("src", "/verifycode" + "?_t=" + new Date().getTime());
                });

                $("#p-code-btn").on("click", ".qq,.sina", function () {
                    $("#p-code").show();
                })
                $("#p-code").on("click", ".close", function () {
                    $("#p-code").hide();
                })

            });

        </script>
		
        <form action="Login.do" method="post">
            <div class="login">
                <div class="wrap clearfix">
                    <div class="fl">
                        <a href="http://www.xiaoxiang.com" target="_blank">
                            <img width="666" height="418" src="img/guanggao.png">
                        </a>
                    </div>
                    <div class="fr">
                        <p class="right"></p>
                        <div class="login-main">
                            <p>
                                <strong>欢迎登录</strong>
                                <span>还没有账号？
                                    <a class="green" href="./register.jsp">立即注册</a>
                                </span>
                            </p>

                            <div id="msg-wrap">
                                <div> </div>
                            </div>

                            <p>
                                <span class="input-phone-icon">&nbsp;</span>
                                <input class="input input-phone" id="UserName" name="UserName" placeholder="账号" type="text" value="">
                            </p>
                            
                            <p>
                                <span class="input-key-icon">&nbsp;</span>
                                <input class="input input-key" id="Pwd" name="Pwd" placeholder="密码" type="password">
                            </p>
                            <p>
                                <input class="input input-key" id="VerifyCode" name="VerifyCode" placeholder="验证码" style="width:100px;float:left;" type="text"
                                    value="">
                                    
                                <img src="Login.do" id="imgcode" name="imgcode" onclick="this.src=this.src" style="float:right;">
                            </p>
                            <p>
                                <label>
                                    <input data-val="true" data-val-required="自动登录 字段是必需的。" id="UserNameRemeber" name="UserNameRemeber" type="checkbox" value="true">
                                    <input name="UserNameRemeber" type="hidden" value="false"> 自动登录</label>
                                <span>
                                    <a class="gray" href="/FindPwd">忘记登录密码？</a>
                                </span>
                            </p>
                            <p>
                                <a id="btnLogin" href="javascript:loginFunction()" class="btn-green-l">登 &nbsp; 录</a>
                                <input id="btnLogin_input" type ="submit" style ="display: none;" >
                            	<script type="text/javascript">
	                            	function loginFunction(){
	                            		var isOk=1;
	                            		if(document.getElementById("VerifyCode").value ==""){
	                            			document.getElementById("VerifyCode").placeholder="验证码不能为空";
	                            			document.getElementById("VerifyCode").focus();
	                            			isOk=0;
	                            		}
	                            		if(document.getElementById("Pwd").value ==""){
	                            			document.getElementById("Pwd").placeholder="密码不能为空";
	                            			document.getElementById("Pwd").focus();
	                            			isOk=0;
	                            		}
	                            		if(document.getElementById("UserName").value ==""){
	                            			document.getElementById("UserName").placeholder="账号不能为空";
	                            			document.getElementById("UserName").focus();
	                            			isOk=0;
	                            		}
	                            		if(isOk==1){
	                            			document.getElementById("btnLogin_input").click();
	                            		}
	                            	};
                            	</script>
                            </p>

                        </div>
                    </div>
                </div>
            </div>
        </form>

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
                            <a href="http://www.yiguo.com/activity/sale/2998">会员等级
                                <i class="ml5">
                                    <img src="http://img06.yiguoimg.com/e/web/170315/00941/154425/icon-new.png">
                                </i>
                            </a>
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
                <div class="service">
                    <span>客服热线 400-888-8888 企业采购或团购，请转2号键咨询</span>
                    <span>周一至周日 9:00-21:00</span>
                </div>
                <div class="copyright">
                    <p>
                        <a href="http://www.miibeian.gov.cn/state/outPortal/loginPortal.action" target="_blank" rel="nofollow">津ICP备098491015号 </a> Copyright © 2017-2018
                        <a href="http://www.xiaoxiang.com/">天津Spark商务有限公司</a>版权所有</p>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/js04.js"></script>


        <div class="sidebar" id="sidebar">
            <a href="javascript:void(0);" class="s-btn service"></a>
            <a href="#body" class="s-btn goTop"></a>
        </div>
    </div>

    <script src="js/js05.js"></script>
    <script src="js/js06.js"></script>
    <script src="js/utaste.js"></script>
    <script src="js/base.js"></script>
    <script src="js/jquery.superslide.js"></script>
    <script src="js/sidebar.js"></script>
    <script src="js/floor-guide.js"></script>
    <script src="js/global-v2.js"></script>
    <script src="js/search.js"></script>
    <script src="js/city.js"></script>
    <script src="js/app.js"></script>
    <script src="js/common.js"></script>
    <script src="js/util.js"></script>

    <!-- 自动适配移动端与pc端 -->
    <script src="js/kit.js" charset="utf-8"></script>
    <script src="js/chat.js"></script>
    <script>
        $(function () {
            app.init();
            YgmDplus.init("www.xiaoxiang.com", "", "");
        })
    </script>
    <script src="js/shouyejiaodian.js"></script>
    <script type="text/javascript" src="js/kefu.js"></script>
    <script src="js/stats.js"></script>
</body>

</html>