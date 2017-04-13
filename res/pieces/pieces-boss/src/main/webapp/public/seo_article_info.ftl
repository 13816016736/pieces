<!DOCTYPE html>
<html lang="en">
<head>
    <#include "./inc/meta.ftl"/>
    <title>seo管理-boss-上工好药</title>
</head>

<body>

<#include "./inc/header.ftl">

    <!-- fa-floor start -->
    <div class="fa-floor">
        <div class="wrap">
            <div class="side">
                <dl>
                    <dt>SEO管理</dt>
                    <dd>
                        <a href="/seo/setting/1">基本设置</a>
                        <a href="/seo/setting/2">商品列表页模板</a>
                        <a href="/seo/setting/3">商品详情页模板</a>
                        <a href="/seo/setting/4">搜索结果页模板</a>
                        <a href="/seo/setting/5">文章列表页模板</a>
                        <a class="curr" href="/seo/setting/6">文章详情页模板</a>
                    </dd>
                </dl>
            </div>
            <div class="main seo">
                <form type="POST" id="myform">
                    <input type="hidden" class="ipt" name="id"  value="<#if seoSettingVo??>${seoSettingVo.id!}</#if>">
                    <input type="hidden" class="ipt" name="type"  value="6">
                    <div class="title">
                        <h3><i class="fa fa-chevron-right"></i>文章详情页模板</h3>
                        <div class="extra">
                            <button type="button" class="btn btn-gray" onclick="javascript:history.go(-1);">返回</button>
                            <button type="submit" id="save" class="btn btn-red">保存</button>
                        </div>
                    </div>

                    <div class="user-info">
                        <h3>文章详情页模板</h3>
                        <div class="fa-form">
                            <div class="group">
                                <div class="txt">
                                    <i>*</i>页面标题：
                                </div>
                                <div class="cnt">
                                    <textarea name="title" class="ipt ipt-mul">${seoSettingVo.title!}</textarea>
                                    <div class="tag">
                                        <a href="javascript:;">{文章标题}</a>
                                        <a href="javascript:;">{分类名称}</a>
                                        <a href="javascript:;">{通用标题}</a>
                                    </div>
                                </div>
                            </div>
                            <div class="group">
                                <div class="txt">
                                    <i>*</i>关键字：
                                </div>
                                <div class="cnt">
                                    <textarea name="keyWord" class="ipt ipt-mul">${seoSettingVo.keyWord!}</textarea>
                                    <div class="tag">
                                        <a href="javascript:;">{文章关键字}</a>
                                        <a href="javascript:;">{通用关键字}</a>
                                    </div>
                                </div>
                            </div>
                            <div class="group">
                                <div class="txt">
                                    <i>*</i>描述：
                                </div>
                                <div class="cnt">
                                    <textarea name="intro" class="ipt ipt-mul">${seoSettingVo.intro!}</textarea>
                                    <div class="tag">
                                        <a href="javascript:;">{文章描述}</a>
                                        <a href="javascript:;">{通用描述}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- fa-floor end -->
    </div>


<#include "./inc/footer.ftl"/>

    <script src="${urls.getForLookupPath('/js/jquery.min.js')}"></script>
    <script src="js/validator/jquery.validator.min.js?local=zh-CN"></script>
    <script>
        var _global = {
            v: {},
            fn: {
                init: function() {
                    this.bindEvent();
                    this.formValidate();
                },
                bindEvent: function() {
                    $('.tag').on('click', 'a', function() {
                        var $text = $(this).parent().siblings('.ipt');
                        $text.val($text.val() + ' ' + $(this).html() + ' ');
                    })
                    
                    var val1 = '',
                        val2 = '';

                    var setValue = function() {
                        var arr1 = val1.split('{');
                        var arr2 = val2.split('{');
                        for (var i = 0; i < arr1.length; i++) {
                            if (!arr2[i]) {
                                continue;
                            } else if (arr1[i].indexOf('}') != arr2[i].indexOf('}')) {
                                arr2[i] = arr1[i].split('}')[1];
                            } else {
                                if (arr1[i].indexOf('}') > -1) {
                                    arr2[i] = '{' + arr2[i];
                                }
                            }
                        }
                        return arr2.join('');
                    }

                    $('.ipt-mul').on('keydown', function(e) {
                        val1 = this.value;
                    })
                    .on('keyup', function(e) {
                        val2 = this.value;
                        if (e.keyCode === 8) {
                            this.value = setValue();
                        }
                    })
                },
                formValidate: function() {
                    $("#myform").validator({
                        fields: {
                            title: 'required',
                            keywords: 'required',
                            description: 'required'
                        }
                    });
                    $('#save').on('click', function() {
                        if ($('#myform').isValid()) {
                            $.ajax({
                                url: '/seo/setting/save',
                                data: $('#myform').serialize(),
                                type: "POST",
                                success: function (data) {
                                    if(data.status=="y"){
                                        window.location.reload();
                                    }
                                }
                            });
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
