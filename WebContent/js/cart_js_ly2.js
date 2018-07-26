
function gotoAccount() {
	var table = document.getElementById("cart-table");
	var checkedBoxArray = document.getElementsByName("checkbox");
	var urlString = "";
	for (i in checkedBoxArray) {
		if (checkedBoxArray[i].checked) {
			urlString = urlString + checkedBoxArray[i].parentNode.parentNode.id;
		}
	}
	if (urlString == "") {
		alert("您未选择商品");
	} else {
		location.href = "CreateAccount.do?urlString=" + urlString;
	}
};

function cart_deleteselect() {
	var table = document.getElementById("cart-table");
	var checkedBoxArray = document.getElementsByName("checkbox");
	for ( var i in checkedBoxArray) {
		if (checkedBoxArray[i].checked) {

			deleteOneProduct(checkedBoxArray[i]);
		}
	}

};