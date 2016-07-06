<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册-饮片B2B</title>
    <meta name="renderer" content="webkit" />
    <link rel="stylesheet" href="/css/style.css" />
</head>

<body>

    <!-- header start -->
    <div class="header">
        <div class="wrap">
            <div class="logo">
                <a href="home.html">饮片B2B首页</a>
            </div>
            <div class="title">
                <h1>欢迎注册</h1>
            </div>
        </div>
    </div><!-- header end -->


    <!-- register start -->
    <div class="reg-box">
        <div class="wrap">
            <div class="fa-form">
                <form action="/user/register" id="myform" method="post">
                    <div class="group">
                        <div class="txt">
                            <i>*</i>用户名：
                        </div>
                        <div class="cnt">
                            <input type="text" class="ipt" value="" autocomplete="off" name="userName" id="username" placeholder="6-20位，以字母开头，数字结尾的组合组成">                            
                        </div>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i>*</i>密码：
                        </div>
                        <div class="cnt">
                            <input type="password" class="ipt" value="" autocomplete="off" name="password" id="pwd" placeholder="由数字、字母或下划线组成，长度为6-20">                            
                        </div>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i>*</i>确认密码：
                        </div>
                        <div class="cnt">
                            <input type="password" class="ipt" value="" autocomplete="off" name="pwdRepeat" id="pwdRepeat" placeholder="确认您输入的密码">                            
                        </div>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i>*</i>企业全称：
                        </div>
                        <div class="cnt">
                            <input type="text" class="ipt" value="" autocomplete="off" name="companyFullName" id="companyName" placeholder="工商局注册的企业名称">                            
                        </div>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i>*</i>企业注册地：
                        </div>
                        <div class="cnt">
                            <select name="provinceCode" id="province">
                                <option value="">-省-</option>
                            </select>
                            <select name="cityCode" id="city">
                                <option value="">-市-</option>
                            </select>
                            <select name="areaId" id="area">
                                <option value="">-区/县-</option>
                            </select>
                        </div>
                        <input type="hidden" id="areaFull" name="areaFull" value="">
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i>*</i>联系人姓名：
                        </div>
                        <div class="cnt">
                            <input type="text" class="ipt" value="" autocomplete="off" name="contactName" id="linkMan" placeholder="企业联系人姓名">                            
                        </div>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i>*</i>联系人手机号码：
                        </div>
                        <div class="cnt">
                            <input type="text" class="ipt" value="" autocomplete="off" name="contactMobile" id="mobile" placeholder="企业联系人的手机号码">                            
                        </div>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i>*</i>验证码：
                        </div>
                        <div class="cnt">
                            <input type="text" class="ipt" value="" autocomplete="off" name="mobileCode" id="mobileCode" placeholder="手机短信收到的验证码">
                            <button type="button" class="btn btn-gray btn-inside" id="getMobileCode">获取验证码</button>
                        </div>
                    </div>

                    <div class="group agreement">
                        <div class="cnt">
                            <label><input type="checkbox" class="cbx" name="agreement" id="agreement">我已阅读并同意<a href="#">《药优优用户注册协议》</a></label>                            
                        </div>
                    </div>

                    <div class="group">
                        <div class="cnt">
                            <button type="submit" class="btn btn-red btn-wide" id="submit">立即注册</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="side">
                <div class="hd">
                   已有账号<a class="btn btn-gray" href="/user/login">请登录</a> 
                </div>
                <div class="bd">
                    <dl>
                        <dt>平台流程提示：</dt>
                        <dd>注册平台账户</dd>
                        <dd>提交企业资质</dd>
                        <dd>在线选购商品</dd>
                        <dd>提交询价清单</dd>
                        <dd>选择合适报价</dd>
                        <dd>签订框架合同</dd>
                        <dd>等待平台发货</dd>
                        <dd>验收无误收货</dd>
                        <dd>网上对账付款</dd>
                        <dd><a href="helper.html">查看平台详细教程</a></dd>
                    </dl>
                </div>
                <div class="ft">
                    <p>在线咨询：</p>
                    <p><i class="fa fa-tel"></i><span>400-123-1234</span></p>
                </div>
            </div>
        </div>       
    </div><!-- register end -->


    <!-- footer start -->
    <div class="footer">
        <div class="wrap">
            <div class="links">
                <a href="#">关于药优优</a>
                <i>|</i>
                <a href="#">联系我们</a>
                <i>|</i>
                <a href="#">法律申明</a>
                <i>|</i>
                <a href="#">建议与投诉</a>
                <i>|</i>
                <a href="#">友情链接</a>
                <i>|</i>
                <a href="#">站长统计</a>
            </div>
            <div class="copyright">
                <p> 电信与信息服务业务经营许可证号：皖B20140001  备案号：皖ICP备13006003号  互联网药品交易服务资格证：皖B20130001  互联网药品信息服务资格证：（皖）-经营性-2016-0001</p>
                <p>网站商务合作邮箱：bd@copy;yaoyy.com  客户服务企业邮箱：service@copy;yaoyy.com  Copyright &copy; 2015 – 2020 药优优 All Rights Reserved</p>
            </div>
        </div>
    </div><!-- footer end -->

    <script src="/js/jquery.min.js"></script>
    <script src="/js/validform.min.js"></script>
    <script src="/js/area.js"></script>
    <script>
        $(function() {	
            var icons = {
                error: '<i class="fa fa-prompt"></i>'
            };
         	// _showMsg($('#mobileCode'), '啊啊')
            var _showMsg = function($element, msg) {
 					$element.siblings(".Validform_checktip").attr('class', 'Validform_checktip Validform_wrong').html(msg);

            }
            // 注册验证
        var formValidate = $("#myform").Validform({
            ajaxPost: true,
            postonce: true,
            url: '/user/register',
            beforeSubmit:function(curform){
        		$("#areaFull").val($('#province option:selected').text() + $('#city option:selected').text() + $('#area option:selected').text());
        	},
            callback: function(data){
				var result = data.result; 
				var resultMessage = data.resultMessage;
				if(result != "y"){
					_showMsg($('#mobileCode'), resultMessage);
				}else{
					window.location = "/registerLogin?userName="+ $('#username').val() + "&password="+ $('#pwd').val();
				}
            }
        });

        formValidate.addRule([
            {
                ele: '#username',
                datatype: 'uname',
                ajaxurl: '/user/namecheck?username11=' + $('#username').val(),
                nullmsg: '用户名必须以英文字母开头，长度6到20位',
                errormsg: '用户名必须以英文字母开头，长度6到20位'
            },
            {
                ele: '#pwd',
                datatype: 'pwd',
                nullmsg: '请输入密码',
                errormsg: '密码由数字、字母或下划线组成，长度为6-20位'
            },
            {
                ele: '#pwdRepeat',
                datatype: '*',
                recheck: 'password', 
                nullmsg: '请再重复输入一遍密码，不能留空',
                errormsg: '确认新密码与新密码不一致'
            },
            {
                ele: '#companyName',
                datatype: '*',
                nullmsg: '请输入企业名称'
            },
            {
                ele: '#area',
                datatype: '*',
                nullmsg: '请选择企业注册地'
            },
            {
                ele: '#linkMan',
                datatype: '*',
                nullmsg: '请输入联系人姓名'
            },
            {
                ele: '#mobile',
                datatype: 'm',
                nullmsg: '请输入手机号码',
                errormsg: '请输入正确的手机号码'
            },
            {
                ele: '#mobileCode',
                datatype: '*',
                nullmsg: '请输入短信验证码'
            },
            {
                ele: '#agreement',
                datatype: '*',
                nullmsg: '请同意协议并勾选'
            }
        ])

        var $mobile = $('#mobile'),
            $getMobileCode = $('#getMobileCode'),
            timeout = 0, 
            timer = 0,
            delay = 60,
            txt = '秒后重试';


            var _clock = function() {
                timer && clearInterval(timer);
                timer = setInterval(function() {
                    timeout --;
                    $getMobileCode.text(timeout + txt).prop('disabled', true);
                    if (timeout === 0) {
                        clearInterval(timer);
                        $getMobileCode.text('获取验证码').prop('disabled', false);
                    }
                }, 1e3);
            }

            // 验证码
        var _sendMobileCode = function() {
            $.ajax({
                type : 'POST',
                url : '/gen/code',
                data : {
                    contactMobile: $mobile.val()
                },
                dataType : 'json',
                success : function(data){
                    if (data.status !== 'y') {
                        clearInterval(timer);
                        $getMobileCode.text('获取验证码').prop('disabled', false);
                        _showMsg($('#mobileCode'), data.resultMessage);
                        timeout = 0;
                    } else {
                        timeout = delay;
                        _clock();
                        $getMobileCode.text(timeout + txt).prop('disabled', true);
                    }
                }
            });
        }

        // 验证码
        $getMobileCode.prop('disabled', false).on('click', function() {
            if(timeout === 0 && formValidate.check(false, $mobile)) {
                timeout = delay;
                _sendMobileCode();
            } else {
                $mobile.focus();
            }
        });


    })
    </script>
</body>
</html>