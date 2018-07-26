<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8" import="java.util.ArrayList" import="com.spark.bean.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>结算</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,小象生鲜网">
    <meta name="Description" content="小象生鲜网是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，小象生鲜网是您悠悦生活的品质之选。">
    <link rel="shortcut icon" herf="img/logo.jpg" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="css/city-picker.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/public.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/nav.css" />
    <link rel="stylesheet" href="css/order.css" />
    <link rel="stylesheet" href="css/yg.css" />
    

    <script>
        yg_x = new Date();
        var yw_data = {};
    </script>
    <script type="text/javascript" src="js/js01.js"></script>
    <!-- start Dplus -->
    <script type="text/javascript" src="js/js02.js"></script>
    <!-- end Dplus -->
    <script type="text/javascript" src="js/js03.js"></script>
    <script type="text/javascript" src="js/create_account_js_ly.js"></script>
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


                    <li class="TEL">
                        <a rel="nofollow" href="http://home.yiguo.com/Trade/OnlineDelivery" target="_blank">
                            <i></i>礼品兑换券入口</a>
                    </li>
                    <li class="pay">
                        <a rel="nofollow" href="http://home.yiguo.com/Recharge/Index" target="_blank">
                            <i></i>储值卡</a>
                    </li>

                    <li class="mobile">
                        <!--<div class="tit"><a href="javascript:void(0)"><i></i>手机易果<s></s></a></div>
                        <div class="con">
                            <div class="item"><img src="http://static01.yiguo.com/www/images/header/qrcode_app.jpg" width="125" height="125"><span>扫一扫下载APP</span></div>
                            <div class="item"><img src="http://static01.yiguo.com/www/images/header/qrcode_wechat.jpg" width="125" height="125"><span>易果生鲜微信</span></div>
                        </div>-->
                    </li>
                    <li class="myyiguo">

                        <div class="tit">
                            <a rel="nofollow" href="http://home.yiguo.com" target="_blank">
                                <i></i>我的易果
                                <s></s>
                            </a>
                        </div>
                        <div class="con">
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/OrderList">我的订单</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/MyCoupons">我的优惠券
                                <b id="coupon">0</b>
                            </a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/MyCollection">我的收藏</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/UMoney">我的悠币</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/BackOrder">我的退换货</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Account/Balance">预存款查询</a>
                            <a rel="nofollow" href="http://event.yiguo.com/activity/">立即充值</a>
                            <a rel="nofollow" href="javascript:;" class="logout" style="display:none;">退出</a>

                        </div>
                    </li>
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
                        <li class="on">
                            <i></i>
                            <b class="b2"></b>
                            <span>确认订单信息</span>
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



        <div class="order">
            <div class="wrap">
                <h2>填写核对订单信息</h2>
                <div class="order-alert">
                    <!--收货信息-->
                    <div id="order1" class="order-mode complete">
                        <h3>
                            <i class="o-i-receive"></i>收货地址</h3>
                        <div class="o-receive">
                            <div>
	                        	<div class="docs-methods">
									<form class="form-inline">
										<div id="distpicker">
											<div class="form-group">
												<div style="position: relative;">
													<input id="city-picker3" class="form-control" readonly type="text" value="请选择省/市/区" data-toggle="city-picker">
												</div>
												
											</div>
											
											<div style="position: relative;">
												<input id="detailaddress" type="text" style="margin-top:20px;height:34px" placeholder="详细地址：街道/楼牌号" value=""></input>
											</div>
										</div>
									</form>
								</div>
                    		</div>

                            <div id="customDelivery" style="display:none">
                                <a class="link selectedConsignee" style="cursor:pointer; display:none">选择配送地址</a>
                                <div class="pickup">
                                    <h4>到自提点自取</h4>
                                    <ul class="pickup-addr"></ul>
                                    <div class="consignee-info">
                                        <span>提货人：
                                            <input id="" type="text" class="input" name="Custom-ConsigneeName">
                                        </span>
                                        <span>电话：
                                            <input id="" type="text" class="input" name="Custom-ConsigneePhone">
                                        </span>
                                    </div>
                                    <div class="pickup-agree">
                                        <input type="checkbox" checked="">我已阅读并同意
                                        <a data-toggle="modal" data-backdrop="static" href="#myModal3" class="selected" style="text-decoration: underline;">《易果生鲜自提服务协议》</a>
                                    </div>
                                </div>
                            </div>




                        </div>

                    </div>

                    <!--商品信息-->
                    <div id="order5" class="order-mode">
                        <h3>
                            <i class="o-i-commodity"></i>商品信息
                            <a class="backcart" href="http://cart.yiguo.com">返回购物车&gt;&gt;</a>
                        </h3>
                        <div class="o-commodity">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th width="590">商品名称</th>
                                        <th>单价</th>
                                        <th>数量</th>
                                        <th>金额小计</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <% ArrayList<ProductOfOrderdetail> productList = (ArrayList<ProductOfOrderdetail>)request.getAttribute("productList");%>
                                <%
	                                float totalPrice = 0;
	                                for(int i=0;i<productList.size();i++){
	                                	float price = productList.get(i).getPrice();
	                                	int num = productList.get(i).getNum();
                                %>
                                	 <tr>
                                     <td>
                                         <a target="_blank"><%=productList.get(i).getProductName()%></a>
                                         <p class="gray2">不支持7天无理由退货</p>

                                     </td>
                                     <td>￥<%=productList.get(i).getPrice()%></td>
                                     <td><%=productList.get(i).getNum()%></td>
                                     <td>￥<%=(float)(Math.round(price*num*100))/100%></td>
                                 </tr>
                                <% totalPrice = totalPrice + (float)(Math.round(price*num*100))/100;
                                } %>
                                </tbody>
                            </table>
                            
                            
                            
                            <div class="mt10 clearfix">
                                <div class="fl">补充说明：
                                    <input id="txtWebRemark" type="text" placeholder="选填，补填要求">
                                </div>
                                <input type="hidden" id="hascard" value="0">
                                <input type="hidden" id="hasNormalCommodity" value="1">

                            </div>


                        </div>
                    </div>


                    <div id="orderPlus" class="order-mode-last">
                        <h3>
                            <i class="o-i-order"></i>收货人信息</h3>
                        <div class="o-order">
                            <div>收货人姓名：
                                <input id="OrderUserName" type="text" class="input" placeholder="必填" maxlength="20">
                            </div>
                            <div>收货人手机：
                                <input id="OrderUserMobile" type="text" class="input" placeholder="必填" maxlength="15">
                            </div>
                        </div>
                    </div>
                    <div id="order7" class="statistic">
                        <p class="right">商品金额：￥
                            <span><%=totalPrice%></span>
                        </p>
                        <p class="right">运费：￥
                            <span>0.00</span>
                        </p>
                        <p class="right">预存款抵扣：￥-
                            <span>0.00</span>
                        </p>
                        <p class="right">优惠金额：￥-
                            <span>0.00</span>
                        </p>
                    </div>
                    <div class="settle-space"></div>
                    <div id="order71" class="cart-footer clearfix settle">
                        <div class="wrap">
                            <div class="right">
                                <span class="fs14">应付款：<em>￥</em><em><%=totalPrice%></em></span>
                                <a id="btnOrderSubmit" href="###" onclick="submitOrder()" class="btn" style="background-color: rgb(255, 83, 23);">提交订单</a>
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
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/city-picker.data.js"></script>
	<script src="js/city-picker.js"></script>
	<script src="js/main.js"></script>

    <!-- 自动适配移动端与pc端 -->
    <script src="js/kit.js" charset="utf-8"></script>
    <script src="js/chat.js"></script>
    <script src="js/shouyejiaodian.js"></script>
    <script type="text/javascript" src="js/kefu.js"></script>
    <script src="js/stats.js"></script>
</body>
</html>