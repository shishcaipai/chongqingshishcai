/**
 * todo:个人中心用户注册表单验证
 */
var flag_pw = false;
var flag_username = true;
var flag_url = true;
var flag_qq = false;
var flag_phone = true;
// var flag_nickname = false;
var flag_repw = false;
var flag_email = true;
var flag_realname = false;
var parenturl;
var parentId = null;
var userType = 0;

/**
 * todo:密码验证相关 edit by linzl 2012-9-4 start
 */
$("#pw").blur(function() {
	check_pw();
}).focus(function() {
	$("#reg_pw").removeClass();
	$("#reg_pw").addClass("right");
	$("#reg_pw .ico").hide();
	$("#reg_pw .warn").hide();
	$("#reg_pw .hint").html("请输入密码").show();
});

$("#repw").blur(function() {
	var pw = $("#pw").val();
	var repw = $("#repw").val();
	if (pw != repw) {
		$("#reg_repw").addClass('error');
		$("#reg_repw .ico").show();
		$("#reg_repw .warn").html("两次输入的密码不一致").show();
	} else {
		$("#reg_repw").addClass('right');
		$("#reg_repw .ico").show();
		flag_repw = true;
	}
}).focus(function() {
	$("#reg_repw").removeClass();
	$("#reg_repw .hint").hide();
});
;

/*
 * $("#nickname").focus(function(){ $("#reg_nickname").removeClass();
 * $("#reg_nickname .hint").html("请输入昵称").show(); });
 */

function check_pw() {
	var password = $("#pw").val();
	var len = password.length;
	if ("" != password) {
		if (len < 6 || len > 16) {
			$("#reg_pw .hint").hide();
			$("#reg_pw").removeClass();
			$("#reg_pw").addClass('error');
			$("#reg_pw .ico").show();
			$("#reg_pw .warn").html("密码长度应为6到16位").show();
			flag_pw = false;
		} else {
			$("#reg_pw .hint").hide();
			$("#reg_pw").removeClass();
			$("#reg_pw").addClass('right');
			$("#reg_pw .ico").show();
			flag_pw = true;
		}
	} else {
		$("#reg_pw").removeClass();
		$("#reg_pw").addClass("right");
		$("#reg_pw .ico").hide();
		$("#reg_pw .warn").hide();
		$("#reg_pw .hint").html("请输入密码").hide();
		flag_pw = true;
	}
}

/*
 * function check_nickname(){ var nickname=$("#nickname").val(); var len
 * =nickname.length; if("" !=nickname){ if(len<1 || len>16){ $("#reg_nickname
 * .hint").hide(); $("#reg_nickname").removeClass();
 * $("#reg_nickname").addClass('error'); $("#reg_nickname .ico").show();
 * $("#reg_nickname .warn").html("昵称长度应为1到16位").show(); flag_nickname = false;
 * }else{ $("#reg_nickname .hint").hide(); $("#reg_nickname").removeClass();
 * $("#reg_nickname").addClass('right'); $("#reg_nickname .ico").show();
 * flag_nickname=true; } } else{ $("#reg_nickname").removeClass();
 * $("#reg_nickname").addClass("right"); $("#reg_nickname .ico").hide();
 * $("#reg_nickname .warn").hide(); $("#reg_nickname
 * .hint").html("请输入昵称").hide(); flag_nickname=true; } }
 */

// 真实姓名
function check_realname() {
	var realname = $("#realname").val();
	if ("" == realname) {
		$("#reg_realname").removeClass();
		$("#reg_realname").addClass("right");
		$("#reg_realname .ico").hide();
		$("#reg_realname .warn").hide();
		$("#reg_realname .hint").html("请输入真实姓名").hide();
	} else {
		$("#reg_realname .hint").hide();
		$("#reg_realname").removeClass();
		$("#reg_realname").addClass('right');
		$("#reg_realname .ico").show();
		flag_realname = true;
	}
}

/**
 * todo:密码验证相关 edit by linzl 2012-9-4 end
 */
function reg_information(id) {
	var str_input_id = "#" + id; // id为传入id的input框，加上“#”进行拼装
	var str_li_id = "#reg_" + id; // str_input的li对应的id
	var hint = str_li_id + ' .hint'; // 提示信息
	var ico = str_li_id + ' .ico'; // 提示图标
	$(ico).hide(); // 默认隐藏错误提示图标
	// console.log(str_li_id);
	$(str_input_id).focus(function() {
		$(hint).show(); // 获取焦点显示提示信息
		$(str_li_id).removeClass();
		$(ico).hide();
	}).blur(function() {
		var msg = $(str_input_id).val();
		if (id == 'vaildate') {
			if ("" != msg) {
				check_validate(id, msg);
			} else {
				$(hint).hide();
			}
		}
		/*
		 * else if(id=='nickname') { check_nickname(msg); }
		 */
		else if (id == 'realname') {
			check_realname(msg);
		} else if (id == 'qq') {
			check_qq(msg);
		} else if (id == 'email') {
			check_email(msg);
		} else if ('phone' == id) {
			check_phone(msg);
		} else if ('username' == id) {
			check_username(msg);
		} else {
			$(hint).hide();
		}
	});
}

