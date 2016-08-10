<!DOCTYPE html>
<html lang="en">
<head>
<#include "./inc/meta.ftl"/>
    <title>商品管理-boss-饮片B2B</title>
</head>

<body>
<#include "./inc/header.ftl">
<!-- fa-floor start -->
<div class="fa-floor">
    <div class="wrap">
        <div class="side">
            <dl>
                <dt>单页面分类信息</dt>
                <dd>
                    <a class="curr" href="cms/category/index?model=1">基本信息</a>
                </dd>
            </dl>
        </div>
        <div class="main">
            <form action="" id="form">
                <div class="title">
                    <h3><i class="fa fa-chevron-right"></i>修改单页面分类</h3>
                    <div class="extra">
                        <a class="btn btn-gray" href="cms/category/index?model=1">返回</a>
                        <button id="submit" type="submit" class="btn btn-red">保存</button>
                    </div>
                </div>

                <div class="user-info">
                    <h3>基本信息</h3>
                    <div class="fa-form">
                        <div class="group">
                            <div class="txt">
                                <i>*</i>分类名称：
                            </div>
                            <div class="cnt">
                                <input type="text" class="ipt" value="${category.name}" autocomplete="off" name="name" id="name"
                                       placeholder="">
                                <input type="text" value="${category.id}" name="id" id="id" style="display: none">
                            </div>
                        </div>
                        <div class="group">
                            <div class="txt">
                                <i>*</i>排序：
                            </div>
                            <div class="cnt">
                                <input type="text" class="ipt" value="${category.sort}" autocomplete="off" name="sort" id="sort"
                                       placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div><!-- fa-floor end -->
</div>
<script src="js/jquery.min.js"></script>
<script src="js/validator/jquery.validator.min.js?local=zh-CN"></script>
<script src="js/common.js"></script>

<!-- footer start -->
<#include "./inc/footer.ftl"/>
<!-- footer end -->
<script>
    var roleAddPage = {
        v: {},
        fn: {
            init: function () {
                this.formValidate();
            },
            formValidate: function () {
                $('#form').validator({
                    fields: {
                        name: 'required',
                        sort: 'required;integer[+0]'
                    },
                    valid: function (form) {
                        if ($(form).isValid()) {
                            $.ajax({
                                url: 'cms/category/save',
                                data: $(form).serialize(),
                                type: 'POST',
                                success: function (data) {
                                    $("#submit").attr("disabled", "disabled");
                                    if (data.status == "y") {
                                        $.notify({
                                            type: 'success',
                                            title: '保存成功。',
                                            delay: 3e3
                                        });
                                    }
                                }
                            });
                        }
                    }
                });
            }
        }
    }
    $(function () {
        roleAddPage.fn.init();
    })


</script>
</body>
</html>