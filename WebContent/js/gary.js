$(
    function()
    {

    }
);
var active=new Array();
var nomoredata=1;
window.onscroll=function () {

    if(nomoredata)  //如果数据库没有data就不执行
    {
        //动态ajax请求
        var standard=placetoAddlis();
        var now=getoffsetHeightScroll();
        var tmp=now-standard;
        if(tmp<0) tmp=-tmp;
        var layer=layerofItems();

        if(tmp<100&&(active[layer]==undefined))
        {

            console.log("give a request on layer "+layer);
            active[layer]=1;
            ajaxask(layer);
        }
    }

}
//返回楼层高度 一行返回0 类推
function layerofItems()
{
    var elem=document.getElementsByClassName("shopitems")[0];
    var now=elem.offsetHeight;

    var item=document.getElementsByClassName("items")[0];
    /*var itemmb=window.getComputedStyle(item,null).getPropertyValue("margin-bottom");
    itemmb=parseInt(itemmb.replace("px",""));*/
    var itemmb=11;
    /* var itemhei=item.offsetHeight;*/
    var itemhei=358;
    if(now<itemhei)
    {
        return 0;
    }
    else if(now==itemhei)//一行
    {
        console.log("layer:"+1);
        return 1;
    }
    else{//多行
        var tmp1=now-itemhei;
        var tmp2=itemhei+itemmb;
        var layer=tmp1/tmp2+1;
        console.log("multi"+layer);
        return layer;
    }

}
//返回应当添加li的高度
function placetoAddlis() {
    var elem=document.getElementsByClassName("shopitems")[0];
    var elemhei1=elem.offsetTop;
    var elemhei2=elem.offsetHeight;
    var tmp=elemhei1+elemhei2;
    return tmp;

}
//返回当前浏览到的高度
function getoffsetHeightScroll() {
    var scroll = getScrollTop();   //滑动条 y
    var hei = getWindowHeight();   //窗口的高度
    var tmp=scroll+hei;
    return tmp;
}
function getScrollTop(){
    var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
    if(document.body){
        bodyScrollTop = document.body.scrollTop;
    }
    if(document.documentElement){
        documentScrollTop = document.documentElement.scrollTop;
    }
    scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
    return scrollTop;
}
function getWindowHeight() {
    var windowHeight=0;
    if(document.compatMode == "CSS1Compat")
    {
        windowHeight=document.documentElement.clientHeight;
    }
    else
    {
        windowHeight=document.body.clientHeight;
    }
    return windowHeight;
}

//与其后继页面接口
function servlet_xiaobai(data){
    document.location=("getInfo.do?goodsid="+data);
    console.log("click me")
    console.log(data);

}
function shopCar(e) {
    console.log("shop car...dadadda...");
    e.stopPropagation();//button事件，禁止引起父元素li事件
}

//画布 画四个li 再画每个li中的属性
function drawShopitems(jsondata) {
    var par=document.getElementsByClassName("shopitems")[0].getElementsByTagName("ul")[0];
    var len=jsondata.length;
    createlis(par,len);
    setattr(jsondata);
}
function createDetilofLi()
{
    //create things
    var li=document.createElement("li");
    li.className="items";

    var goodsid=li.value="1";

    var immg=document.createElement("img");

    var newpp=document.createElement("div");
    newpp.className="newpp";
    var newpp_p1=document.createElement("p");
    var newpp_a1=document.createElement("a");
    var newpp_p2=document.createElement("p");
    var newpp_stro=document.createElement("strong");
    var hovbox=document.createElement("div");
    hovbox.className="hovbox";
    var hovbox_p=document.createElement("p");
    var hovbox_input=document.createElement("input");
    hovbox_input.type="button";
    hovbox_input.value="加入购物车";
    hovbox_input.onclick=function(e){
        shopCar(e);//购物车事件
    };

    immg.src="http://img12.yiguoimg.com/d/items/2018/180509/9288722749858985_300.jpg";
    newpp_a1.href="javascript:;";
    newpp_a1.innerHTML="Zespri佳沛新西兰绿奇异果12个115-135g/个";
    newpp_stro.innerHTML="￥68.8";
    hovbox_p.innerHTML="酸酸甜甜,入口柔滑";

    //对象 insert it
    li.appendChild(immg);
    li.appendChild(newpp);
    newpp.appendChild(newpp_p1);
    newpp_p1.appendChild(newpp_a1);
    newpp.appendChild(newpp_p2);
    newpp_p2.appendChild(newpp_stro);
    li.appendChild(hovbox);
    hovbox.appendChild(hovbox_p);
    hovbox.appendChild(hovbox_input);

    //事件

    li.addEventListener('mouseover', function(){
        /*console.log("hovering!");*/
        li.style.cursor="pointer";
        hovbox.style.display="block";
    });
    li.addEventListener('mouseout', function(){
        /*console.log("hovering!");*/
        hovbox.style.display="none";
    });

    return li;
}
function createlis(par,len) {
    for(var i=0;i<len;i++)
    {
        var li = createDetilofLi();
        par.appendChild(li);
    }
}
function setattr(json) {
    var par=document.getElementsByClassName("shopitems")[0];
    par=par.getElementsByClassName("items");
    var len=json.length;
    var pid=new Array();
    console.log(json);
    var layer=(active.length-1)*4;
    console.log("log * layer= "+layer);
    for(var i=layer,j=0;i<len+layer;i++,j++)
    {
        var item=par[i];
        var ime=item.getElementsByTagName("img")[0];
        var desc=item.getElementsByClassName("newpp")[0];
        desc.d1herf=desc.getElementsByTagName("p")[0].getElementsByTagName("a")[0].href;
        desc.d1decript=desc.getElementsByTagName("p")[0].getElementsByTagName("a")[0];
        desc.d2decript=desc.getElementsByTagName("strong")[0];


        ime.src=json[j].Picture1;
        desc.d2decript.innerHTML="￥"+json[j].Price;
        item.pid=json[j].Productid;
        desc.d1decript.innerHTML=json[j].Productname;
        item.addEventListener('click', function(){
            servlet_xiaobai(this.pid);//向小白对接servlet
        });
    }

}

function ajaxask(i) {  //每次向servlet请求少量数据
    console.log("request from,,,");
    var xhr;
    try{
        xhr=new XMLHttpRequest();
    }
    catch (e){
        try{// Internet Explorer
            xhr=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e){
            try{
                xhr=new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e){}
        }
    }
    xhr.onreadystatechange = function(){
        if(xhr.readyState==4){
            if(xhr.status==200||xhr.status==304){
                var data = xhr.responseText;
                data=eval(data);
                console.log(data);
                if(data.length<4)
                {
                    nomoredata=0;
                    return;
                }
                drawShopitems(data);
            }
        }
    }
    i=i*4;
    xhr.open("GET","logServlet?keyword="+i,true);
    xhr.send(null);        //xhr.send(null);

}