function check_username(msg) {
	if (msg == null || msg == "") {
		$("#reg_username .hint").hide();
		$("#reg_username").removeClass();
		$("#reg_username").addClass('error');
		$("#reg_username .ico").show();
		$("#reg_username .warn").html("用户名不能为空！");
		return;
	}
	var arr = msg.split(" ");
	if (arr.length > 1) {
		$("#reg_username .hint").hide();
		$("#reg_username").removeClass();
		$("#reg_username").addClass('error');
		$("#reg_username .ico").show();
		$("#reg_username .warn").html("用户名不能包含空格。");
		return;
	}
	$.ajax({
		type : "post",
		url : "user/isexists",
		// async: false,
		data : {
			username : msg
		},
		success : function(res) {
			if (res == 1) {
				flag_username = false;
				$("#reg_username .hint").hide();
				$("#reg_username").removeClass();
				$("#reg_username").addClass('error');
				$("#reg_username .ico").show();
				$("#reg_username .warn").html("用户名已存在！");
			} else {
				$("#reg_username .hint").hide();
				$("#reg_username").removeClass();
				$("#reg_username").addClass('right');
				$("#reg_username .ico").show();
				flag_username = true;
			}
		}
	});
}
/**
 * todo:qq验证 edit by linzl 2012-9-4 start
 */
function check_qq(msg) {
	var reg = /^[1-9]\d{4,11}$/;
	if ("" != msg) {
		if (reg.test(msg)) {
			$("#reg_qq .hint").hide();
			$("#reg_qq").removeClass();
			$("#reg_qq").addClass('right');
			$("#reg_qq .ico").show();
			flag_qq = true;
		} else {
			$("#reg_qq .hint").hide();
			$("#reg_qq").removeClass();
			$("#reg_qq").addClass('error');
			$("#reg_qq .ico").show();
			$("#reg_qq .warn").html("请输入正确的qq号");
			flag_qq = false;
		}

	} else {
		$("#reg_qq .hint").hide();
		flag_qq = false;
	}
}

function check_email(msg) {
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	if ("" != msg) {
		if (reg.test(msg)) {
			$("#reg_email .hint").hide();
			$("#reg_email").removeClass();
			$("#reg_email").addClass('right');
			$("#reg_email .ico").show();
			flag_email = true;
		} else {
			$("#reg_email .hint").hide();
			$("#reg_email").removeClass();
			$("#reg_email").addClass('error');
			$("#reg_email .ico").show();
			$("#reg_email .warn").html("请输入正确的email");
			flag_email = false;
		}

	} else {
		$("#reg_email .hint").hide();
		flag_email = true;
	}
}

function check_phone(msg) {
	var reg0 = /^1\d{10}$/;
	if ("" != msg) {
		if (reg0.test(msg)) {
			$("#reg_phone .hint").hide();
			$("#reg_phone").removeClass();
			$("#reg_phone").addClass('right');
			$("#reg_phone .ico").show();
			flag_phone = true;
		} else {
			$("#reg_phone .hint").hide();
			$("#reg_phone").removeClass();
			$("#reg_phone").addClass('error');
			$("#reg_phone .ico").show();
			$("#reg_phone .warn").html("请输入正确的手机号码");
			flag_phone = false;
		}
	} else {
		$("#reg_phone .hint").hide();
		flag_phone = true;
	}

}

reg_information('vaildate');
reg_information('weibo');
reg_information('url');
reg_information('phone');
reg_information('qq');
reg_information('email');// 验证邮箱
reg_information('username');// 验证用户名
reg_information('realname');// 验证真实姓名

function check_from(form_name) {
	var pw = $("#pw").val();
	var username = $("#username").val();
	// var nickname = $("#nickname").val();
	var realname = $("#realname").val();
	var qq = $("#qq").val();
	if ("" == qq) {
		$("#reg_qq .hint").show();
	}
	if ("" == pw) {
		$("#reg_pw .hint").show();
	}
	if ("" == username) {
		$("#reg_username .hint").show();
	}

	if ("" == realname) {
		$("#reg_realname .hint").show();
	}
	if (flag_username && flag_realname && flag_repw && flag_phone && flag_qq
			&& flag_pw && flag_email) {
		var data = {
			username : $("#username").val(),
			password : pw,
			sex : $("#sex").val(),
			email : $("#email").val(),
			qq : $("#qq").val(),
			mobile : $("#phone").val(),
			money : 0,
			parentId : $("#parentId").val(),
			frozenMoney : 0,
			realName : $("#realname").val(),
			status : 0,
			withdrawPassword : "888888",// 提款密码默认888888,
			userType : userType
		// 普通用户
		};
		$.ajax({
			type : "POST",
			dataType : "text",
			data : data,
			url : "../user/doregister",
			success : function(res) {
				if ("1" == res) {
					alert("注册成功！提款密码默认888888，请及时修改。");
					window.location.href = "../user/login";
				} else if ("2" == res) {
					alert("用户名已占用，请选择其他用户名！");
					window.location.location.reload();
				} else {
					alert("注册失败，请联系客户！");
					window.location.location.reload();
				}

			}
		});
	}
}