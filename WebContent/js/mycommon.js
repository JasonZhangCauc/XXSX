		function getdetail(){
			var divdetail=document.getElementById("ProductDetail");
			var divcom=document.getElementById("ProductComment");
			var tabA1=document.getElementById("tabA1");
			var tabA2=document.getElementById("tabA2");
			tabA1.style.borderBottom="none";
			tabA2.style.borderBottom="1px solid darkgreen";
			divdetail.style.display="block";
			divcom.style.display="none";
		}
		function getcomment(){
			var divdetail=document.getElementById("ProductDetail");
		var divcom=document.getElementById("ProductComment");
		var tabA1=document.getElementById("tabA1");
			var tabA2=document.getElementById("tabA2");
			tabA1.style.borderBottom="1px solid darkgreen";
			tabA2.style.borderBottom="none";
			divdetail.style.display="none";
			divcom.style.display="block";	
		}
		function getcart() {//向购物车添加数据
			var NumInput=document.getElementById("p_number");
			var ProId=document.getElementById("Amount");
	    	var resultNum=NumInput.value;
	    	var resultId=ProId.innerHTML;
			$.ajax({
				type : "post",
				url : "getInfo.do?action=submitCart",
				data:{"ProductNum":resultNum,"ProductId":resultId},
				success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
					alert('我在购物车等你哦！');
				}
			});
		}
		function getCommentvalue(){//获取评论
			var ProId=document.getElementById("Amount");
			var resultId=ProId.innerHTML;
			$.ajax({
				type : "post",
				url : "getComment.do?action=ALLITEMS",
				data:{"ProductId":resultId},
				success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
					adddiv(data);
				}
			});
		}
		function adddiv(data){
			var maindiv=document.getElementById("maindiv");
			maindiv.innerHTML="";
			for(var a=0;a<data.length;a++){	
			var div1=document.createElement("div");
			var table1=document.createElement("table");
			var tr1=document.createElement("tr");
			var tr2=document.createElement("tr");
			var td1=document.createElement("td");
			var img1=document.createElement("img");
			var td2=document.createElement("td");
			var td3=document.createElement("td");
			var td4=document.createElement("td");
			div1.className="Creatediv";
			table1.className="Creattable";
			img1.className="CreateImg";
			div1.appendChild(table1);
			table1.appendChild(tr1);
			tr1.appendChild(td1);
			img1.src="images/19dcf711ac26e2dbc91ef50ece180dd6.jpg";//用户头像
			td1.appendChild(img1);
			td2.innerText=data[a].commentdetail;
			td2.rowSpan="2";
			td2.className="td2";
			tr1.appendChild(td2);
			td4.innerText=data[a].point;
			td4.rowSpan="2";
			td4.className="tdx";
			tr1.appendChild(td4);
			table1.appendChild(tr2);
			tr2.appendChild(td3);
			td3.className="td3";
			td3.innerText="小象用户:"+data[a].userId;
			document.getElementById("maindiv").appendChild(div1);
			}
			var div2=document.createElement("div");
			var btnPer=document.createElement("input");
			var btnNex=document.createElement("input");
			btnNex.setAttribute('type', 'button');
			btnPer.setAttribute('type', 'button');
			btnNex.className="btn";
			btnPer.className="btn";
			btnPer.value="上一页";
			btnNex.value="下一页";
			div2.appendChild(btnNex);
			div2.appendChild(btnPer);
			document.getElementById("maindiv").appendChild(div2);
			btnPer.onclick=function(){getCommentPerPage();};
			btnNex.onclick=function(){getCommentNextPage();};
		}
		function getCommentNextPage(){//获取下一页评论
			var ProId=document.getElementById("Amount");
			var resultId=ProId.innerHTML;
			$.ajax({
				type : "post",
				url : "getComment.do?action=next",
				data:{"ProductId":resultId},
				success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
				//获取评论的结果list
					//alert(data);
					if(data[0].commentdetail=="#END#"){
						alert("已到尾页");
					}else{
						adddiv(data);
					}
				}
			});
		}
		function getCommentPerPage(){//获取上一页评论
			var ProId=document.getElementById("Amount");
			var resultId=ProId.innerHTML;
			$.ajax({
				type : "post",
				url : "getComment.do?action=per",
				data:{"ProductId":resultId},
				success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
				//获取评论的结果list
					//alert(data);
					if(data[0].commentdetail=="#START#"){
						alert("已到首页");
					}else{
						adddiv(data);
					}
				}
			});
		}