<header class="page-header">
    <button class="icon back cancel">取消</button>
    <p class="title"><%=data.title%></p>
    <button class="submit<%if(data.showBtn){%> on<%}%>">完成</button>
</header>
<%var data = data.address;%>
<div class="edit-content">
    <div class="item name">
        <div class="label">姓名</span></div>
        <div class="value err-wrap">
            <input type="text" class="err-text" placeholder="收件人姓名" data-type="sjrName" value="<%=data.sjrName%>" />
            <p class="err-info"></p>
        </div>
    </div>
    <div class="item mobile">
        <div class="label">手机</div>
        <div class="value err-wrap">
            <input type="text" class="err-text" placeholder="收件人手机号" data-type="sjrPhone" value="<%=data.sjrPhone%>" />
            <p class="err-info"></p>
        </div>
    </div>
    <div class="item clearFloat">
        <button class="label">城市</button>
        <div class="value addressSelect" data-address="<%=(data.sjrAddress)%>" data-type="addressInfo" data-province="<%=data.province%>" data-city="<%=data.city%>" data-district="<%=data.district%>">
            <%
            var str = [data.provinceName,data.cityName,data.districtName].join(' ');
            if(str.length > 3){
            %>
            <span class="tags"><%=str%></span>
            <%}else{%>
            <span class="tags"><p>请选择省/市/区</p></span>
            <%}%>
            <button class="icons icons-arrow_right"></button>
        </div>
    </div>
    <div class="item detailInfo clearFloat">
        <button class="label">地址</button>
        <div class="value">
            <textarea class="detail text-edit" placeholder="乡镇/村/街道" data-type="detail"><%=data.detail%></textarea>
        </div>
    </div>
    <div class="item">
        <div class="label">邮编</div>
        <div class="value err-wrap">
            <input type="text" class="err-text" placeholder="选填" maxlength="6" data-type="zipcode" value="<%=data.zipcode%>" />
            <p class="err-info"></p>
        </div>
    </div>
</div>