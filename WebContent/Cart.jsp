<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>购物车</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,小象生鲜网">
    <meta name="Description" content="小象生鲜网是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，小象生鲜网是您悠悦生活的品质之选。">
    <link rel="shortcut icon" herf="img/logo.jpg" />
    <link rel="stylesheet" href="css/public.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/nav.css" />
    <link rel="stylesheet" href="css/shopcar.css" />

	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>

    <script src="http://static01.yiguo.com/www/js/jquery.js"></script>
    
    <script>
        yg_x = new Date();
        var yw_data = {};
    </script>
    <script type="text/javascript" src="js/js01.js"></script>
    <!-- start Dplus -->
    <script type="text/javascript" src="js/js02.js"></script>
    <!-- end Dplus -->
    <script type="text/javascript" src="js/js03.js"></script>
    
    <script  src="js/cart_js_ly.js"></script>
    <script  src="js/cart_js_ly2.js"></script>
    
	<script type="text/javascript">
		
		


	</script>

</head>

<body id="body">
    <div class="w">
        <div id="topads">
            <script id="topadstpl" type="text/x-handlebars-template">
                {{#TopAds}}
                <a href="{{Link}}">
                    <img src="{{Image}}" style="width:100%;" />
                </a>
                {{/TopAds}}
            </script>
        </div>

        <div class="site-nav">
            <div class="wrap">
                <ul class="fl">
                    <li>欢迎光临小象生鲜！</li>
                    <li class="city clearfix">
                        <div class="city-sz">配送至：</div>

                        <div class="city-tit">
                            <a class="city-name" href="javascript:void(0)">天津
                                <s></s>
                            </a>
                        </div>
                    </li>
                </ul>
                <ul class="fr">


                   
              
                    
                   
                    <li id="_logout" style="display:none">
                        <a href="javascript:;" class="logout">[退出]</a>
                    </li>
                    <li id="_loginname" style="display:none">
                        <a rel="nofollow" href="http://home.yiguo.com"></a>
                    </li>
                    <li id="_register" style="display:none">
                        <a rel="nofollow" href="https://login.yiguo.com/Register?url=http://www.yiguo.com/">[注册]</a>
                    </li>
                    <li id="_login" style="display:none">
                        <a rel="nofollow" href="https://login.yiguo.com/ub/login.aspx?url=http://www.yiguo.com/">[登录]</a>
                    </li>
                </ul>
            </div>
        </div>

        <script src="js/fixed.js" type="text/javascript" charset="utf-8"></script>
        <div class="header clearfix">
            <div class="wrap">
                <div class="logo">
                    <a href="./index.jsp" target="_blank">
                        <img src="img/logo.png">
                    </a>
                </div>
                <div class="steps">
                    <ul>
                        <li class="on">
                            <b class="b1"></b>
                            <span>我的购物车</span>
                        </li>
                        <li>
                            <i></i>
                            <b class="b2"></b>
                            <span>填写订单信息</span>
                        </li>
                        <li>
                            <i></i>
                            <b class="b3"></b>
                            <span>成功提交订单</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>



        <div class="cart" style="margin-top: 8px">
            <div class="wrap">
                <h2 style="    
                        font-weight: normal;
                        height: 38px;
                        line-height: 38px;
                        background-color: #fff;
                        background-position: 0 0;
                        border-bottom: 2px solid #05984d;
                        text-indent: -9999em;
                        background-image: url(../img/bg_cart.png);
                        background-repeat: no-repeat;
                        position: relative;">
                   		我的购物车
                    <a class="on-shopping" href="./index.jsp">继续购物 &gt; &gt;</a>
                </h2>
                <div class="cart-alert">
                    <div class="cart-header">
                        <table class="cart-table">
                            <tbody>
                                <tr>
                                    <th class="cart-t-check">
                                        <label>
                                            <a onclick="cart_checkall()" style="cursor:pointer;">全选</a>
                                            <a onclick="cart_checkother()" style="margin:20px;cursor:pointer;">反选</a>
                                        </label>
                                    </th>
                                    <th class="cart-t-info">商品信息</th>
                                    <th class="cart-t-price">单价￥</th>
                                    <th class="cart-t-num">购买数量</th>
                                    <th class="cart-t-total">合计￥</th>
                                    <th class="cart-t-opera">操作</th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="cart-list" id="theInsulationCan">
                        <table class="cart-table" id="cart-table">
                            <tr>
                            	<tbody id="cart-table-body">
	                               
	                            </tbody>
                            </tr>
                        </table>
                        <div id="theCart" style="display:none;">
                            <span id="theTotalUB">0</span>
                            <span id="theTotalPrice">24.90</span>
                        </div>

                    </div>

                    <div class="cart-footer clearfix settle">
                        <div class="wrap">
                            <div class="fl">
                               
                                <a onclick="cart_checkall()" style="margin:0px;cursor:pointer;">全选</a>
                                <a onclick="cart_checkother()" style="cursor:pointer;">反选</a>
                                <a onclick="cart_deleteselect()" style="cursor:pointer;"><i></i>删除选中商品</a>

                            </div>
                            <div class="fr">
                                <span class="fs14">总价：
                                    <em>￥
                                        <span id="totalprice">正在计算中</span>
                                    </em>
                                </span>
                                <input id="SelectedCommIds" name="SelectedCommIds" type="hidden" value="">

                                <a class="btn" id="btnSubmit" onclick="gotoAccount()" name="btnSubmit" style="cursor:pointer;">去结算</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <div class="footer_service">
            <div class="wrap">
                <ul>
                    <li class="s1">
                        <b>全球精选</b>
                        <span>一站式生鲜购物方案</span>
                    </li>
                    <li class="s2">
                        <b>多仓直发</b>
                        <span>特有次日达配送服务</span>
                    </li>
                    <li class="s3">
                        <b>源头直采</b>
                        <span>精选正宗品质好食材</span>
                    </li>
                    <li class="s4">
                        <b>天天底价</b>
                        <span>会员专属优惠购不停</span>
                    </li>
                </ul>
            </div>
        </div>

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



        <div class="sidebar" id="sidebar">
            <a href="javascript:void(0);" class="s-btn service"></a>
            <a href="#body" class="s-btn goTop"></a>
        </div>
    </div>

    <script type="text/javascript" src="js/js04.js"></script>
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
    <script src="js/shouyejiaodian.js"></script>
    <script type="text/javascript" src="js/kefu.js"></script>
    <script src="js/stats.js"></script>
</body>
</html>