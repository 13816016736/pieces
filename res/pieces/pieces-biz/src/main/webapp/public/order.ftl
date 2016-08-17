<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单-饮片B2B</title>
    <meta name="renderer" content="webkit" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/order.css" />
</head>

<body>
	
    <!-- site-nav end -->
    <div class="site-nav">
        <div class="wrap">
            <p class="fl">欢迎光临上工之选饮片采购平台！</p>
            <ul class="fr">
                <li>ht****@163.com  <a href="logout.html">退出</a></li>
                <li>|</li>
                <li><a href="logout.html">我的供应链</a></li>
                <li>|</li>
                <li><a href="helper.html">帮助中心</a></li>
                <li>|</li>
                <li><a href="sitemap.html">网站导航 <i class="fa fa-chevron-down"></i></a></li>
            </ul>
        </div>
    </div><!-- site-nav end -->


    <!-- header start -->
    <div class="header header-red">
        <div class="wrap">
            <div class="logo">
                <a href="home.html">饮片B2B首页</a>
            </div>
            <div class="title">
                <h1>我的供应链</h1>
            </div>
            <div class="plus">
                <a class="back" href="home.html"><i class="fa fa-chevron-left"></i> 返回商城首页</a>
            </div>
        </div>
    </div><!-- header end -->

    <!-- order-success start -->
    <div class="wrap">
        <div class="order-wrap">
            <div class="title">
                <h3>订购商品</h3>
            </div>

            <div class="order">
                <!-- start 收货信息 -->
                <div class="group">
                    <div class="hd">
                        <h3>收货信息</h3>
                    </div>
                    <div class="consignee">
                       <!-- 没有数据时显示这个  
                        <div class="empty">
                            <button class="btn btn-lgray jaddConsignee">新建收货地址</button>
                        </div> 
                        -->
                        <ul>
                            <li>
                                <p><span>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</span>何欢</p>
                                <p><span>联系方式：</span>18900557973</p>
                                <p><span>收货地址：</span>湖北省武汉市汉阳区武汉市汉阳区知音西村56号303</p>
                                <div class="extra">
                                    <a href="javascript:;" class="c-blue" id="jchooseConsignee">切换地址</a>
                                    <button class="btn btn-lgray jaddConsignee">新增收货地址</button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div><!-- end 收货信息 -->

                <!-- start 送货清单 -->
                <div class="group">
                    <div class="hd cf">
                        <a href="#" class="c-blue fr">返回询价单</a>
                        <h3>送货清单</h3>
                    </div>

                    <div class="fa-chart">
                        <table>
                            <thead>
                                <tr>
                                    <th width="180">商品名称</th>
                                    <th width="80">切制规格</th>
                                    <th width="80">等级</th>
                                    <th width="110">产地</th>
                                    <th width="110">期望交货日期</th>
                                    <th width="110">数量<em>（公斤）</em></th>
                                    <th width="110">单价<em>（元/公斤）</em></th>
                                    <th>小计<em>（元）</em></th>
                                    <th width="200">运费<em>（元）</em></th>
                                </tr>
                            </thead>
                            <tfoot></tfoot>
                            <tbody>
                                <tr>
                                    <td>巴戟肉</td>
                                    <td>薄片</td>
                                    <td>1</td>
                                    <td>安徽省</td>
                                    <td>2016-08-20</td>
                                    <td>6000</td>
                                    <td>¥20.00</td>
                                    <td>¥120000.00</td>
                                    <td rowspan="2"><input class="ipt" id="freightPrice" type="text" placeholder="请填写询价时协商好的运费"></td>
                                </tr>
                                <tr>
                                    <td>艾绒</td>
                                    <td>个</td>
                                    <td>2</td>
                                    <td>湖北省</td>
                                    <td>2016-08-20</td>
                                    <td>6000</td>
                                    <td>¥20.00</td>
                                    <td>¥120000.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div><!-- end 送货清单 -->

                <!-- start 订单备注 -->
                <div class="group">
                    <div class="hd">
                        <h3>订单备注</h3>
                    </div>
                    <div>
                        <textarea name="" id="" cols="30" rows="10" class="mul" placeholder="请填写本次采购另外需要注意的事项。"></textarea>
                    </div>
                </div><!-- end 订单备注 -->

                <!-- start 发票信息 -->
                <div class="group">
                    <div class="hd">
                        <h3>发票信息</h3>
                    </div>
                    <div class="invoice">
                        <!-- <span class="tips">您当前的发票信息如下：</span>
                        <em>普通发票</em><em>速采科技</em><em>药材</em><a href="javascript:;" class="c-blue jinvoiceEdit">修改</a> -->
                        <button class="btn btn-lgray jinvoiceAdd">新增发票</button>
                    </div>
                    
                </div><!-- end 发票信息 -->
                
                <!-- start 小计 -->
                <div class="summary">
                    <div class="item">
                        <span>商品合计：</span>
                        <em>￥2200000.00</em>
                    </div>
                    <div class="item">
                        <span>运&#12288;&#12288;费：</span>
                        <em>￥3000.0</em>
                    </div>
                    <div class="item">
                        <span>实际应付：</span>
                        <em class="price">￥2203000.00</em>
                    </div>
                </div><!-- end 小计 -->
                
                <!-- start 提交 -->
                <div class="submit">
                    <button type="button" class="btn btn-red">确认订购</button>
                </div><!-- end 提交 -->
            </div>
        </div>
    </div><!-- order-success end -->


    <!-- footer start -->
    <div class="footer">
        <div class="wrap">
            <div class="links">
                <a href="#">关于上工之选</a>
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
                <p>网站商务合作邮箱：bd@copy;yaoyy.com  客户服务企业邮箱：service@copy;yaoyy.com  Copyright &copy; 2015 – 2020 上工之选 All Rights Reserved</p>
            </div>
        </div>
    </div><!-- footer end -->
    
    <!-- start 新增发票 -->
    <div class="fa-form" id="jinvoiceBox">
        <form action="" id="invoiceForm">
            <div class="group">
                <div class="txt">
                    <span>发票类型：</span>
                </div>
                <div class="cnt">
                    <label><input type="radio" name="invoice" value="0" class="cbx" data-text="普通发票">普通发票</label>
                    <label><input type="radio" name="invoice" value="1" class="cbx" data-text="增值税专用发票">增值税专用发票</label>
                    <label><input type="radio" name="invoice" value="2" class="cbx" data-text="暂不需要">暂不需要</label>
                </div>
            </div>

            <div class="group">
                <div class="txt">
                    <span>单位名称：</span>
                </div>
                <div class="cnt">
                    <input type="text" name="companyName" class="ipt" autocomplete="off" placeholder="提示：若为个人客户，请在该项填写“个人”">
                    <span class="error"></span>
                </div>
            </div>

            <div class="group">
                <div class="txt">
                    <span>发票内容：</span>
                </div>
                <div class="cnt">
                    <input type="text" name="invoiceDetail" class="ipt" autocomplete="off" placeholder="">
                    <span class="error"></span>
                </div>
            </div>

            <div class="button">
                <button type="submit" class="btn btn-red submit">保存</button>
                <button type="reset" class="btn btn-gray cancel">取消</button>
            </div>
        </form>
    </div><!-- end 新增发票 -->
    

    <!-- start 新增收货地址 -->
    <div class="fa-form" id="jconsigneeBox">
        <form action="" id="consigneeForm">
            <div class="group fl">
                <div class="txt">
                    <span>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</span>
                </div>
                <div class="cnt">
                    <input type="text" name="consigneeName" id="consigneeName" class="ipt ipt-short" autocomplete="off" placeholder="" data-msg-nickName="只能输入中文、英文，长度2-50" maxlength="50">
                </div>
            </div>

            <div class="group fr">
                <div class="txt">
                    <span>手机号码：</span>
                </div>
                <div class="cnt">
                    <input type="text" name="consigneeMobile" id="consigneeMobile" class="ipt ipt-short" autocomplete="off" placeholder="">
                    <span class="error"></span>
                </div>
            </div>

            <div class="cf"></div>

            <div class="group">
                <div class="txt">
                    <span>所在地区：</span>
                </div>
                <div class="cnt">
                    <select name="provinceCode" id="province">
                        <option value="">-省-</option>
                    </select>
                    <select name="cityCode" id="city">
                        <option value="">-市-</option>
                    </select>
                    <select name="areaId" id="area" data-msg-required="请选择至最后一级">
                        <option value="">-区/县-</option>
                    </select>
                    <input type="hidden" id="areaFull" name="areaFull" value="">
                    <span class="error"></span>
                </div>
            </div>

            <div class="group">
                <div class="txt">
                    <span>详细地址：</span>
                </div>
                <div class="cnt">
                    <input type="text" name="consigneeAddress" id="consigneeAddress" class="ipt ipt-wide" autocomplete="off">
                    <span class="error"></span>
                </div>
            </div>

            <div class="group ah">
                <div class="cnt">
                    <label><input type="checkbox" class="cbx" name="default" checked>设为默认地址</label>                            
                </div>
            </div>

            <div class="button">
                <button type="submit" class="btn btn-red submit">保存</button>
                <button type="reset" class="btn btn-gray cancel">取消</button>
            </div>
        </form>
    </div><!-- end 新增收货地址 -->

    <div class="consignee consignee-list" id="jconsigneeList">
        <ul>
            <li class="current">
                <p><span>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</span>何欢</p>
                <p><span>联系方式：</span>18900557973</p>
                <p><span>收货地址：</span>湖北省武汉市汉阳区武汉市汉阳区知音西村56号303</p>
                <div class="default">
                    <span class="c-red">默认地址</span>
                </div>
            </li>
            <li>
                <p><span>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</span>何欢</p>
                <p><span>联系方式：</span>18900557973</p>
                <p><span>收货地址：</span>湖北省武汉市汉阳区武汉市汉阳区知音西村56号303</p>
                <div class="default">
                    <span class="c-red">默认地址</span>
                </div>
            </li>
            <li>
                <p><span>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</span>何欢</p>
                <p><span>联系方式：</span>18900557973</p>
                <p><span>收货地址：</span>湖北省武汉市汉阳区武汉市汉阳区知音西村56号303</p>
                <div class="default">
                    <span class="c-red">默认地址</span>
                </div>
            </li>
        </ul>

        <div class="button">
            <button type="button" class="btn btn-red submit">保存</button>
            <button type="button" class="btn btn-gray cancel">取消</button>
        </div>
    </div>
	

    <script src="js/jquery.min.js"></script>
    <script src="js/layer/layer.js"></script>
    <script src="js/laydate/laydate.js"></script>
    <script src="js/validator/jquery.validator.js?local=zh-CN"></script>
    <script src="js/area.js"></script>
    <script src="js/common.js"></script>
    <script>
    	var _global = {
    		v: {
    		},
    		fn: {
    			init: function() {
                    this.addInvoice();
                    this.addConsignee();
                    this.chooseConsignee();
                    this.freightPrice();
    			},
                // 新增发票
                addInvoice: function() {
                    var $invoiceBox = $('#jinvoiceBox'),
                        $invoice = $('.invoice');

                    var closeLayer = function() {
                        layer.closeAll();
                        $('#invoiceForm').get(0).reset(); // 重置表单
                    }

                    // 新增
                    $invoice.on('click', '.jinvoiceAdd', function() {
                        $invoiceBox.find('.cbx:eq(0)').prop('checked', true);

                        layer.open({
                            area: ['600px'],
                            closeBtn: 1,
                            type: 1,
                            moveType: 1,
                            content: $invoiceBox,
                            title: '新增发票'
                        });
                    })

                    // 修改
                    $invoice.on('click', '.jinvoiceEdit', function() {
                        var info = $invoice.find('em');
                        $invoiceBox.find('.cbx').each(function() {
                            this.checked = $(this).data('text') === info.eq(0).html();
                        });
                        $invoiceBox.find('input[name="companyName"]').val(info.eq(1).html());
                        $invoiceBox.find('input[name="invoiceDetail"]').val(info.eq(2).html());

                        layer.open({
                            area: ['600px'],
                            closeBtn: 1,
                            type: 1,
                            moveType: 1,
                            content: $invoiceBox,
                            title: '修改发票'
                        });
                    })

                    // 关闭弹层
                    $invoiceBox.on('click', '.cancel', function() {
                        closeLayer();
                    })

                    $('#invoiceForm').validator({
                        fields : {
                            invoice: '发票类型: checked',
                            companyName : '单位名称: required',
                            invoiceDetail : '发票内容: required'
                        },
                        valid: function(form) {
                            var myfromValid = this;
                            if ( $(form).isValid() ) {
                                var html = ['<span class="tips">您当前的发票信息如下：</span>'];
                                html.push('<em>', $invoiceBox.find('input[name="invoice"]:checked').data('text'), '</em>');
                                html.push('<em>', $invoiceBox.find('input[name="companyName"]').val(), '</em>');
                                html.push('<em>', $invoiceBox.find('input[name="invoiceDetail"]').val(), '</em>');
                                html.push('<a href="javascript:;" class="c-blue jinvoiceEdit">修改</a>');
                                $invoice.html(html.join(''));

                                closeLayer();
                            } 
                        }
                    });

                    // 不需要发票
                    var pass = true;
                    $invoiceBox.find('.cbx').on('click', function() {
                        var text = $(this).data('text');
                        if (text === '暂不需要') {
                            $invoiceBox.find('.submit').attr('type', 'button').addClass('jinvoiceDel');
                            $invoiceBox.find('.msg-box').html('').hide();
                            $invoiceBox.find('.ipt').removeClass('n-invalid');
                        } else {
                            $invoiceBox.find('.submit').attr('type', 'submit').removeClass('jinvoiceDel');
                        }
                    });

                    $invoiceBox.on('click', '.jinvoiceDel', function() {
                        closeLayer();
                        $invoice.html('<button class="btn btn-lgray jinvoiceAdd">新增发票</button>');
                        $invoiceBox.find('.submit').attr('type', 'submit').removeClass('jinvoiceDel');
                        return false;
                    })

                },
                // 新增收货地址
                addConsignee: function() {
                    var $consigneeBox = $('#jconsigneeBox');
                    $('.jaddConsignee').on('click', function() {
                        layer.open({
                            area: ['600px'],
                            closeBtn: 1,
                            type: 1,
                            moveType: 1,
                            content: $consigneeBox,
                            title: '新建地址'
                        });
                    })
                    // 关闭弹层
                    $consigneeBox.on('click', '.cancel', function() {
                        layer.closeAll();
                    })

                    $('#consigneeForm').validator({
                        fields : {
                            consigneeName : '收货人: required; nickName',
                            consigneeMobile : '手机号码: required; mobile',
                            areaId : '所在地区: required',
                            consigneeAddress : '详细地址: required'
                        },
                        valid: function(form) {
                            var myfromValid = this;
                            if ( $(form).isValid() ) {
                                $("#areaFull").val($('#province option:selected').text() + $('#city option:selected').text() + $('#area option:selected').text());
                            } 
                        }
                    });
                },
                // 切换地址
                chooseConsignee: function() {                    
                    var $consigneeList = $('#jconsigneeList');
                    $('#jchooseConsignee').on('click', function() {
                        layer.open({
                            area: ['600px'],
                            closeBtn: 1,
                            type: 1,
                            moveType: 1,
                            content: $consigneeList,
                            title: '选择地址'
                        });
                    })

                    // 关闭弹层
                    $consigneeList.on('click', '.cancel', function() {
                        layer.closeAll();
                    })

                    $consigneeList.on('click', 'li', function() {
                        $(this).addClass('current').siblings().removeClass('current');
                    })

                },
                // 运费
                freightPrice: function() {
                    // 单价
                    $('#freightPrice').on('keyup', function(e) {
                        var val = this.value;
                        if (!/^\d+\.?\d*$/.test(val)) {
                            val = Math.abs(parseFloat(val));
                            this.value = isNaN(val) ? '' : val;
                        }
                    });
                }
    		}
    	}
    	$(function() {
    		_global.fn.init();
    	})
    </script>
</body>
</html>