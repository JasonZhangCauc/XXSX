window.onload = function load(){
	$.ajax({
		type : "post",
		url : "Cart.do",
		success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
			
			for(var i=0; i<data.length;i++){
				
				var tr = document.createElement("tr");
				tr.setAttribute("id","trid:" + data[i].cartDetailId);
				var td = document.createElement("td");
				td.setAttribute("class","cart-t-check");
				tr.appendChild(td);
				var input = document.createElement("input");
				input.setAttribute("type","checkbox");
				input.setAttribute("name","checkbox");
				input.setAttribute("onchange","changeCartTotalPrice()");
				input.checked = true;
				td.appendChild(input);
				
				//图片
				td = document.createElement("td");
				td.setAttribute("class","cart-t-img");
				tr.appendChild(td);
				var a = document.createElement("a");
				td.appendChild(a);
				var img = document.createElement("img");
				img.setAttribute("href","");
				img.setAttribute("src",data[i].url);
				a.appendChild(img);
				
				
				//名称
				td = document.createElement("td");
				td.setAttribute("class","cart-t-info");
				tr.appendChild(td);
				var a = document.createElement("a");
				a.innerText = data[i].productName;
				td.appendChild(a);
				
				//单价
				td = document.createElement("td");
				td.setAttribute("class","cart-t-price");
				td.innerText = data[i].price;
				tr.appendChild(td);
				
				//按钮
				td = document.createElement("td");
				td.setAttribute("class","cart-t-num");
				tr.appendChild(td);
				var div = document.createElement("div");
				div.setAttribute("class","quantity-form");
				td.appendChild(div);
				
				a = document.createElement("a");
				a.setAttribute("class","decrement");
				a.setAttribute("onclick","decProductNum(this)");
				a.setAttribute("href","javascript:void(0)");
				div.appendChild(a);
				
				input = document.createElement("input");
				input.setAttribute("type","text");
				input.setAttribute("class","itxt");
				input.setAttribute("oldnum","1");
				input.setAttribute("value",data[i].num);
				div.appendChild(input);
				
				a = document.createElement("a");
				a.setAttribute("class","increment");
				a.setAttribute("onclick","addProductNum(this)");
				a.setAttribute("href","javascript:void(0)");
				div.appendChild(a);
				
				//合计
				td = document.createElement("td");
				td.setAttribute("class","cart-t-total");
				tr.appendChild(td);
				var span = document.createElement("span");
				span.setAttribute("name","cartpretotal");
				span.innerText = parseFloat(data[i].num*data[i].price).toFixed(2);
				td.appendChild(span);
				
				//操作
				td = document.createElement("td");
				td.setAttribute("class","cart-t-opera");
				tr.appendChild(td);
				
				a = document.createElement("a");
				a.innerText = "移入收藏";
				td.appendChild(a);
				
				var br = document.createElement("br");
				td.appendChild(br);
				
				a = document.createElement("a");
				a.innerText = "删除";
				a.setAttribute("onclick","deleteOneProduct(this)");
				a.setAttribute("href","javascript:void(0)");
				td.appendChild(a);
				
				document.getElementById("cart-table-body").appendChild(tr);
				changeCartTotalPrice();
			}
			
			
		}
	});
 };
 
 
 function addProductNum(object){
	 var tr = object.parentNode.parentNode.parentNode;
	 var input = object.previousElementSibling;
	 var price = object.parentNode.parentNode.previousElementSibling.innerText;
	 var totalprice = object.parentNode.parentNode.nextElementSibling.firstChild;
	$.ajax({
		type:"post",
		url:"Cart.do?action=addProductNum&trId="+tr.id,
		success:function(data) {
			input.value = parseInt(input.value) + 1;
			totalprice.innerText = parseFloat(parseInt(input.value)*parseFloat(price)).toFixed(2);
			changeCartTotalPrice();
		}
	});
};
 
 function decProductNum(object){
	 var tr = object.parentNode.parentNode.parentNode;
	 var input = object.nextElementSibling;
	 var price = object.parentNode.parentNode.previousElementSibling.innerText;
	 var totalprice = object.parentNode.parentNode.nextElementSibling.firstChild;
	 
	$.ajax({
		type:"post",
		url:"Cart.do?action=decProductNum&trId="+tr.id,
		success:function(data) {
			if(parseInt(input.value)>1){
				input.value = parseInt(input.value) - 1;
				totalprice.innerText = parseFloat(parseInt(input.value)*parseFloat(price)).toFixed(2);
				changeCartTotalPrice();
			}
		}
	});
};

 function cart_checkall(){
	 
	 var checkbox = document.getElementsByName("checkbox");
	 for(var i=0;i<checkbox.length;i++){
		 checkbox[i].checked = true;
	 } 
	 changeCartTotalPrice();
 };
 
 function cart_checkother(){
	 
	 var checkbox = document.getElementsByName("checkbox");
	 for(var i=0;i<checkbox.length;i++){
		 checkbox[i].click();
	 } 
	 changeCartTotalPrice();
 };
 
 function changeCartTotalPrice(){
	 
	 var totalprice = 0;
	 var checkbox = document.getElementsByName("checkbox");
	 var span = document.getElementsByName("cartpretotal");
	 
	 for(var i=0;i<checkbox.length;i++){
		 if(checkbox[i].checked == true){
			 totalprice = (parseFloat(totalprice) + parseFloat(span[i].innerText)).toFixed(2);
		 }
	 } 
	 
	 $("#totalprice").text(totalprice);
 };
 
 function deleteOneProduct(object){
	 
	var tr = object.parentNode.parentNode;
	$.ajax({
		type:"post",
		url:"Cart.do?action=deleteOneProduct&trId="+tr.id,
		success:function() {
			var checkbox = tr.firstElementChild.firstElementChild;
			checkbox.click();
			tr.style.display="none";
		}
	});
};
 

 
 