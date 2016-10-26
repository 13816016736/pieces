<!DOCTYPE html>
<html lang="en">
<head>
    <title>寄样单详情-boss-药优优</title>
<#include "./common/meta.ftl"/>
</head>
<body class='wrapper'>
<#include "./common/header.ftl"/>
<#include "./common/aside.ftl"/>

<div class="content">
    <div class="breadcrumb">
        <ul>
            <li>寄样服务</li>
            <li>寄样详情</li>
        </ul>
    </div>

    <div class="box fa-form fa-form-info">
        <div class="hd">寄样信息</div>
        <div class="item">
            <div class="txt">用户姓名：</div>
            <div class="val">${sendSampleVo.nickname}</div>
        </div>
        <div class="item">
            <div class="txt">寄样单编号：</div>
            <div class="val">${sendSampleVo.code}</div>
        </div>
        <div class="item">
            <div class="txt">手机号：</div>
            <div class="val">${sendSampleVo.phone}</div>
        </div>
        <div class="item">
            <div class="txt">地区：</div>
            <div class="val">${sendSampleVo.area}</div>
        </div>
        <div class="item">
            <div class="txt">申请时间：</div>
            <div class="val">${sendSampleVo.createTime?string("yyyy-MM-dd HH:mm")}</div>
        </div>
        <div class="item">
            <div class="txt">申请商品：</div>
            <div class="val">${sendSampleVo.intentionText}</div>
        </div>
        <div class="item">
            <div class="txt">状态：</div>
            <div class="val status-${sendSampleVo.status+1}">${sendSampleVo.statusText}</div>
        </div>
        <div class="item">
            <div class="txt">历史寄样信息：</div>
            <div class="cnt cnt-table">
                <table>
                    <thead>
                    <tr>
                        <th>申请商品</th>
                        <th>申请时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list historySend.list as sendSample>
                    <tr>
                        <td><a href="sample/detail/${sendSample.id?c}">${sendSample.intentionText}</a></td>
                        <td>${sendSample.createTime?string("yyyy-MM-dd HH:mm")}</td>
                        <td><span class="status-${sendSample.status+1}">${sendSample.statusText}</span></td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="box fa-form">
        <div class="hd">信息补全</div>
        <form id="userForm">
            <input type="hidden"  class="ipt" value="${userDetail.id?default('')}" name="id">
            <div class="item">
                <div class="txt">个人称呼：</div>
                <div class="cnt">
                    <input type="text" value="${userDetail.nickname?default('')}" name="nickname" class="ipt" placeholder="" autocomplete="off">
                </div>
            </div>
            <div class="item">
                <div class="txt">联系电话：</div>
                <div class="cnt">
                    <input type="text" value="${userDetail.phone?default('')}" name="phone" class="ipt" placeholder="" autocomplete="off">
                </div>
            </div>
            <div class="item">
                <div class="txt">经营类型：</div>
                <div class="cnt cbxs">
                    <label><input type="radio" name="type" class="cbx" value="1" <#if userDetail.type?exists && userDetail.type==1> checked</#if> >饮片厂</label>
                    <label><input type="radio" name="type" class="cbx" value="2" <#if userDetail.type?exists && userDetail.type==2> checked</#if>>药厂</label>
                    <label><input type="radio" name="type" class="cbx" value="3" <#if userDetail.type?exists && userDetail.type==3> checked</#if>>药材经营公司</label>
                    <label><input type="radio" name="type" class="cbx" value="4" <#if userDetail.type?exists && userDetail.type==4> checked</#if>>个体经营户</label>
                    <label><input type="radio" name="type" class="cbx" value="5" <#if userDetail.type?exists && userDetail.type==5> checked</#if>>合作社</label>
                    <label><input type="radio" name="type" class="cbx" value="6" <#if userDetail.type?exists && userDetail.type==6> checked</#if>>种植基地</label>
                    <label><input type="radio" name="type" class="cbx" value="7" <#if userDetail.type?exists && userDetail.type==7> checked</#if>>其他</label>
                    <label><input type="radio" name="type" class="cbx" value="8" <#if userDetail.type?exists && userDetail.type==8> checked</#if>>个人经营</label>
                    <label><input type="radio" name="type" class="cbx" value="9" <#if userDetail.type?exists && userDetail.type==9> checked</#if>>采购经理</label>
                    <label><input type="radio" name="type" class="cbx" value="10" <#if userDetail.type?exists && userDetail.type==10> checked</#if>>销售经理</label>
                </div>
            </div>
            <div class="item">
                <div class="txt">姓名/单位：</div>
                <div class="cnt">
                    <input type="text" value="${userDetail.name?default('')}" name="name" class="ipt" placeholder="姓名/单位" autocomplete="off">
                </div>
            </div>
            <div class="item">
                <div class="txt">用户备注：</div>
                <div class="cnt">
                    <textarea   id="userRemark" class="ipt ipt-mul">${userDetail.remark?default('')}</textarea>
                </div>
            </div>
            <div class="ft">
                <button type="button" id="saveUser" class="ubtn ubtn-blue">保存客户信息</button>
            </div>
        </form>
    </div>

    <div class="box fa-form">
        <div class="hd">地址信息</div>
        <form action="" id="addressForm">
            <input type="hidden"  class="ipt" value="${sendSampleVo.id}" name="sendId">
            <input type="hidden"  class="ipt" value="${sampleAdderss.id?default('')}" name="id">
            <div class="item" id="jgoosList">
                <div class="txt">寄样商品：</div>
               <#list sendSampleVo.commodityList as commodity>
                <div class="cnt">
                    <input type="text" name="intention" value="${commodity.name} ${commodity.origin} ${commodity.spec}" cid="${commodity.id}" id="goods1" class="ipt" placeholder="" autocomplete="off">
                    <#if commodity_index==(sendSampleVo.commodityList?size-1)>
                        <button type="button" class="ubtn ubtn-blue ml" id="jaddNewGoods">添加一行</button>
                    </#if>

                </div>
               </#list>
            </div>
            <div class="item">
                <div class="txt">收货地址：</div>
                <div class="cnt">
                    <input type="text" value="${sampleAdderss.address?default('')}" name="address" class="ipt" placeholder="" autocomplete="off">
                </div>
            </div>
            <div class="item">
                <div class="txt">收货人：</div>
                <div class="cnt">
                    <input type="text" value="${sampleAdderss.receiver?default('')}" name="receiver" class="ipt" placeholder="" autocomplete="off">
                </div>
            </div>
            <div class="item">
                <div class="txt">收货人电话：</div>
                <div class="cnt">
                    <input type="text" value="${sampleAdderss.receiverPhone?default('')}" name="receiverPhone" class="ipt" placeholder="" autocomplete="off">
                </div>
            </div>
            <div class="item">
                <div class="txt">备注信息：</div>
                <div class="cnt">
                    <textarea  id="addressRemark" class="ipt ipt-mul">${sampleAdderss.remark?default('')}</textarea>
                </div>
            </div>
            <div class="ft">
                <button type="button" id="saveAddress"  class="ubtn ubtn-blue">保存收货信息</button>
            </div>
        </form>
    </div>

    <div class="box fa-form">
        <div class="hd">寄样追踪</div>
        <ol class="trace" id="trace">
            <li class="fore">状态：<em class="status-${sendSampleVo.status+1}">${sendSampleVo.statusText}</em></li>
            <#list trackingList as tracking >
            <li><span>${tracking.name?default('')}</span>&nbsp;&nbsp;<span>${tracking.createTime?string("yyyy年MM月dd日 HH:mm")}</span>&nbsp;&nbsp;<span>${tracking.recordTypeText}</span>&nbsp;&nbsp;<span>${tracking.extra?default('')}</span></li>
            </#list>
        </ol>

        <div class="ft<#if sendSampleVo.status!=0> hide</#if>">
            <button type="button" class="ubtn ubtn-blue submit1">同意寄样</button>
            <button type="button" class="ubtn ubtn-gray ml submit2">拒绝寄样</button>
        </div>
        <div class="ft <#if sendSampleVo.status!=1> hide</#if>">
            <button type="button" class="ubtn ubtn-blue submit3">寄送样品</button>
            <button type="button" class="ubtn ubtn-gray ml submit4">客户来访查看</button>
        </div>
        <form action="" <#if sendSampleVo.status==0||sendSampleVo.status==1 ||sendSampleVo.status==5 ||sendSampleVo.status==2> class="hide"</#if> id="traceForm">
            <div class="item">
                <div class="txt">跟踪记录：</div>
                <div class="cnt">
                    <textarea name="consigneeNote" class="ipt ipt-mul" placeholder="跟踪记录"></textarea>
                </div>
            </div>
            <div class="ft">
                <button type="button" class="ubtn ubtn-blue submit6">寄样完成</button>
                <button type="button" class="ubtn ubtn-gray ml submit5">提交记录</button>
            </div>
        </form>
    </div>
