<!DOCTYPE html>
<html lang="en">
<head>
	<#include "./inc/meta.ftl"/>
    <title>用户资料-饮片B2B</title>
</head>

<body>
	<#include "./inc/header-center.ftl"/>
<!-- member-box start -->
	<div class="member-box">
		<div class="wrap">
			<#include "./inc/side-center.ftl"/>

            <div class="main">
				<div class="tips">
					<i class="fa fa-check-circle"></i>修改成功
				</div>
				<div class="title">
					<h3>修改密码</h3>
					<div class="extra"></div>
				</div>
				<div class="fa-form">
					<form action="" id="myform">
						<div class="group">
							<div class="txt">
								<i>*</i>用户名：
							</div>
							<div class="cnt">
								<span class="val">${user.userName!'' }</span>
							</div>
						</div>

						<div class="group">
							<div class="txt">
								<i>*</i>原始密码：
							</div>
							<div class="cnt">
								<input type="password" class="ipt" value="" autocomplete="off"
									name="pwdOld" id="pwdOld" placeholder="请输入原始密码"
									data-msg-required="请输入原始密码">
							</div>
						</div>

						<div class="group">
							<div class="txt">
								<i>*</i>新密码：
							</div>
							<div class="cnt">
								<input type="password" class="ipt" value="" autocomplete="off"
									name="pwd" id="pwd" placeholder="请输入新密码"
									data-msg-required="请输入新密码"
									data-msg-password="密码由数字、字母或下划线组成，长度为6-20位">
							</div>
						</div>

						<div class="group">
							<div class="txt">
								<i>*</i>确认新密码：
							</div>
							<div class="cnt">
								<input type="password" class="ipt" value="" autocomplete="off"
									name="pwdRepeat" id="pwdRepeat" placeholder="请再次输入新密码"
									data-msg-required="请再重复输入一遍密码，不能留空"
									data-msg-match="确认新密码与新密码不一致 ">
							</div>
						</div>

						<div class="ft">
							<div class="cnt">
								<button type="submit" class="btn btn-red btn-wide" id="submit">提交修改</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- member-box end -->


	<!-- footer start -->
	<#include "./inc/footer.ftl"/>
    <!-- footer end -->

	<script src="/js/jquery.min.js"></script>
	<script src="/js/validator/jquery.validator.js?local=zh-CN"></script>
	<script src="/js/jquery.form.js"></script>
	<script src="/js/common.js"></script>
	<script>
		$(function() {
			$('.tips').hide();

			$('#myform').validator({
				fields : {
					pwdOld : '原始密码: required',
					pwd : '密码: required; password',
					pwdRepeat : '确认密码: required; match(pwd)',
					companyFullName : '用药单位: required, company',
					areaId : '所在地区: required',
					contactName : '联系人: required;nickName',
					contactMobile : '手机号码: required;mobile',
					mobileCode : '验证码: required',
					agreement : '同意协议：checked'
				},
				valid : function(form) {
					var myfromValid = this;
					if ($(form).isValid()) {
						$.ajax({
							url : "/user/pwd/update",
							data : $(form).formSerialize(),
							type : "POST",
							success : function(data) {
								var status = data.status;
								var info = data.info;
								if (status == 'y') {
									$('.tips').show();
								} else {
									myfromValid.showMsg("#pwdOld", {
										type : "error",
										msg : info
									})
								}
							}
						});
					}
				}
		})
	})
	</script>
</body>
</html>