function submitOrder(){
	var input = document.getElementById("city-picker3");
	var val = input.value.toString();
	var count = 0;
	var isOk = 0;
	var txtWebRemark = document.getElementById("txtWebRemark").value.toString();
	var receiveUserName = document.getElementById("OrderUserName").value.toString();
	var receiveUserMobile = document.getElementById("OrderUserMobile").value.toString();
	
	for(i=0;i<val.length;i++){//计算是否选择了省/市/区
		if((val.charAt(i)=='/')){
			count++;
		}
	}
	
	if(count==0){
		alert("请选择省/市/区");
	}else{//选择完成后取得详细地址
		var detailaddress = document.getElementById("detailaddress").value;
		
		if(detailaddress==""){
			alert("请填写详细地址");
		}else{
			isOk ++;
		}
	}
	
	if(receiveUserName==""){
		alert("请填写收货人姓名");
	}else{
		count++;
	}
	
	if(receiveUserMobile==""){
		alert("请填写收货人手机");
	}else{
		count++;
	}

	if(count ==4){
		$.ajax({
			type:"post",
			url:"CreateAccount.do?action=submitOrder&address="+val+ " " +detailaddress+"&receiveUserName="+receiveUserName+"&receiveUserMobile="+receiveUserMobile,
			success:function(data) {
				alert("成功提交订单");
				window.location.href="ShowOrder.do"; 
			}
		});
	}
	
}
