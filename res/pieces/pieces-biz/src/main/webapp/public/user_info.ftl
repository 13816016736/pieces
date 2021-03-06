<!DOCTYPE html>
<html lang="en">
<head>
    <#include "./inc/meta.ftl"/>
        <title>用户资料-${baseSetting.title!}</title>
        <meta name="description" content="${baseSetting.intro!}" />
        <meta name="Keywords" content="${baseSetting.keyWord!}" />
</head>

<body>

    <#include "./inc/header-center.ftl"/>
<!-- member-box start -->
    <!-- member-box start -->
    <div class="member-box">
        <div class="wrap">
        <#include "./inc/side-center.ftl"/>

            <div class="main">
                <div class="title">
                    <h3>注册资料</h3>
                    <div class="extra"></div>
                </div>
                <div class="mybill mybill-extra">
                    <#if user.type==1>

                        <#if user.certifyStatus==0 >
                        <div class="fa-msg">
                            <i class="fa fa-prompt"></i>
                        <#if cerfiy==0>
                            <span>您的企业资质正在审核中，审核结果将以短信的形式发送给您，如有问题请致电0558-5120088。</span>
                        <#elseif cerfiy==2>
                            <span>您的企业资质审核未通过<em>不通过原因：${reason!}</em></span>
                            <a class="btn-ghost" href="/user/certify">重新提交资质审核</a>
                        <#elseif cerfiy==-1>
                            <span>您尚未提交企业资质审核，通过审核后方可进行在线下单。<a class="btn-ghost" href="/user/certify">提交资质审核</a></span>
                        </#if>
                        </div>
                        </#if>


                    </#if>

                    <div class="info">
                        <div class="hd">账号资料</div>
                        <div class="bd">
                            <table>
                                <tr>

                                    <td><em>用户名：</em>**${user.userName?substring(user.userName?length-3)}
                                        <#if user.certifyStatus==1>
                                        <strong class="ok"><i class="fa fa-check-circle"></i>已通过企业资质审核</strong>
                                        </#if>
                                    </td>
                                </tr>
                                <tr>
                                    <td><em>密码：</em>****** <a href="user/pwd/update" class="link">[修改密码]</a></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="info">
                        <div class="hd">企业资料</div>
                        <div class="bd">
                            <table>
                               <#if user.type==1>
                                <tr class="item">
                                    <td><em>企业名称：</em>${userCertification.company!''}</td>
                                </tr>
                                <tr class="item">
                                    <td><em>企业类型：</em>${userCertification.typeText!''}</td>
                                </tr>
                               </#if>
                                <tr class="item">
                                    <td><em>联系人姓名：</em>*${user.contactName?substring(user.contactName?length-1) }</td>
                                </tr>
                                <tr class="item">
                                    <td><em>手机号：</em>*******${user.contactMobile?substring(user.contactMobile?length-4) }</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div><!-- member-box end --><!-- member-box end -->


    <!-- footer start -->
    <#include "./inc/footer.ftl"/>
    <!-- footer end -->
</body>
</html>