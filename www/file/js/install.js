$(function() {
	$("#submit").click(function() {
		var title = $("#title");
		var name = $("#name");
		var url = $("#url");
		var nickname = $("#nickname");
		var user = $("#user");
		var pass = $("#pass");


		if (title.length > 0) {
			if (title.val() == "") {
				layer.msg("请填写网站标题", {
					icon: 5
				});
				title.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (name.length > 0) {
			if (name.val() == "") {
				layer.msg("请填写网站名称", {
					icon: 5
				});
				name.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (nickname.length > 0) {
			if (nickname.val() == "") {
				layer.msg("请填写账号昵称", {
					icon: 5
				});
				nickname.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (user.length > 0) {
			if (user.val() == "") {
				layer.msg("请填写账号", {
					icon: 5
				});
				user.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} 
		}
		
		if (pass.length > 0) {
			if (pass.val() == "") {
				layer.msg("请填写密码", {
					icon: 5
				});
				pass.css({
					border: "1px solid #f60",
					background: "#f2f2f2"
				});
				return false
			} else {
				if (pass.val().length < 7) {
					layer.msg("密码最低6位", {
						icon: 5
					});
					pass.css({
						border: "1px solid #f60",
						background: "#f2f2f2"
					});
					return false
				}
			}
		}



	
	});

});