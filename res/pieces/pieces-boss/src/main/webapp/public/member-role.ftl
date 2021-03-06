<!DOCTYPE html>
<html lang="en">
<head>
    <#include "./inc/meta.ftl"/>
    <title>新增用户-boss-上工好药</title>
</head>

<body>
    <#include "./inc/header.ftl">

    <!-- fa-floor start -->
    <div class="fa-floor">
        <div class="wrap">

            <div  style="display: none" id="success_advices" class="message">
                <i class="fa fa-check-circle"></i>
                <span>修改角色成功！</span>
            </div>
            <div  style="display: none" id="error_advices" class="message">
                <i class="fa fa-times-circle"></i>
                <span>修改角色失败！</span>
            </div>

        <div class="side">
                <dl>
                    <dt>用户信息</dt>
                    <dd>
                        <#if member??>
                            <a   href="/member/edit/${member.id}">账号信息</a>
                        <#else>
                            <a   href="/member/add">账号信息</a>
                        </#if>
                        <#if member??>
                            <a  class="curr" href="/member/role/${member.id}">角色信息</a>
                        </#if>
                    </dd>
                </dl>
            </div>
            <div class="main">
                
                <div class="title title-btm">
                    <h3><i class="fa fa-people"></i><#if member??>${member.username}<#else>创建用户</#if></h3>
                    <div class="extra">
                        <a class="btn btn-gray" href="member/index">返回</a>
                        <button id="submit" type="button" class="btn btn-red">保存</button>
                    </div>
                </div>

                <form id="memberRoleForm" method="post" action="member/role/save">
                    <input type="hidden" id="memberId" name="memberId" value="${member.id}">
                    <div class="chart">
                        <table class="tc">
                            <thead>
                                <tr>
                                    <th>指定</th>
                                    <th>
                                        <div class="tl">角色名称</div>
                                    </th>
                                </tr>

                            </thead>
                            <tfoot></tfoot>
                            <tbody>
                                <#list roleList as role>
                                    <tr>
                                        <td>
                                            <label>
                                                <input type="checkbox" name="roleIds" value="${role.id}">
                                            </label>
                                        </td>
                                        <td>
                                            <div class="tl">${role.name}</div>
                                        </td>
                                    </tr>
                                </#list>
                            </tbody>
                        </table>
                    </div>
                </form>

            </div>
        </div><!-- fa-floor end -->
    </div>


    <#include "./inc/footer.ftl"/>
    <script src="/js/validator/jquery.validator.min.js?local=zh-CN"></script>
    <script>
        var roleAddPage = {
            v: {},
            fn: {
                init: function() {
                    $("#submit").click(function(){
                        roleAddPage.fn.save();
                    })

                    roleAddPage.fn.memberCheckInit()
                },
                memberCheckInit:function () {
                    $.ajax({
                        url: "/role/member",
                        type: "POST",
                        data:{memberId:$("#memberId").val()},
                        success: function(result){
                            $.each(result,function(index,obj){
                                $("input[name='roleIds']").each(function(){
                                    if(obj.id==$(this).val()){
                                        $(this).attr("checked",true)
                                    }
                                })
                            })

                        }
                    });
                },
                save:function(){
                    $("#memberRoleForm").ajaxSubmit({
                        dataType: "json",
                        success: function (result) {
                            var type = "error";
                            var title = "操作失败";
                            if(result.status=="y"){
                                type="success";
                                title="操作成功";
                            }
                            $.notify({
                                type: type,
                                title: title,
                                text: result.info,
                                delay: 3e3
                            });
                        }
                    })
                }
            }
        }

        $(function() {
            roleAddPage.fn.init();
        })
    </script>
</body>
</html>