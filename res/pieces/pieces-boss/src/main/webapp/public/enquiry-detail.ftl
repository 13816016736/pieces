<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
<#include "./inc/meta.ftl"/>
    <title>询价信息-boss-上工好药</title>
</head>

<body>
<#include "./inc/header.ftl">
<!-- fa-floor start -->
<div class="fa-floor">
    <div class="wrap">
        <div class="side">
            <dl>
                <dt>询价信息</dt>
                <dd>
                    <a class="curr" href="enquiry/index">询价信息</a>
                </dd>
            </dl>
        </div>
        <div class="main">
            <div class="title">
                <h3><i class="fa fa-chevron-right"></i>${enquiryBills.code}</h3>
                <div class="extra">
                    <a class="btn btn-gray" href="enquiry/index">返回</a>
                    <a class="btn btn-gray" href="enquiry/download/${enquiryBills.id}">导出报价</a>
                    <button class="btn btn-gray" id="importExcel">导入报价</button>
                    <@shiro.hasPermission name="enquiry:quote">
                    <button type="button" id="submit" class="btn btn-red"><#if enquiryBills.status ==1>保存<#else>报价</#if></button>
                    </@shiro.hasPermission>
                </div>
            </div>

            <div class="user-table">
                <div class="caption">
                    <!-- id -->
                    <span>用户名：<em>${enquiryBills.userName}</em></span>
                    <span>用户类型：<em><#if enquiryBills.userType == 1>终端 <#else >代理商 </#if></em></span>
                    <span>认证状态：<em><#if enquiryBills.certifyStatus == 1>已认证<#else >未认证</#if></em></span>
                    <span>企业名称：<em>${enquiryBills.companyFullName}</em></span>
                    <span>企业类型：<em>${enquiryBills.companyType}</em></span>
                    <span>询价日期：<em>${enquiryBills.createTime?date}</em></span>
                    <span>联系人：<em>${enquiryBills.contactName}(${enquiryBills.contactMobile})</em></span>
                    </br>
                    <#if enquiryBills.status ==1>
                    <span>报价时间：<em>${enquiryBills.quotedTime?date}</em></span>
                    <span>报价人：<em>${enquiryBills.quotedName}</em></span>
                    <span>修改时间：<em>${enquiryBills.updateTime?date}</em></span>
                    <span>修改人：<em>${enquiryBills.updateUserName}</em></span>
                    </#if>
                </div>
                <form action="" id="myform" class="chart">
                    <table id="form">
                        <thead>
                        <tr>
                            <th>商品名称</th>
                            <th width="80">片型</th>
                            <th width="300">规格等级</th>
                            <th width="100">产地</th>
                            <th width="120">单价（元/公斤）</th>
                            <th width="120">报价有效期至</th>
                        </tr>
                        </thead>
                        <tfoot></tfoot>
                        <tbody>
                        <tr>
                        <#list enquiryBills.enquiryCommoditys as commodity>
                            <!-- id -->
                            <td>${commodity.commodityName}</td>
                            <td>${commodity.specs}</td>
                            <td>${commodity.level}</td>
                            <td>${commodity.origin}</td>
                            <td>
                                <input type="text" name="id" style="display: none" value="${commodity.id}">
                                <input type="text" name="myPrice" class="ipt ipt-price" value="${commodity.myPrice}">
                            </td>
                            <#if commodity_index == 0>
                            <td rowspan="${enquiryBills.enquiryCommoditys?size}"><input type="text" id="expireDate" name="expireDate" class="ipt ipt-date" value="<#if commodity.expireDate?exists>${commodity.expireDate?date}</#if>"></td>
                            </#if>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div><!-- fa-floor end -->
</div>


<!-- footer start -->
<#include "./inc/footer.ftl"/>
<!-- footer end -->
<script src="js/laydate/laydate.js"></script>
<script src="/js/common.js"></script>
<script src="/js/layer/layer.js"></script>
<link type="text/css" rel="stylesheet" href="/js/layer/skin/layer.css" />
<script>

    var enquiryPage = {
        v: {},
        fn: {
            init: function () {
                this.pirceInput();
                this.dateInit();
                this.batch();

                $("#submit").click(function () {
                    $.ajaxSetup({
                        headers : {
                            'Content-Type' : 'application/json;charset=utf-8'
                        }
                    });

//                    $(this).attr("disabled", "disabled");
                    $.post( "<#if enquiryBills.status ==1>enquiry/quotedUpdate<#else>enquiry/quoted</#if>?billsId=${enquiryBills.id}", JSON.stringify(enquiryPage.fn.formatTableData()),function(data){
                        if(data.status == "y") {
                            $.notify({
                                type: 'success',
                                title: '保存成功',
                                text: data.info,
                                delay: 3e3,
                                call: function () {
                                    window.location.href = "/enquiry/${enquiryBills.id}"
                                }
                            });
                        }
                    },"json")
                });
            },
            // 裸价
            pirceInput: function () {
                $('#myform').on('keyup', '.ipt-price', function (e) {
                    var val = this.value;
                    if (!/^\d+\.?\d*$/.test(val)) {
                        val = Math.abs(parseFloat(val));
                        this.value = isNaN(val) ? '' : val;
                    }
                });
            },
            //日期选择
            dateInit: function () {
                laydate({
                    elem: '#expireDate',
                    istime: true,
                    min: laydate.now()
                })
                
                // 重新定位
                $('.ipt-date').on('click', function() {
                    var 
                        posX = $(this).offset().left,
                        w = this.offsetWidth,
                        obj = document.getElementById('laydate_box');
                    obj.style.left = posX + w - obj.offsetWidth + 'px';
                })
            },
            formatTableData: function () {
                var tableObj = $('#form tbody tr').map(function (i) {
                    var row = {};
                    $(this).find('input').each(function (i) {
                        row[$(this).attr("name")] = $(this).val();
                    });
                    row["expireDate"] = $("#expireDate").val();
                    return row;
                }).get();

                return tableObj;
            },
            batch: function() {
                $("#importExcel").click(function(){
                    layer.open({
                        moveType: 1,
                        area: ['600px'],
                        title: '导入报价',
                        content: '<form action="/enquiry/excel/${enquiryBills.id}" id="excelForm" method="post" enctype="multipart/form-data"><p>上传报价文件</p><label class="btn btn-file enquiry_btn"><span>上传文件</span><input type="file" name="file"></label><label class="filename"></label></form>',
                        btn: ['确定', '取消'],
                        yes: function(index) {
                            $("#excelForm").submit();
                            layer.close(index);
                        },
                        end: function() {
                            $('.enquiry_btn').off();
                        }
                    })
                    $('.enquiry_btn').on('change', 'input', function() {
                        $('.filename').html($(this).val());
                    })
                })
            }
        }
    }
    $(function () {
        enquiryPage.fn.init();
    })


</script>
</body>
</html>