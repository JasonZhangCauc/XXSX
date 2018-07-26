
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