</div>

<!-- 来访人弹出框 -->
<form id="visitorForm" class="hide">
    <div class="fa-form fa-form-layer">
        <div class="item">
            <div class="txt"><i>*</i>来访人：</div>
            <div class="cnt">
                <input type="text" name="vistor" class="ipt" placeholder="" autocomplete="off">
            </div>
        </div>
        <div class="item">
            <div class="txt"><i>*</i>来访人电话：</div>
            <div class="cnt">
                <input type="text" name="vistorPhone" class="ipt" placeholder="" autocomplete="off">
            </div>
        </div>
        <div class="item">
            <div class="txt"><i>*</i>日期选择：</div>
            <div class="cnt">
                <input type="text" name="vistorTime" id="visitorDate" class="ipt" placeholder="" autocomplete="off">
            </div>
        </div>
        <div class="button">
            <button type="submit" class="ubtn ubtn-blue">确认</button>
            <button type="button" class="ubtn ubtn-gray">取消</button>
        </div>
    </div>
</form>

<!-- 寄送样品弹出框 -->
<form id="expressForm" class="hide">
    <div class="fa-form fa-form-layer">
        <div class="item">
            <div class="txt"><i>*</i>快递公司：</div>
            <div class="cnt">
                <input type="text" name="company" class="ipt" placeholder="" autocomplete="off">
            </div>
        </div>
        <div class="item">
            <div class="txt"><i>*</i>快递单号：</div>
            <div class="cnt">
                <input type="text" name="trackingNo" class="ipt" placeholder="" autocomplete="off">
            </div>
        </div>
        <div class="button">
            <button type="submit" class="ubtn ubtn-blue">确认</button>
            <button type="button" class="ubtn ubtn-gray">取消</button>
        </div>
    </div>
