<%@page import="com.spark.service.ShowOrderService"%>
<%@page import="com.spark.bean.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8" import="java.util.ArrayList" import="com.spark.bean.Order" import="com.spark.service.ShowOrderService"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>小象水果_全球精选_生鲜果蔬 品质食材_xiaoxiang.com</title>
		<meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,小象生鲜网">
		<meta name="Description" content="小象生鲜网是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，小象生鲜网是您悠悦生活的品质之选。">
		<link rel="shortcut icon" herf="img/logo.png" />
		<link rel="stylesheet" href="css/public.css" />
		<link rel="stylesheet" href="css/customer.css" />
		<link rel="stylesheet" href="css/index.css" />
		<link rel="stylesheet" href="css/nav.css" />
		<link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_616446_b72zo42zus9.css"/>
		<link rel="stylesheet" type="text/css" href="css/myorder.css" />
		<link rel="stylesheet" type="text/css" href="css/returns.css" />
		<link rel="stylesheet" type="text/css" href="css/search.css" />
		<link rel="stylesheet" type="text/css" href="css/themes.css" />
		<link rel="stylesheet" type="text/css" href="css/yg.css" />

		<script src="js/xiaoxiangjquery.js"></script>
		<script>
			yg_x = new Date();
			var yw_data = {};
		</script>
		<script >
		$(function() {
			var username= "<%=session.getAttribute("userInfo")%>";
			
			 //alert("<%=session.getAttribute("userInfo")%>");
			if(username!=null&&username.trim()!="null"){
			$("#register11").replaceWith($("#register22"));
			$("#login11").replaceWith($("#login22"));
			
			//$("#register22").replaceWith(username);
			$('a#register22').prop('lastChild').nodeValue ="用户：["+ username+"]";
			$("#register22").css('display','');
			
			$("#login22").css('display','');
			$("#login22").css('margin-left','20px');
			}
		})				
		</script>
		<!-- 销毁session -->
		<script type="text/javascript">
			function desession(){
				$("#register22").replaceWith($("#register11"));
				$("#login22").replaceWith($("#login11"));
				<%session.invalidate();%>
				
				
			}
		</script>	
		<script type="text/javascript" src="js/js01.js"></script>
		<!-- start Dplus -->
		<script type="text/javascript" src="js/js02.js"></script>
		<!-- end Dplus -->
		<script type="text/javascript" src="js/js03.js"></script>
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
			<!------- 顶部工具栏 ------->

			<div class="site-nav">
				<div class="wrap">
					<ul class="fl">
						<li>欢迎光临小象生鲜！</li>
						<!--送货城市 开始-->
						<li class="city clearfix">
							<div class="city-sz">配送至：</div>

							<div class="city-tit">
								<a class="city-name" href="javascript:void(0)">天津<s></s></a>
							</div>
							<div class="city-con" id="citylist">

								<div class="headline">
									<a href="javascript:;" v="64" aid="00000000-0000-0000-0000-000000000000">全国其它城市&gt;&gt;</a> 请根据您的收货地址选择
								</div>
								<div class="city-hot">
									<span><i></i>热门城市</span>
									<a href="javascript:;" v="1" aid="312d0556-0671-4f2e-8bac-7b8873b5a03a" _type="1">上海</a>
									<a href="javascript:;" v="2" aid="eabbe02f-59e0-46e6-90e7-cd8a89dbb98f" _type="1">北京</a>
									<a href="javascript:;" v="8" aid="93570b8c-0a0a-4818-8317-75a0d14093a5" _type="1">天津</a>
									<a href="javascript:;" v="128" aid="9069d884-96c5-4478-bb49-d6ba55b751c8" _type="1">南京市</a>
									<a href="javascript:;" v="128" aid="dec5b754-fe58-48d6-8b37-6bc91ee08460" _type="1">苏州市</a>
									<a href="javascript:;" v="128" aid="0dbb02ef-c055-429f-97b6-5dc7a5bfeda8" _type="1">昆山市</a>
									<a href="javascript:;" v="128" aid="361bc174-b1e5-4fb6-8f69-c391dcd92644" _type="1">无锡市</a>
									<a href="javascript:;" v="131072" aid="a10524be-acea-451e-9280-df0514e11e2b" _type="1">杭州市</a>
									<a href="javascript:;" v="131072" aid="c0a5de4e-9087-4678-9056-f589ad833656" _type="1">宁波市</a>
								</div>
								<p class="citytab"><span class="">ABCDE</span><span class="active">FGHIJ</span><span class="">KLMNO</span><span class="">PQRST</span><span class="">UVWXYZ</span></p>
								<div class="citylist">
									<dl>
										<dt>A</dt>
										<dd>
											<a href="javascript:;" v="4" aid="78d6e5b9-669d-481f-b395-cea5e1e6e5a0" _type="0">安庆市</a>
										</dd>
									</dl>
									<dl>
										<dt>B</dt>
										<dd>
											<a href="javascript:;" v="8192" aid="daf7b0e2-35ea-4183-93e2-03dd4e7211d0" _type="0">滨州市</a>
											<a href="javascript:;" v="4" aid="ebff50b7-ee3e-4f46-80c2-a8c24feb4597" _type="0">蚌埠市</a>
											<a href="javascript:;" v="32" aid="0303efe5-5a98-4b7a-b53d-c560ed809242" _type="0">保定市</a>
											<a href="javascript:;" class="hot" v="2" aid="eabbe02f-59e0-46e6-90e7-cd8a89dbb98f" _type="1"><strong>北京</strong></a>
											<a href="javascript:;" v="256" aid="15b6c4e6-69f2-4001-a631-62c0c36102b1" _type="0">北京(郊区)</a>
										</dd>
									</dl>
									<dl>
										<dt>C</dt>
										<dd>
											<a href="javascript:;" v="128" aid="160d9022-1105-48a0-b18f-3672be29c56b" _type="0">崇明县</a>
											<a href="javascript:;" v="262144" aid="8a72d144-cc9b-42b4-884e-393854bb15ee" _type="0">慈溪市</a>
											<a href="javascript:;" v="4" aid="1a6c7c1e-b4fa-4332-b36c-55039d1aec59" _type="0">滁州市</a>
											<a href="javascript:;" v="4096" aid="708f0b6e-91f2-4731-8576-07c78ea08351" _type="0">成都市</a>
											<a href="javascript:;" v="32" aid="2ef144a9-0455-4698-8503-0956ccaf16b6" _type="0">承德市</a>
											<a href="javascript:;" v="32" aid="25123e41-42e0-40e5-b2bd-76ba94daa655" _type="0">长春市</a>
											<a href="javascript:;" v="4" aid="05037210-573c-436b-b24a-9d345dca54f7" _type="0">常熟市</a>
											<a href="javascript:;" v="4" aid="a338e3c1-e7e7-4482-b248-c5875b22a27b" _type="0">常州市</a>
											<a href="javascript:;" v="4" aid="2d5dfeae-414e-450b-a581-c770b49edf2d" _type="0">池州市</a>
											<a href="javascript:;" v="16" aid="e450593b-b52f-4233-b106-cb518acb3896" _type="0">长沙市</a>
											<a href="javascript:;" v="4" aid="95af2ce4-ad65-45e6-955d-cec4b59a444f" _type="0">巢湖市</a>
											<a href="javascript:;" v="32" aid="ee36933d-939f-4f6b-8a2b-d060ee9ca495" _type="0">沧州市</a>
											<a href="javascript:;" v="16" aid="7c046210-81f3-4638-a09b-6b2e8ecbe957" _type="0">重庆</a>
										</dd>
									</dl>
									<dl>
										<dt>D</dt>
										<dd>
											<a href="javascript:;" class="hot" v="512" aid="20c2f64b-c91f-4095-8fb4-3f1fbbb55f82" _type="0"><strong>东莞市</strong></a>
											<a href="javascript:;" v="32" aid="3220a369-6a2d-4415-a46a-75a699214736" _type="0">大连市</a>
											<a href="javascript:;" v="8192" aid="dd7cbdb8-6463-436f-ba09-93c69150f137" _type="0">东营市</a>
											<a href="javascript:;" v="8192" aid="8f1e3541-74b4-4993-b242-a2bf9bf15d0d" _type="0">德州市</a>
											<a href="javascript:;" v="4" aid="d1f7476c-1fd4-4da3-b701-d25e3896b856" _type="0">丹阳市</a>
										</dd>
									</dl>
								</div>
								<div class="citylist active">
									<dl>
										<dt>F</dt>
										<dd>
											<a href="javascript:;" class="hot" v="512" aid="6a637459-eca9-46b8-964d-35c11cad039a" _type="0"><strong>佛山市</strong></a>
											<a href="javascript:;" v="16" aid="46e851bf-6fb4-4250-8c90-4f7774a176f1" _type="0">福州市</a>
											<a href="javascript:;" v="4" aid="551d2096-0975-4879-ac83-c259fe433ee6" _type="0">阜阳市</a>
											<a href="javascript:;" v="262144" aid="c7f7d216-b6aa-4287-84ec-8d8cd0dbec04" _type="0">奉化市</a>
										</dd>
									</dl>
									<dl>
										<dt>G</dt>
										<dd>
											<a href="javascript:;" class="hot" v="512" aid="c8dbd17f-a8e0-43b1-b9ce-de1efdc2670e" _type="0"><strong>广州市</strong></a>
										</dd>
									</dl>
									<dl>
										<dt>H</dt>
										<dd>
											<a href="javascript:;" v="32" aid="19e03b4e-1db2-490b-a472-1ac001ae4441" _type="0">衡水市</a>
											<a href="javascript:;" v="4" aid="f308c9cc-d146-490b-944d-1d7f47751bee" _type="0">淮南市</a>
											<a href="javascript:;" v="8192" aid="4e09d210-7744-44fe-a45f-1e166aa92c2c" _type="0">菏泽市</a>
											<a href="javascript:;" v="4" aid="73a979d5-a390-4494-9139-1edbadbf8d4a" _type="0">淮北市</a>
											<a href="javascript:;" v="32" aid="49a11ac5-c9fd-47c6-9aa5-4f85956a8385" _type="0">邯郸市</a>
											<a href="javascript:;" v="262144" aid="7254d134-678b-4976-86f0-520fab6bcc46" _type="0">海宁市</a>
											<a href="javascript:;" v="4" aid="f2b41b20-c240-4e27-a7b4-5828f8fca3e9" _type="0">合肥市</a>
											<a href="javascript:;" v="4" aid="d87ee6a2-e770-4dca-bf5c-bf4f00add383" _type="0">黄山市</a>
											<a href="javascript:;" v="32" aid="18cd4b6e-a0c3-4190-9988-c724c1da8bf5" _type="0">哈尔滨市</a>
											<a href="javascript:;" v="262144" aid="9fb6eac6-ea03-409b-89d9-e13c27e01576" _type="0">湖州市</a>
											<a href="javascript:;" v="4" aid="3c2af8a1-c3eb-418b-97ee-e5f92c44f8ad" _type="0">淮安市</a>
											<a href="javascript:;" class="hot" v="131072" aid="a10524be-acea-451e-9280-df0514e11e2b" _type="1"><strong>杭州市</strong></a>
										</dd>
									</dl>
									<dl>
										<dt>J</dt>
										<dd>
											<a href="javascript:;" v="8192" aid="97fe0ada-54d3-4b5f-9096-19ad57929d07" _type="0">济南市</a>
											<a href="javascript:;" v="4" aid="89b83e66-8845-4f71-83a2-272ac0a0f7d9" _type="0">句容市</a>
											<a href="javascript:;" v="64" aid="2f58ebeb-e46d-467c-941c-3ced514bd50b" _type="0">揭阳市</a>
											<a href="javascript:;" v="32" aid="69417568-9e3a-49c6-b21d-5282b7239922" _type="0">吉林市</a>
											<a href="javascript:;" v="262144" aid="ddd4e4d0-afb3-46c6-8aa6-6257c8ce9bee" _type="0">嘉兴市</a>
											<a href="javascript:;" v="16" aid="91c38a9c-30e0-4e44-af39-9b5d49928509" _type="0">景德镇市</a>
											<a href="javascript:;" class="hot" v="512" aid="43ba3517-6aa8-423b-9f02-a3b0fd681740" _type="0"><strong>江门市</strong></a>
											<a href="javascript:;" v="4" aid="72f8f62e-e5cb-418f-9419-a542c409d122" _type="0">江阴市</a>
											<a href="javascript:;" v="262144" aid="1e07c926-06e9-40cd-b257-a78d1d313ae7" _type="0">金华市</a>
											<a href="javascript:;" v="8192" aid="c64e3be4-5e14-4a74-ae4f-f6cd366ae624" _type="0">济宁市</a>
										</dd>
									</dl>
								</div>
								<div class="citylist">
									<dl>
										<dt>K</dt>
										<dd>
											<a href="javascript:;" class="hot" v="128" aid="0dbb02ef-c055-429f-97b6-5dc7a5bfeda8" _type="1"><strong>昆山市</strong></a>
										</dd>
									</dl>
									<dl>
										<dt>L</dt>
										<dd>
											<a href="javascript:;" v="262144" aid="b0efaf6f-ec54-4264-b0a5-2012a9ec7ee8" _type="0">丽水市</a>
											<a href="javascript:;" v="8192" aid="afbcecb5-0f4c-4e28-aeb4-53372dd301a7" _type="0">临沂市</a>
											<a href="javascript:;" v="8192" aid="bc3c25d7-7308-40aa-8fd7-60b96ba87bf4" _type="0">聊城市</a>
											<a href="javascript:;" v="32" aid="8edda15e-0e21-436c-978d-68eb5bb14ef7" _type="0">兰州市</a>
											<a href="javascript:;" v="4" aid="b2d5732b-b0f8-4fdf-b011-b95b31effa1d" _type="0">连云港市</a>
											<a href="javascript:;" v="4" aid="2ec568bc-94e2-4539-9ee6-83fe3439a464" _type="0">六安市</a>
											<a href="javascript:;" v="32" aid="297c5d78-4d09-42cc-ac13-8421f201b6a9" _type="0">辽阳市</a>
											<a href="javascript:;" v="8192" aid="fec2b413-bdf1-4c6d-98ec-d2de0f237be0" _type="0">莱芜市</a>
											<a href="javascript:;" v="256" aid="7f21282c-4bd0-45c0-a195-87663f9c27eb" _type="0">廊坊市</a>
										</dd>
									</dl>
									<dl>
										<dt>M</dt>
										<dd>
											<a href="javascript:;" v="4" aid="45a989b7-d34e-40c7-aca1-990923eda2cd" _type="0">马鞍山市</a>
										</dd>
									</dl>
									<dl>
										<dt>N</dt>
										<dd>
											<a href="javascript:;" v="64" aid="7cd187b5-8b3f-4c1a-8115-24a5e2d18f3a" _type="0">南宁市</a>
											<a href="javascript:;" v="16" aid="75fbd2c7-8cbc-4bbd-94ef-5eb037a75be5" _type="0">南昌市</a>
											<a href="javascript:;" v="4" aid="603d28a7-b4c8-4a13-823f-d627c2655557" _type="0">南通市</a>
											<a href="javascript:;" class="hot" v="128" aid="9069d884-96c5-4478-bb49-d6ba55b751c8" _type="1"><strong>南京市</strong></a>
											<a href="javascript:;" class="hot" v="131072" aid="c0a5de4e-9087-4678-9056-f589ad833656" _type="1"><strong>宁波市</strong></a>
										</dd>
									</dl>
								</div>
								<div class="citylist">
									<dl>
										<dt>Q</dt>
										<dd>
											<a href="javascript:;" v="16" aid="2b3763ec-2491-4ee0-97a6-20cf70f81933" _type="0">泉州市</a>
											<a href="javascript:;" v="256" aid="5d9e78ba-c583-4962-b279-2a8948df9ee1" _type="0">秦皇岛市</a>
											<a href="javascript:;" v="8192" aid="7ced387b-577d-4060-83d1-13b78f60ff53" _type="0">青岛市</a>
											<a href="javascript:;" v="262144" aid="4693602d-80d7-4b72-b3b5-ca6a26f051f1" _type="0">衢州市</a>
										</dd>
									</dl>
									<dl>
										<dt>R</dt>
										<dd>
											<a href="javascript:;" v="8192" aid="d1bcc39a-7383-40ca-add9-ee3feb38b677" _type="0">日照市</a>
										</dd>
									</dl>
									<dl>
										<dt>S</dt>
										<dd>
											<a href="javascript:;" v="262144" aid="df2e0859-ed44-4e81-95a5-1c8b59381b99" _type="0">绍兴市</a>
											<a href="javascript:;" v="4" aid="915494bd-4eb5-4dfb-9022-2f82abc071d2" _type="0">宿州市</a>
											<a href="javascript:;" v="4" aid="7e8111e6-d7ce-41ce-a660-3033ab81705c" _type="0">宿迁市</a>
											<a href="javascript:;" v="65536" aid="191a03f0-5acf-4bba-8d79-551fa80f77c2" _type="0">沈阳市</a>
											<a href="javascript:;" v="64" aid="3f4f22dc-7a00-460c-82c1-678df82258bf" _type="0">汕头市</a>
											<a href="javascript:;" class="hot" v="512" aid="0540d74e-0ffb-4a3a-ab79-ec590dd49947" _type="0"><strong>深圳市</strong></a>
											<a href="javascript:;" class="hot" v="1" aid="312d0556-0671-4f2e-8bac-7b8873b5a03a" _type="1"><strong>上海</strong></a>
											<a href="javascript:;" v="16" aid="98373b1b-201c-4753-b540-14bb1cd6564e" _type="0">上海(郊区)</a>
											<a href="javascript:;" class="hot" v="128" aid="dec5b754-fe58-48d6-8b37-6bc91ee08460" _type="1"><strong>苏州市</strong></a>
											<a href="javascript:;" v="256" aid="28eab84c-07bf-439f-bb96-92274545c77b" _type="0">石家庄市</a>
										</dd>
									</dl>
									<dl>
										<dt>T</dt>
										<dd>
											<a href="javascript:;" v="32" aid="17ee7ac2-d7ce-4c02-80ea-1babea0a8933" _type="0">唐山市</a>
											<a href="javascript:;" v="32" aid="245dccf7-34cb-466f-aa68-45a242927e18" _type="0">太原市</a>
											<a href="javascript:;" v="262144" aid="5fddc946-9a0c-4dad-bc92-5e05aa5658cd" _type="0">台州市</a>
											<a href="javascript:;" v="8192" aid="63ae9bcf-002f-4514-b052-66702274b1c7" _type="0">泰安市</a>
											<a href="javascript:;" v="4" aid="47ef05fe-cf55-4661-b2bb-8a0b278a01fe" _type="0">铜陵市</a>
											<a href="javascript:;" v="262144" aid="0d920097-3f8a-4ac5-8d48-c7ba7b344ab3" _type="0">桐乡市</a>
											<a href="javascript:;" v="4" aid="e033ce28-146d-4de2-a08f-f3820cf5eea7" _type="0">太仓市</a>
											<a href="javascript:;" v="4" aid="6ba21255-37f7-4619-859c-fde2bb914c4c" _type="0">泰州市</a>
											<a href="javascript:;" class="hot" v="8" aid="93570b8c-0a0a-4818-8317-75a0d14093a5" _type="1"><strong>天津</strong></a>
										</dd>
									</dl>
								</div>
								<div class="citylist">
									<dl>
										<dt>W</dt>
										<dd>
											<a href="javascript:;" v="8192" aid="556550b5-ea16-4b86-9ecd-1b66d20b297b" _type="0">潍坊市</a>
											<a href="javascript:;" v="16" aid="3a5c6df3-9ca1-41a8-bc9c-453050bb7897" _type="0">武汉市</a>
											<a href="javascript:;" v="4" aid="5e7cd4c7-2f86-47c2-bcc1-5d4b33829f1b" _type="0">芜湖市</a>
											<a href="javascript:;" v="262144" aid="734d3328-587c-4b16-bddc-9c8682e76ea5" _type="0">温州市</a>
											<a href="javascript:;" v="8192" aid="08727bb1-22ea-40ca-81f9-7dc9b0fcabd0" _type="0">威海市</a>
											<a href="javascript:;" v="4" aid="33b3203d-c4b6-4c91-abd0-f3f0a226e461" _type="0">吴江市</a>
											<a href="javascript:;" class="hot" v="128" aid="361bc174-b1e5-4fb6-8f69-c391dcd92644" _type="1"><strong>无锡市</strong></a>
										</dd>
									</dl>
									<dl>
										<dt>X</dt>
										<dd>
											<a href="javascript:;" v="4" aid="4b8d53e7-8613-41a9-b412-591be810958d" _type="0">宣城市</a>
											<a href="javascript:;" v="32" aid="462e1848-fbc8-4fac-9ef6-60819e350fbc" _type="0">邢台市</a>
											<a href="javascript:;" v="524288" aid="9a2b3612-8529-4ddf-86bd-60b7a46444a7" _type="0">西安市</a>
											<a href="javascript:;" v="16" aid="146a4ea1-7ba2-4e0b-bf92-a56ddc2d4eb2" _type="0">厦门市</a>
											<a href="javascript:;" v="4" aid="95e8ce6d-2c7e-4364-9b66-8903c1afd338" _type="0">徐州市</a>
										</dd>
									</dl>
									<dl>
										<dt>Y</dt>
										<dd>
											<a href="javascript:;" v="4" aid="3ed942ac-0504-479b-8808-4d9ca08df39b" _type="0">扬州市</a>
											<a href="javascript:;" v="4" aid="d165194a-9ad8-4c5c-b75d-4f05e8dc9fbc" _type="0">宜兴市</a>
											<a href="javascript:;" v="4" aid="36ccf429-efe3-4192-9530-6fbee4984621" _type="0">盐城市</a>
											<a href="javascript:;" v="8192" aid="7d381d70-fc5a-4d1c-8dd0-9400fd5280fd" _type="0">烟台市</a>
											<a href="javascript:;" v="4" aid="9531dd6c-5678-4320-9089-94bb3bde5e82" _type="0">仪征市</a>
											<a href="javascript:;" v="64" aid="0b5447d8-dc18-43eb-849d-96f362588d13" _type="0">阳江市</a>
											<a href="javascript:;" v="262144" aid="6b804583-e3d5-47d5-8bc5-a6a1f46a4cf8" _type="0">余姚市</a>
											<a href="javascript:;" v="256" aid="95869d1f-594d-4027-8cf4-a8ef043e1d95" _type="0">燕郊</a>
											<a href="javascript:;" v="262144" aid="c9d4fe94-a93a-4382-bf3f-acc16233a71d" _type="0">义乌市</a>
											<a href="javascript:;" v="32" aid="d1c0ada7-06b3-4d53-8f91-ccdc9f61d9ba" _type="0">银川市</a>
										</dd>
									</dl>
									<dl>
										<dt>Z</dt>
										<dd>
											<a href="javascript:;" v="32" aid="67124f15-06c9-4dfc-abcb-36f654f1572c" _type="0">张家口市</a>
											<a href="javascript:;" v="4" aid="4afe1762-447a-4f0d-b3c2-4746f5818ce7" _type="0">亳州市</a>
											<a href="javascript:;" class="hot" v="512" aid="0718b3bf-b99b-4aa4-97bd-4a4da0b92464" _type="0"><strong>珠海市</strong></a>
											<a href="javascript:;" v="16" aid="2aac03c9-daf1-4aa8-9505-0bc169742e8a" _type="0">郑州市</a>
											<a href="javascript:;" v="64" aid="b9d27a3f-ddba-4e4d-8577-652b96fcf6a8" _type="0">湛江市</a>
											<a href="javascript:;" v="4" aid="95b1771b-dcd5-470e-9aea-9d607d5fd9e7" _type="0">张家港市</a>
											<a href="javascript:;" class="hot" v="512" aid="29bd9fa7-274c-4257-85e2-a22e2cd1d2ce" _type="0"><strong>中山市</strong></a>
											<a href="javascript:;" v="262144" aid="04d2148e-5d5a-4372-a8a1-ad6fd9756b2b" _type="0">舟山市</a>
											<a href="javascript:;" v="8192" aid="b07704cf-41a9-4997-8ac4-7e739d7e978a" _type="0">枣庄市</a>
											<a href="javascript:;" v="8192" aid="9e21dcb6-47fa-42f8-89c3-9216ba489f1e" _type="0">淄博市</a>
											<a href="javascript:;" v="4" aid="26b6f9a2-850b-4cab-be30-d62e6221dab9" _type="0">镇江市</a>
										</dd>
									</dl>
								</div>

							</div>

							<script id="_citytpl" type="text/x-handlebars-template">

								<div class="headline">
									<a href="javascript:;" v="64" aid="00000000-0000-0000-0000-000000000000">全国其它城市&gt;&gt;</a> 请根据您的收货地址选择
								</div>
								<div class="city-hot">
									<span><i></i>热门城市</span> {{#each HotCity}}
									<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
									{{/each}}
								</div>
								<p class="citytab"><span class="active">ABCDE</span><span>FGHIJ</span><span>KLMNO</span><span class="">PQRST</span><span class="">UVWXYZ</span></p>
								<div class="citylist active">
									{{#each City1}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City2}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City3}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City4}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City5}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>

							</script>
							<!--</div>-->
						</li>
						<!--送货城市 结束-->
					</ul>
					<ul class="fr">
						
						<div class="loginregister" style="margin-top: 8px;">
							<a id="register11" style="margin-right: 18px;" rel="nofollow " href="./register.jsp ">[注册]</a>
							<a id="login11" href="./Login.jsp ">[登录]</a>
							
							<a id="register22"  style="margin-right: 18px; display: none;"  href="ShowOrder.do ">用户：[</a>
							<a id="login22" style="display: none;" onclick="desession();" href="./index.jsp ">[退出]</a>
							
						</div>
						
					</ul>
				</div>
			</div>

			<!------- 头部 ------->
			<script src="js/fixed.js" type="text/javascript" charset="utf-8"></script>
			<div class="header clearfix">
				<div class="wrap">
					<div class="logo">
						<a href="http://www.xiaoxiang.com"><img src="img/logo.png" /></a>
					</div>
					
					<!--购物车 开始-->
					<div class="shopping-cart">
						<dl>
							<dt class="shopping-btn"><a href="http://cart.xiaoxiang.com"> <span class="totleNum"><b>0</b></span><b class="totlePrice">0.0</b></a></dt>
							<dd class="shopping-list">
								<div class="spacer"></div>
								<div class="nogoods" style="display:none;">
									购物车中还没有商品，赶紧选购吧！
								</div>
								<div class="goods">
									<p id="deliveryType" style="display:none;">满100元包邮！</p>
									<ul></ul>
									<div class="price-total">
										<div><span class="totleNum">共<b>0</b>件商品</span><span>共计<b class="totlePrice">¥0.00</b></span></div>
										<div>
											<a href="http://cart.xiaoxiang.com/ShopCart.aspx" class="settleup">去购物车</a>
										</div>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<!--购物车 结束-->
				</div>
			</div>

			<div class="header-nav">
				<div class="wrap">
					<!--商品分类 开始-->
					<div class="catalogs">
						<div class="catalogs-title">
							<a href="javascript:;">全部商品分类</a>
						</div>
						<div class="catalogs-list" style="display:none">
							<div class="item">
								<h3 class="t01_channelhome">
									<a href="http://www.xiaoxiang.com/products/01_channelhome.html"><i></i>进口水果<s>></s></a></h3>
								<div class="sub-item">
									<h4>
										<a href="http://www.xiaoxiang.com/products/01_channelhome.html">进口水果</a>
									</h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0101_qixiaoxiang.html" target="_blank">奇异果</a>
										<a href="http://www.xiaoxiang.com/products/0102_chilizi.html" target="_blank">车厘子</a>
										<a href="http://www.xiaoxiang.com/products/0104_li.html" target="_blank">李</a>
										<a href="http://www.xiaoxiang.com/products/0107_niuyouguo.html" target="_blank">牛油果</a>
										<a href="http://www.xiaoxiang.com/products/0108_tizi.html" target="_blank">提子</a>
										<a href="http://www.xiaoxiang.com/products/0109_pingguo.html" target="_blank">苹果</a>
										<a href="http://www.xiaoxiang.com/products/0110_li.html" target="_blank">梨</a>
										<a href="http://www.xiaoxiang.com/products/0111_ganjuchengyou.html" target="_blank">柑桔橙柚</a>
										<a href="http://www.xiaoxiang.com/products/0112_shanzhu.html" target="_blank">山竹</a>
										<a href="http://www.xiaoxiang.com/products/0113_xiangjiao.html" target="_blank">香蕉</a>
										<a href="http://www.xiaoxiang.com/products/0114_huolongguo.html" target="_blank">火龙果</a>
										<a href="http://www.xiaoxiang.com/products/0115_yezi.html" target="_blank">椰子</a>
										<a href="http://www.xiaoxiang.com/products/0116_mangguo.html" target="_blank">芒果</a>
										<a href="http://www.xiaoxiang.com/products/0117_fengli.html" target="_blank">凤梨</a>
										<a href="http://www.xiaoxiang.com/products/0118_liulian.html" target="_blank">榴莲</a>
										<a href="http://www.xiaoxiang.com/products/0119_tropical.html" target="_blank">热带水果</a>
										<a href="http://www.xiaoxiang.com/products/0120_season.html" target="_blank">时令水果</a>
										<a href="http://www.xiaoxiang.com/products/0121_yuanxiang.html" target="_blank">原箱水果</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/01_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763248445.png" alt="进口水果"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t02_channelhome"><a href="http://www.xiaoxiang.com/products/02_channelhome.html"><i></i>国产水果<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/02_channelhome.html">国产水果</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0201_pingguo.html" target="_blank">苹果</a>
										<a href="http://www.xiaoxiang.com/products/0202_li.html" target="_blank">梨</a>
										<a href="http://www.xiaoxiang.com/products/0203_yingtao.html" target="_blank">樱桃</a>
										<a href="http://www.xiaoxiang.com/products/0204_ganjuchengyou.html" target="_blank">柑桔橙柚</a>
										<a href="http://www.xiaoxiang.com/products/0206_gua.html" target="_blank">瓜</a>
										<a href="http://www.xiaoxiang.com/products/0207_putao.html" target="_blank">葡萄</a>
										<a href="http://www.xiaoxiang.com/products/0208_tao.html" target="_blank">桃</a>
										<a href="http://www.xiaoxiang.com/products/0209_li.html" target="_blank">李</a>
										<a href="http://www.xiaoxiang.com/products/0212_mangguo.html" target="_blank">芒果</a>
										<a href="http://www.xiaoxiang.com/products/0213_fengli.html" target="_blank">凤梨</a>
										<a href="http://www.xiaoxiang.com/products/0215_bale.html" target="_blank">芭乐</a>
										<a href="http://www.xiaoxiang.com/products/0216_baixiangguo.html" target="_blank">百香果</a>
										<a href="http://www.xiaoxiang.com/products/0217_tropical.html" target="_blank">热带水果</a>
										<a href="http://www.xiaoxiang.com/products/0218_season.html" target="_blank">时令水果</a>
										<a href="http://www.xiaoxiang.com/products/0219_yuanxiang.html" target="_blank">原箱水果</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/02_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763379517.png" alt="国产水果"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t05_channelhome"><a href="http://www.xiaoxiang.com/products/05_channelhome.html"><i></i>精选肉类<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/05_channelhome.html">精选肉类</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0501_jinkouniurou.html" target="_blank">进口牛肉</a>
										<a href="http://www.xiaoxiang.com/products/0502_guochanniurou.html" target="_blank">国产牛肉</a>
										<a href="http://www.xiaoxiang.com/products/0503_zhurou.html" target="_blank">猪肉</a>
										<a href="http://www.xiaoxiang.com/products/0504_yangrou.html" target="_blank">羊肉</a>
										<a href="http://www.xiaoxiang.com/products/0505_xiangchang.html" target="_blank">香肠</a>
										<a href="http://www.xiaoxiang.com/products/0506_huotui.html" target="_blank">火腿/培根</a>
										<a href="http://www.xiaoxiang.com/products/0507_rouzhipin.html" target="_blank">肉制品</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/05_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763445053.png" alt="精选肉类"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t06_channelhome"><a href="http://www.xiaoxiang.com/products/06_channelhome.html"><i></i>禽类蛋品<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/06_channelhome.html">禽类蛋品</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0601_ji.html" target="_blank">鸡</a>
										<a href="http://www.xiaoxiang.com/products/0602_ya.html" target="_blank">鸭</a>
										<a href="http://www.xiaoxiang.com/products/0603_egeteseqinlei.html" target="_blank">鹅/鸽/特色禽类</a>
										<a href="http://www.xiaoxiang.com/products/0604_dan.html" target="_blank">蛋</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/06_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763510589.png" alt="禽类蛋品"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t04_channelhome"><a href="http://www.xiaoxiang.com/products/04_channelhome.html"><i></i>海鲜水产<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/04_channelhome.html">海鲜水产</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0401_yu.html" target="_blank">鱼</a>
										<a href="http://www.xiaoxiang.com/products/0402_sanwenyu.html" target="_blank">三文鱼</a>
										<a href="http://www.xiaoxiang.com/products/0403_xia.html" target="_blank">虾</a>
										<a href="http://www.xiaoxiang.com/products/0404_xie.html" target="_blank">蟹</a>
										<a href="http://www.xiaoxiang.com/products/0405_beilei.html" target="_blank">贝</a>
										<a href="http://www.xiaoxiang.com/products/0406_huoxian.html" target="_blank">活鲜</a>
										<a href="http://www.xiaoxiang.com/products/0407_haichanganhuo.html" target="_blank">海产干货</a>
										<a href="http://www.xiaoxiang.com/products/0408_tesehaichan.html" target="_blank">特色海产</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/04_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763576125.png" alt="海鲜水产"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t08_channelhome"><a href="http://www.xiaoxiang.com/products/08_channelhome.html"><i></i>乳品糕点<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/08_channelhome.html">乳品糕点</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0801_nailao.html" target="_blank">奶酪</a>
										<a href="http://www.xiaoxiang.com/products/0802_huangyounaiyou.html" target="_blank">黄油/奶油</a>
										<a href="http://www.xiaoxiang.com/products/0803_rusuanyinliao.html" target="_blank">酸奶/乳酸饮料</a>
										<a href="http://www.xiaoxiang.com/products/0805_mianbao.html" target="_blank">面包</a>
										<a href="http://www.xiaoxiang.com/products/0806_dangao.html" target="_blank">蛋糕</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/08_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763641661.png" alt="乳品糕点"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t03_channelhome"><a href="http://www.xiaoxiang.com/products/03_channelhome.html"><i></i>新鲜蔬菜<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/03_channelhome.html">新鲜蔬菜</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0301_yecailei.html" target="_blank">叶菜类</a>
										<a href="http://www.xiaoxiang.com/products/0302_genjinglei.html" target="_blank">根茎类</a>
										<a href="http://www.xiaoxiang.com/products/0303_qieguoguaguolei.html" target="_blank">茄果/瓜果类</a>
										<a href="http://www.xiaoxiang.com/products/0304_huacaidoulei.html" target="_blank">花菜/豆类</a>
										<a href="http://www.xiaoxiang.com/products/0306_jungu.html" target="_blank">菌菇</a>
										<a href="http://www.xiaoxiang.com/products/0307_shalacai.html" target="_blank">沙拉菜</a>
										<a href="http://www.xiaoxiang.com/products/0308_lengdongshucai.html" target="_blank">冷冻蔬菜</a>
										<a href="http://www.xiaoxiang.com/products/0309_douzhipin.html" target="_blank">豆制品</a>
										<a href="http://www.xiaoxiang.com/products/0310_congsuanlei.html" target="_blank">葱蒜类</a>
										<a href="http://www.xiaoxiang.com/products/0311_shucaizuhe.html" target="_blank">蔬菜组合</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/03_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763772733.png" alt="新鲜蔬菜"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t10_channelhome"><a href="http://www.xiaoxiang.com/products/10_channelhome.html"><i></i>方便速食<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/10_channelhome.html">方便速食</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/1001_lengdongdianxin.html" target="_blank">冷冻点心</a>
										<a href="http://www.xiaoxiang.com/products/1003_zhongshizhushi.html" target="_blank">中式主食</a>
										<a href="http://www.xiaoxiang.com/products/1004_huoguoliao.html" target="_blank">火锅料</a>
										<a href="http://www.xiaoxiang.com/products/1005_lengcangshushi.html" target="_blank">冷藏熟食</a>
										<a href="http://www.xiaoxiang.com/products/1006_banchengpincai.html" target="_blank">半成品菜</a>
										<a href="http://www.xiaoxiang.com/products/1007_yihejiayan.html" target="_blank">易盒家宴</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/10_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763838269.png" alt="方便速食"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t07_channelhome"><a href="http://www.xiaoxiang.com/products/07_channelhome.html"><i></i>粮油杂货<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/07_channelhome.html">粮油杂货</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0701_mi.html" target="_blank">米</a>
										<a href="http://www.xiaoxiang.com/products/0702_zaliang.html" target="_blank">杂粮</a>
										<a href="http://www.xiaoxiang.com/products/0703_mianmianzhipin.html" target="_blank">面/面制品</a>
										<a href="http://www.xiaoxiang.com/products/0704_you.html" target="_blank">油</a>
										<a href="http://www.xiaoxiang.com/products/0705_tiaoweiliao.html" target="_blank">调味料</a>
										<a href="http://www.xiaoxiang.com/products/0706_ganhuo.html" target="_blank">干货</a>
										<a href="http://www.xiaoxiang.com/products/0707_guoganlingshi.html" target="_blank">果干/零食</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/07_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160757940029.png" alt="粮油杂货"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t09_channelhome"><a href="http://www.xiaoxiang.com/products/09_channelhome.html"><i></i>饮料酒水<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.xiaoxiang.com/products/09_channelhome.html">饮料酒水</a></h4>
									<div class="sub-list">
										<a href="http://www.xiaoxiang.com/products/0901_shui.html" target="_blank">水</a>
										<a href="http://www.xiaoxiang.com/products/0902_guozhiyinliao.html" target="_blank">果汁/饮料</a>
										<a href="http://www.xiaoxiang.com/products/0903_chongtiaoyinpin.html" target="_blank">冲调饮品</a>
										<a href="http://www.xiaoxiang.com/products/0904_jiujiuju.html" target="_blank">葡萄酒/酒具</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.xiaoxiang.com/products/09_channelhome.html"><img src="http://img05.xiaoxiangimg.com/e/others/150929/9570160763182909.png" alt="饮料酒水"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--商品分类 结束-->
					<div class="nav-items">
						<ul id="homenav">
							<li>
								<a href="javascript:void(0)" target="_blank">新品专区</a>
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">优质生活</a>
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">银行专区</a>
							</li>
							<li>
								<a href="javascript:void(0)" target="_blank">菜谱专栏</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			<div class="wrap">
				<!--面包屑-->
				<div class="crumbs">
					<a class="ml0" href="./index.jsp">首页</a>&gt;
					<a href="javascript:void(0)" class="j_ygnav">我的小象</a>
					<span class="j_thridcrumbs hide">&gt;
						<a href="javascript:void(0)" class="on j_thirdnav">我的订单</a>
					</span>
				</div>
				<div class="content myyg">
					<div class="sub">
						<div class="menu j_menu">
							<dl>
								<dt>交易信息</dt>
								<dd>
									<ul>
										<li>
											<a href="/Trade/OrderList">我的订单</a>
										</li>

										<li>
											<a href="/Trade/MyBuy">购买过的商品</a>
										</li>
										<li>
											<a href="/Trade/MyCollection">我的收藏</a>
										</li>
										<li>
											<a href="/Trade/CommodityVote">评论商品</a>
										</li>
									</ul>
								</dd>
								<dt>账号信息</dt>
								<dd>
									<ul>
										<li>
											<a href="/Account/Balance">账户余额</a>
										</li>
										<li>
											<a href="/Account/PersonalProfile">个人资料</a>
										</li>
										<li>
											<a href="/Account/AccountSecurity">账号安全</a>
										</li>
										<li>
											<a href="/Account/Consignee">收货地址管理</a>
										</li>
									</ul>
								</dd>
								<dt>售后服务</dt>
								<dd>
									<ul>
										<li>
											<a href="/Trade/BackOrder">在线退换货</a>
										</li>
										<li>
											<a href="/Trade/Advice">投诉建议</a>
										</li>
									</ul>
								</dd>
							</dl>
						</div>
						<div>
							<div class="ad" style="height: 308px;">
								<a href="###" target="_blank" style="display: none">
									<img src="http://static01.xiaoxiang.com/utaste/images/ad.jpg" width="194" height="308">
								</a>
							</div>
						</div>
					</div>
					

					<div class="main myorder" style="width: 930px">
						<div class="title">
							
							我的订单
							

						</div>
						<div class="order-table j_Loading" id="allorderlst">
							<div class="order-list-head clearfix">
								<span class="w520">订单信息</span>
								<span class="w140">实付金额</span>
								<span class="w140">订单状态</span>
								<span class="w140">操作</span>

							</div>
							
							
							
							  
						<div class="order-list-body">
							
							<% ArrayList<Order> orderList = (ArrayList<Order>)request.getAttribute("orderLists");%>
                                <%
                                ShowOrderService showOrderService = new ShowOrderService();
	                                for(int i=0;i<orderList.size();i++){%>
	                                	
	                                	<ul class="j_allorderli">
										<li>
											<table class="order-list j_product">
												<thead>
													<tr>
														<th colspan="4">
															<div>
																<span>订单号：<%=orderList.get(i).getOrderId()%></span>
																<span>提交时间：<%=orderList.get(i).getOrderSetTime()%></span>
															</div>
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td width="520" class="all-goods">
														
														<% ArrayList<String> picStringList = showOrderService.getPicListByOrderid(orderList.get(i).getOrderId()); 
															for(int j=0;j<picStringList.size();j++){%>
																<a href="" target="_blank">
																<img class="j_product_img" src="<%=picStringList.get(j)%>">
															</a>
															<%}%>
															<div class="m">
																<div>共计<%=showOrderService.getNumByOrderid(orderList.get(i).getOrderId()) %>件商品</div>
															</div>
														</td>
														<td class="amount" width="140"><%=showOrderService.getPriceByOrderid(orderList.get(i).getOrderId()) %></td>
														<td width="140"><%=showOrderService.getOrderstateByOrderid(orderList.get(i).getOrderId()) %></td>
														<td width="140" class="operate">

														</td>
													</tr>
												</tbody>
											</table>
										</li>
									</ul>
                                	
                                <% } %>
							
						</div>
							
							

					<!--选择取消原因弹框-->
					<div class="popup popup1" style="display:none;">
						<div class="popup-wrap popup-middle">
							<div class="popup-con">
								<div class="title">取消订单申请
									<a href="#" class="close">×</a>
								</div>
								<div class="con">
									<div class="reason">
										<span>取消原因</span>

										<select name="refundreason" id="refundreason">
											<option value="订单信息错误">订单信息错误</option>
											<option value="我不想买了">我不想买了</option>
											<option value="忘记使用U币/优惠券">忘记使用U币/优惠券</option>
											<option value="订单中有商品买错">订单中有商品买错</option>
										</select>
										<p class="text"><i class="hint"></i>订单被成功取消后不可恢复，同时该笔订单所使用的优惠券可能将一并取消。</p>
									</div>
									<div class="btnbox">
										<a class="confirm" id="step1" href="javascript:void(0);">下一步</a>
										<a class="cancel close" href="javascript:void(0);">暂不取消</a>
									</div>
								</div>
							</div>
						</div>
						<div class="popup-bg">&nbsp;</div>
					</div>

					<!--网银支付宝支付,部分预付款-->
					<div class="popup popup3" style="display:none;">
						<div class="popup-wrap popup-middle">
							<div class="popup-con">
								<div class="title">取消订单申请
									<a href="#" class="close">×</a>
								</div>
								<div class="con">
									<div class="refundbeforeinfo"></div>
									<div class="btnbox">
										<a class="confirm" id="step2" href="javascript:void(0);">提交申请</a>
										<a class="cancel close" href="javascript:void(0);">暂不取消</a>
									</div>
									<div class="explain">
										<h3>极速退款说明：</h3>
										<p>
											1. 极速退款仅限网银、支付宝在线方式支付，即时退款至预付款余额，目前暂不支持其他支付方式；<br> 2. 极速退款已退至账户余额后的金额，目前暂不支持退款；<br> 3. 账户内金额不可用于购买储值卡、提货券等虚拟卡券类商品；<br> 4. 如需开具发票，请完善发票开具信息；开票金额为您实际支付充值金额，不包含赠送金额；<br> 5. 预付款余额有效期：自充值日起至用完即止；<br> 6. 若有其他疑问，可拨打客服电话400-000-7788进行咨询。
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="popup-bg">&nbsp;</div>
					</div>

					<!--等待审核-->
					<div class="popup popup4" style="display:none;">
						<div class="popup-wrap popup-middle">
							<div class="popup-con">
								<div class="title">取消订单申请
									<a href="#" class="close">×</a>
								</div>
								<div class="con">
									<div class="refundstateinfo"></div>
									<table>

									</table>
									<div class="btnbox">
										<a class="confirm close" href="javascript:void(0);">好，我知道了</a>
										<a href="http://www.xiaoxiang.com/help/quicknessrefund.html" class="know">了解极速退款</a>
									</div>
								</div>
							</div>
						</div>
						<div class="popup-bg">&nbsp;</div>
					</div>




           </div>
       </div>
        <!------- 页尾 ------->
        <style>
    i {
        background-image: none;
    }
</style>
<div class="footer">
    <div class="wrap">
        <dl class="col1">
            <dt>新手指南</dt>
            <dd>
                <p><a href="/help/registersteps.html">账户注册</a></p>
                <p><a href="/help/gouwuliucheng.html">购物流程</a></p>
                <p><a href="/help/ordering.html">订购方式</a></p>
                <p><a href="/help/ubremark.html">悠币说明</a></p>
                            <p><a href="http://www.xiaoxiang.com/activity/sale/2998">会员等级<i class="ml5"><img src="http://img06.xiaoxiangimg.com/e/web/170315/00941/154425/icon-new.png"></i></a></p>

            </dd>
        </dl>
        <dl class="col2">
            <dt>付款方式</dt>
            <dd>
                <p><a href="/help/payment.html">支付方式</a>/<a href="/help/invoiceremark.html">发票说明</a></p>
                <p><a href="/help/chongzhiliucheng.html">充值说明</a><a href="/help/usechuzhika.html">/储值卡说明</a></p>
                <p><a href="/help/usegiftcard.html">优惠代码/礼品卡说明</a></p>
                <p><a href="/help/cardbuynotes.html">卡券购买章程</a></p>
            </dd>
        </dl>
        <dl class="col3">
            <dt>配送方式</dt>
            <dd>
                <p><a href="/help/sendyuefei.html">配送运费</a></p>
                <p><a href="/help/sendquyu.html">配送范围</a></p>
                <p><a href="/help/sendtime.html">配送时间</a></p>
            </dd>
        </dl>
        <dl class="col4">
            <dt>售后服务</dt>
            <dd>
                <p><a href="/help/tuihuanhuoshuoming.html">退换货政策</a></p>
                <p><a href="/help/huanhuolc.html">退换货流程</a></p>
                <p><a href="/help/qa.html">常见问题</a></p>
                <p><a href="/help/quicknessrefund.html">极速退款</a><p>
                <p><a href="http://home.xiaoxiang.com/Trade/Advice">投诉与建议</a></p>
            </dd>
        </dl>
        <dl class="col5">
            <dt>关于我们</dt>
            <dd>
                <p><a href="/help/introduction.html">公司介绍</a></p>
                <p><a href="/help/contact.html">联系我们</a></p>
                <p><a href="/help/procooperation.html">业务合作</a></p>
                <p><a href="/help/chengxinjubao.html">诚信举报</a></p>
                <p><a href="http://xiaoxiang.zhiye.com/home" target="_blank" rel="nofollow">人才招聘</a></p>
                <p><a href="/help/friendurl.html">友情链接</a></p>
                
            </dd>
        </dl>
        <div class="service"><span>客服热线 400-888-8888 企业采购或团购，请转2号键咨询</span><span>周一至周日 9:00-21:00</span></div>
        <div class="copyright">
            <p> <a href="http://www.miibeian.gov.cn/state/outPortal/loginPortal.action" target="_blank" rel="nofollow">津ICP备098491015号 </a>  Copyright © 2017-2018 <a href="http://www.xiaoxiang.com/">天津Spark商务有限公司</a>版权所有</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/js04.js"></script>

        <!------- 侧边悬浮 ------->
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