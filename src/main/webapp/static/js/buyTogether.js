function btnBuy(obj){
	var id = $(obj).attr('id');
	var num = $('#' + id).val();
	var leftnum = obj.children[1].value;
	if (parseInt(num) > parseInt(leftnum)) {
		alert("购买份数不能大于剩余份数!");
		return;
	}
	if(parseInt(num)<1){
		alert("购买份数不能小于1!");
		return;
	}
	var type = obj.children[0].value;
	var data = {
			 betId			      : obj.children[0].value,
			 subscribeAmount      : num,
			 t:Math.random()
		 };
	  $.ajax({
		 url:"../hemai/submithemaiorder",
		 data:data,
		 type:"post",
		 success:function(data){
			 if(data.code==1){
			 alert(data.msg);
			 window.location.href = "../hemai/hemaiview";
			 }else if(data.code==3){
				 alert(data.msg);
				 window.location.href = "../user/login";
				 }
			 else if(data.code==4){
				 alert(data.msg);
				 window.location.href = "../recharge";
				 }
			 else{
				 alert(data.msg);
				 window.location.href = "../hemai/hemaiview";
				 }
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
