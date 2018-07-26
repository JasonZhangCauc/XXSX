function increasecount(){
	var procount=document.getElementById("p_number");
	var temp=parseInt(procount.value);
	 temp=temp+1;
	 procount.value=temp;
	 if(temp>0){
	 	var deletebu=document.getElementById("decreasebutton");
	 	deletebu.style.backgroundColor="#FFFFFF";
	 }
}
function decreasecount(){
	var procount=document.getElementById("p_number");
	var temp=parseInt(procount.value);
	 
	if(temp>0){temp=temp-1;}else{
		var deletebu=document.getElementById("decreasebutton");
		deletebu.style.backgroundColor="#BCBCBC";
	}
	 procount.value=temp;
}
//function decreasecount(){
//	var delete=document.getElementById("decreasebutton");
//	delete.style.backgroundColor="red";
//}
