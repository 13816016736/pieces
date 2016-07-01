<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新增账户-boss-饮片B2B</title>
    <meta name="renderer" content="webkit" />
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>

    <!-- header start -->
    <div class="header">
        <div class="wrap">
            <div class="logo">
                <a href="home.html">药优优电子商务管理系统</a>
            </div>
            <div class="user">
                <span>登录用户 hehuan</span>
                <i>|</i>
                <span>2016年6月20日 星期三</span>
                <i>|</i>
                <a href="logout.html">退出</a>
            </div>
        </div>
    </div><!-- header end -->


    <!-- nav start -->
    <div class="nav">
        <div class="wrap">
            <ul>
                <li><a href="#!">首页</a></li>
                <li><a href="#!">销售</a></li>
                <li><a href="#!">目录</a></li>
                <li>
                    <a class="curr" href="#!">客户</a>
                    <div class="subnav">
                        <a href="customers.html">客户管理</a>
                    </div>
                </li>
                <li>
                    <a href="#!">促销</a>
                    <div class="subnav">
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                    </div>
                </li>
                <li><a href="#!">邮件列表</a></li>
                <li><a href="#!">CMS</a></li>
                <li><a href="#!">报表</a></li>
                <li><a href="#!">系统</a></li>
            </ul>
        </div>
    </div><!-- nav end -->


    <!-- fa-floor start -->
    <div class="fa-floor">
        <div class="wrap">
            <div class="side">
                <dl>
                    <dt>客户信息</dt>
                    <dd>
                        <a href="/menber/get/user">客户界面</a>
                        <a class="curr" href="/menber/to/add/user">账户信息</a>
                    </dd>
                </dl>
            </div>
            <div class="main">


                <form action="" id="myform">
                    <div class="title">
                        <h3><i class="fa fa-people"></i>hehuan</h3>
                        <div class="extra">
                            <button type="button" class="btn btn-gray" onclick="javascript:history.go(-1);">返回</button>
                            <button type="reset" class="btn btn-gray">重置</button>
                            <button type="submit" class="btn btn-red">保存</button>
                        </div>
                    </div>

                    <div class="user-info">
                        <h3>账户信息</h3>
                        <div class="fa-form">
                            <div class="group">
                                <div class="txt">
                                    <i>*</i>会员名：
                                </div>
                                <div class="cnt">
                                    <input type="text" class="ipt" value="" autocomplete="off" name="username" id="username" placeholder="">                            
                                </div>
                            </div>

                            <div class="group">
                                <div class="txt">
                                    <i>*</i>企业全称：
                                </div>
                                <div class="cnt">
                                    <input type="text" class="ipt" value="" autocomplete="off" name="companyName" id="companyName" placeholder="">   
                                </div>
                            </div>

                            <div class="group">
                                <div class="txt">
                                    <i>*</i>企业注册地：
                                </div>
                                <div class="cnt">
                                    <select name="province" id="province">
                                        <option value="">-省-</option>
                                    </select>
                                    <select name="city" id="city">
                                        <option value="">-市-</option>
                                    </select>
                                    <select name="area" id="area">
                                        <option value="">-区/县-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="group">
                                <div class="txt">
                                    <i>*</i>联系人姓名：
                                </div>
                                <div class="cnt">
                                    <input type="text" class="ipt" value="" autocomplete="off" name="linkMan" id="linkMan" placeholder="">                            
                                </div>
                            </div>

                            <div class="group">
                                <div class="txt">
                                    <i>*</i>联系人手机号码：
                                </div>
                                <div class="cnt">
                                    <input type="text" class="ipt" value="" autocomplete="off" name="mobile" id="mobile" placeholder="">                            
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="user-info">
                        <h3>密码管理</h3>

                        <div class="fa-form">
                            <div class="group">
                                <div class="txt">
                                    <i>*</i>新密码：
                                </div>
                                <div class="cnt">
                                    <input type="password" class="ipt" value="" autocomplete="off" name="pwd" id="pwd" placeholder="请输入新密码">     
                                </div>
                            </div>

                            <div class="group">
                                <div class="cnt-extra">
                                    <label><input class="cbx" id="mobileCode" type="checkbox">或发送随机密码</label>                
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- fa-floor end -->
    </div>


    <!-- footer start -->
    <div class="footer">
        <div class="wrap">            
            <div class="copyright">
                <p>药优优电商管理系统 版本 1.0  版权所有 &copy; 2016 药优优</p>
            </div>
        </div>
    </div><!-- footer end -->

    <script src="js/jquery.min.js"></script>
    <script src="js/validform.min.js"></script>
    <script src="js/area.js"></script>
    <script>
        $(function() {

            var iconsError = "<i class='fa fa-prompt'></i> ";
            $.Tipmsg.r = '';
            $.Tipmsg.c = '';

            var formValidate = $("#myform").Validform({
                postonce: true,
                showAllError: true,
                datatype: {
                    pwd: /^[a-zA-Z0-9_]{6,20}$/
                },
                tiptype: 3
            });

            formValidate.addRule([
                {
                    ele: '#username',
                    datatype: /^[a-zA-Z]{1}[a-zA-Z0-9]{5,19}$/,
                    ajaxurl: 'json/valid.php',
                    nullmsg: iconsError + '会员名必须以英文字母开头，长度6到20位',
                    errormsg: iconsError + '会员名必须以英文字母开头，长度6到20位'
                },
                {
                    ele: '#companyName',
                    datatype: 's',
                    nullmsg: iconsError + '用户名必须以英文字母开头，长度6到20位',
                    errormsg: iconsError + '用户名长度只能在6-20位字符之间'
                },
                {
                    ele: '#area',
                    datatype: 's',
                    nullmsg: iconsError + '请选择企业注册地'
                },
                {
                    ele: '#linkMan',
                    datatype: 's',
                    nullmsg: iconsError + '请输入联系人姓名'
                },
                {
                    ele: '#mobile',
                    datatype: 'm',
                    nullmsg: iconsError + '请输入手机号码',
                    errormsg: iconsError + '请输入正确的电话号码'
                },
                {
                    ele: '#pwd',
                    datatype: '*,pwd',
                    nullmsg: iconsError + '请输入密码',
                    errormsg: iconsError + '密码由数字、字母或下划线组成，长度为6-20位'
                }
            ])

            
            var $mobileCode = $('#mobileCode');
            var $pwd = $('#pwd');
            var setPwd = function() {
                var flag = $mobileCode.prop('checked');
                if (flag) {
                    formValidate.ignore($pwd);
                    $pwd.removeAttr('recheck').nextAll('.Validform_checktip').removeClass('Validform_wrong').html('');
                } else {
                    formValidate.unignore($pwd);
                    $pwd.attr('recheck','1');
                }
                $pwd.prop('disabled', flag);
            }
            $mobileCode.on('click', setPwd);
            setPwd();

        })
    </script>
</body>
</html>