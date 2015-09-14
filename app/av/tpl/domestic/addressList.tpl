<header class="page-header">
    <button class="icon cancel back">取消</button>
    <p class="title">配送地址</p>
</header>
<div class="common-address page-content">
    <div class="add">
        <button class="text"><span>新增配送地址</span></button>
    </div>
    <ul class="content">
    <%_.each(data.address,function(value,key){%>
        <%if(value.addressId == data.addressId){%>
            <li class="address-item selected" data-id="<%-value.id%>" data-address-Id="<%-value.addressId%>" data-province="<%-value.province%>" data-province-Name="<%-value.provinceName%>" data-city="<%-value.city%>" data-city-Name="<%-value.cityName%>" data-district="<%-value.district%>" data-district-Name="<%-value.districtName%>" data-detail="<%-value.detail%>" data-sjr-Address="<%-value.sjrAddress%>" data-sjr-Name="<%-value.sjrName%>" data-sjr-Phone="<%-value.sjrPhone%>" data-zipcode="<%-value.zipcode%>">
        <%}else{%>
            <li class="address-item" data-id="<%-value.id%>" data-address-Id="<%-value.addressId%>" data-province="<%-value.province%>" data-province-Name="<%-value.provinceName%>" data-city="<%-value.city%>" data-city-Name="<%-value.cityName%>" data-district="<%-value.district%>" data-district-Name="<%-value.districtName%>" data-detail="<%-value.detail%>" data-sjr-Address="<%-value.sjrAddress%>" data-sjr-Name="<%-value.sjrName%>" data-sjr-Phone="<%-value.sjrPhone%>" data-zipcode="<%-value.zipcode%>">
        <%}%>
            <div class="wrap">
                <button class="i-accept"></button>
                <div class="content-info">
                    <div class="info-top">
                        <span class="sjrname"><%-value.sjrName%></span>
                        <span class="sjrphone"><%-value.safeSjrPhone%></span>
                    </div>
                    <div><%-value.sjrAddress%></div>
                </div>
                <button class="address-edit"></button>
            </div>
            <button class="address-delete"></button>
        </li>
    <%})%>
    </ul>
    <div class="notice">该业务目前只支持国内手机号码，常用联系人中保存的国外号已被过滤不再显示。</div>
</div>