</form>

<#include "./common/footer.ftl"/>
<script src="assets/js/jquery.autocomplete.js"></script>
<script src="assets/plugins/laydate/laydate.js"></script>
<script src="assets/plugins/validator/jquery.validator.min.js"></script>
<script>
    var _global = {
        v: {
            userUpdateUrl:'sample/userComplete/',
            addressSaveUrl:'sample/addressSave/',
            searchComodityUrl:'commodity/search',
            trackingCreateUrl:'tracking/create'
        },
        fn: {
            init: function() {
                this.myform();
                this.submitEvent();
            },
            // 查询品种
            searchProduct: function($ele) {
                $ele.autocomplete({
                    serviceUrl:_global.v.searchComodityUrl,
                    paramName: 'name',
                    type:'POST',
                    deferRequestBy: 100,
                    showNoSuggestionNotice: true,
                    noSuggestionNotice: '没有该品种',
                    transformResult: function (response) {
                        response = JSON.parse(response);
                        if (response.status == "200") {
                            return {
                                suggestions: $.map(response.data, function (dataItem) {
                                    return {value: dataItem.name+" "+dataItem.origin+" "+dataItem.spec, data: dataItem.id};
                                })
                            };
                        } else {
                            return {
                                suggestions: []
                            }
                        }
                    },
                    onSelect: function (suggestion) {
                    }
                });
            },
            myform: function() {

                var self = this,
                        $jgoosList = $('#jgoosList'),
                        idx = $jgoosList.find('.cnt').length;

                // 添加商品
                $('#jaddNewGoods').on('click', function() {
                    $jgoosList.append('<div class="cnt"> \n <div class="ipt-wrap"><input type="text" name="intention' + '" id="goods' + (++idx) + '" class="ipt" autocomplete="off"></div> \n <button type="button" class="ubtn ubtn-red ml">删除</button> \n </div>');
                    self.searchProduct($('#goods' + idx));
                })

                // 删除价格
                $jgoosList.on('click', '.ubtn-red', function(){
                    $(this).prev().find('.ipt').autocomplete('dispose');
                    $(this).parent().remove();
                })

                self.searchProduct($('#goods1'));

            },
            // 提交事件
            submitEvent: function() {
                var self = this,
                        $trace = $('#trace'),
                        $pa = $trace.parent(),
                        $visitorForm = $('#visitorForm'),
                        $expressForm = $('#expressForm');


                // 关闭弹层
                $expressForm.on('click', '.ubtn-gray', function () {
                    layer.closeAll();
                })

                // 关闭弹层
                $visitorForm.on('click', '.ubtn-gray', function () {
                    layer.closeAll();
                })

                // 同意寄样
                $pa.on('click', '.submit1', function() {
                    self.submit1();
                    return false;
                })

                // 拒绝寄样
                $pa.on('click', '.submit2', function(){
                    self.submit2();
                    return false;
                })

                // 寄送样品
                $pa.on('click', '.submit3', function(){
                    $expressForm[0].reset();
                    self.layerForm($expressForm, '快递信息');
                    return false;
                })

                // 客户来访
                $pa.on('click', '.submit4', function(){
                    $visitorForm[0].reset();
                    self.layerForm($visitorForm, '来访信息');
                    return false;
                })

                // 提交记录
                $pa.on('click', '.submit5', function(){
                    var text = $('#traceForm').find('.ipt').val();
                    $.ajax({
                        url: _global.v.trackingCreateUrl,
                        data: {sendId: ${sendSampleVo.id},recordType:6,extra:text},
                        type: "POST",
                        success: function(data) {
                            /*
                            data = {
                                date: '2016年10月20日 15:20',
                                operator: 'frank',
                                msg: text
                            }
                            $('#traceForm').find('.ipt').val('');
                            self.addNewRevord(data);
                            */
                            window.location.reload();
                        }
                    })
                })

                // 寄样完成
                $pa.on('click', '.submit6', function() {
                    layer.confirm('寄样完成后不能进行跟踪记录操作，是否确认', {
                        btn: ['确认','取消'] //按钮
                    }, function(index){
                        $.ajax({
                            url: _global.v.trackingCreateUrl,
                            data: {sendId: ${sendSampleVo.id},recordType:8},
                            type: "POST",
                            success: function(data) {
                                /*
                                data = {
                                    operator: 'frank',
                                    date: '2016年10月20日 15:20',
                                    msg: text
                                }
                                $('#trace').append('<li><span>' + data.date + '</span><span>操作人：' + data.operator + '</span><span>同意寄样</span></li><li><span>同意理由：' + data.msg + '</span></li>');
                                $('.submit2').parent().remove();
                                $('.submit3').parent().show();
                                */
                                window.location.reload();
                            }
                        })
                        //$('#traceForm').remove();
                        //layer.close(index);
                    });
                })

                // 快递信息验证
                $expressForm.validator({
                    fields: {
                        company: '快递公司: required',
                        trackingNo: '快递单号: required'
                    },
                    valid: function (form) {
                        $.ajax({
                            url: _global.v.trackingCreateUrl,
                            data:  $.param({sendId: ${sendSampleVo.id},recordType:3}) + '&' +$expressForm.serialize(),
                            type: "POST",
                            success: function(data) {
                                /*
                                data = {
                                    date: '2016年10月20日 15:20',
                                    operator: 'frank',
                                    express: '顺丰快递',
                                    expressNum: '11454114141'
                                }
                                self.addNewRevord(data);
                                $('.submit3').parent().remove();
                                $('#traceForm').show();
                                layer.closeAll();
                                */
                                window.location.reload();
                            }
                        })
                    }
                });

                // 来访信息验证
                $visitorForm.validator({
                    fields: {
                        visitor: '来访人: required',
                        visitorMobile: '来访人电话: required; mobile',
                        visitorDate: '日期: required'
                    },
                    valid: function (form) {
                        $.ajax({
                            url: _global.v.trackingCreateUrl,
                            data: $.param({sendId: ${sendSampleVo.id},recordType:5}) + '&' +$visitorForm.serialize(),
                            type: "POST",
                            success: function(data) {
                                /*
                                data = {
                                    date: '2016年10月20日 15:20',
                                    operator: 'frank',
                                    visitorDate: '2016年10月22日 10:20',
                                    visitor: '王彬',
                                    visitorMobile: '18801285391'
                                }
                                self.addNewRevord(data);
                                $('.submit3').parent().remove();
                                $('#traceForm').show();
                                layer.closeAll();
                                */
                                window.location.reload();
                            }
                        })
                    }
                });

                // 来访日期
                laydate({
                    elem: '#visitorDate',
                    format: 'YYYY-MM-DD hh:mm:ss',
                    min: laydate.now(), //设定最小日期为当前日期
                    istime: true,
                    choose: function(date){
                        $('#visitorDate').trigger('validate');
                    }
                })
            },
            // 同意寄样
            submit1: function() {
                layer.prompt({
                    moveType: 1,
                    formType: 2,
                    title: '同意原因',
                    btn: ['同意', '关闭']
                }, function(text, index) {
                    $.ajax({
                        url: _global.v.trackingCreateUrl,
                        data: {sendId: ${sendSampleVo.id},recordType:1,extra:"同意理由："+text},
                        type: "POST",
                        success: function(data) {
                            /*
                            data = {
                                operator: 'frank',
                                date: '2016年10月20日 15:20',
                                msg: text
                            }
                            $('#trace').append('<li><span>' + data.date + '</span><span>操作人：' + data.operator + '</span><span>同意寄样</span></li><li><span>同意理由：' + data.msg + '</span></li>');
                            $('.submit2').parent().remove();
                            $('.submit3').parent().show();
                            */
                            window.location.reload();
                        }
                    })
                    layer.close(index);
                });
            },
            // 拒绝寄样
            submit2: function() {
                layer.prompt({
                    moveType: 1,
                    formType: 2,
                    title: '拒绝原因',
                    btn: ['拒绝', '关闭']
                }, function(text, index) {
                    $.ajax({
                        url: _global.v.trackingCreateUrl,
                        data: {sendId: ${sendSampleVo.id},recordType:2,extra:"不同意理由："+text},
                        type: "POST",
                        success: function(data) {
                            /*
                            data = {
                                operator: 'frank',
                                date: '2016年10月20日 15:20',
                                msg: text
                            }
                            $('#trace').append('<li><span>' + data.date + '</span><span>操作人：' + data.operator + '</span><span>拒绝寄样</span></li><li><span>拒绝理由：' + data.msg + '</span></li>');
                            $('#trace').nextAll().remove();
                            */
                            window.location.reload();
                        }
                    })
                    layer.close(index);
                });
            },
            // 表单
            layerForm: function(modal, title) {
                layer.open({
                    area: ['600px'],
                    type: 1,
                    moveType: 1,
                    content: modal,
                    title: title
                });
            },
            // 添加记录
            addNewRevord: function(data) {
                var html = [];
                $.each(data, function(i, item) {
                    html.push('<span>' + item + '</span>');
                })
                html.length > 1 && $('#trace').append('<li>' + html.join('') + '</li>');
            }
        }


    }

    $(function() {
        _global.fn.init();
        $("#saveUser").on('click', function() {
            var url = _global.v.userUpdateUrl;
            $.ajax({
                url: url,
                data: $("#userForm").serialize()+"&remark="+$("#userRemark").val(),
                type: "POST",
                success: function(data){
                    if (data.status == "200") {
                        window.location.reload();
                    }

                }
            });
        });
        $("#saveAddress").on('click', function() {
            var url = _global.v.addressSaveUrl;
            $.ajax({
                url: url,
                data: $("#addressForm").serialize()+"&remark="+$("#addressRemark").val(),
                type: "POST",
                success: function(data){
                    if (data.status == "200") {
                        window.location.reload();
                    }

                }
            });
        });
    })
</script>
</body>
</html>