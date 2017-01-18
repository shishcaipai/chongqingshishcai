function btnBuy(obj){
	var id = $(obj).attr('id');
	id += "num";
	var num = $('#' + id).val();
	var leftnum = obj.children[1].value;
	if (parseInt(num) > parseInt(leftnum)) {
		alert("购买份数不能大于剩余份数!");
		return;
	}
	var type = obj.children[3].value;
	
	var data = {
			 betId			      : obj.children[0].value,
			 subscribeAmount      : num,
			 subscribeMoney 	  : obj.children[2].value,
			 t:Math.random()
		 };
	  $.ajax({
		 url:"buyTogether/join",
		 data:data,
		 type:"post",
		 success:function(){
			 alert("购买成功");
			 window.location.href = "together?type=" + type;
		 },
		 error:function(XMLHttpRequest) {
			 var s = XMLHttpRequest.responseText;
				if (s == '') {
					window.location = '';
				}
				$("#btn_SubmitZ,#btn_SubmitHM,#btn_SubmitPath").attr("disabled",false);
				s = eval("(" + s + ")");
				alert(s.message);
		 }
	  });
}
