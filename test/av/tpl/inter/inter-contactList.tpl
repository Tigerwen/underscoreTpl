<header class="page-header">
    <button class="icon back cancel">取消</button>
    <p class="title">联系人</p>
</header>
<div class="common-contact page-content i18n">
    <div class="add">
        <button class="text"><span>新增联系人</span></button>
    </div>
    <ul class="content">
    <%_.each(data.contacts,function(value,key){%>
        <%if(value.id == data.contactId){%>
            <li class="contact-item selected" data-id="<%-value.id%>" data-contact-Name="<%-value.contactName%>" data-prenum="<%-value.prenum%>" data-contact-Mobile="<%-value.contactMobile%>" data-contact-Email="<%-value.contactEmail%>">
        <%}else{%>
            <li class="contact-item" data-id="<%-value.id%>" data-contact-Name="<%-value.contactName%>" data-prenum="<%-value.prenum%>" data-contact-Mobile="<%-value.contactMobile%>" data-contact-Email="<%-value.contactEmail%>">
        <%}%>
            <div class="wrap">
                <button class="i-accept"></button>
                <div class="content-info">
                    <div class="contactName"><%-value.contactName%></div>
                    <div class="contactMobile"><span class="inter-prenum">+<%-value.prenum%></span><span><%-value.safeMobile%></span></div>
                    <div class="contactEmail"><%-value.contactEmail%></div>
                </div>
                <button class="contact-edit"></button>
            </div>
            <button class="contact-delete"></button>
        </li>
    <%})%>
    </ul>
</div>