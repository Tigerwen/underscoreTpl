<header class="page-header">
    <button class="icon back cancel">取消</button>
    <p class="title"><%=data.title%></p>
    <button class="submit<%if(data.showBtn){%> on<%}%>">完成</button>
</header>
<%var data = data.contact;%>
<div class="edit-content">
    <div class="item name">
        <div class="label">姓名</span></div>
        <div class="value err-wrap">
            <input type="text" class="err-text" placeholder="联系人姓名" data-type="contactName" value="<%=data.contactName%>" />
            <p class="err-info"></p>
        </div>
    </div>
    <div class="item prenum">
        <div class="label">国家区号</div>
        <div class="value">
            <span class="tag">+<%=data.prenum%></span>
        </div>
        <span class="icons icons-arrow_right"></span>
    </div>
    <div class="item mobile">
        <div class="label">手机号</div>
        <div class="value err-wrap">
            <input type="text" class="err-text" placeholder="接收航班短信" data-type="contactMobile" value="<%=data.contactMobile%>" />
            <p class="err-info"></p>
        </div>
    </div>
    <div class="item email">
        <div class="label">邮箱</div>
        <div class="value err-wrap">
            <input type="text" class="err-text" placeholder="接收航班邮件" data-type="contactEmail" value="<%=data.contactEmail%>" />
            <p class="err-info"></p>
        </div>
    </div>
</div>