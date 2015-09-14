<%
var rootData = $.avData._clearData;
function formateCard(type,num){
    if(type == 'NI'){
        num += '';
        return num.slice(0, 6) + ' ' + num.slice(6, 14) + ' ' + num.slice(14);
    }
    return num;
};
%>
<li class="form-psger form-wrap" data-index="<%=data.cIndex%>">
    <button class="form-delete"></button>
    <div class="form-content">
        <button class="form-delete-icon"></button>
        <button class="icon-arrow_right"></button>
        <p>
            <span class="type name"><%=data.psgerName%></span>
            <span class="value grey-font"><%=rootData.ageTypes[data.ageType]%></span>
        </p>
        <p><span class="type card-type"><%=rootData.cardTypes[data.cardType]%></span><span class="value"><%=formateCard(data.cardType,data.cardNum)%></span></p>
        <%if(rootData.supportInsure){%>
            <p class="insure grey-font"><span class="type">航意险</span><span class="value"><span class="pr"><%=rootData.insurancePrice%></span>&nbsp;<em>x<%=data.insure%>份</em></span></p>
        <%}%>
        <%if(rootData.delayInsurePrice){%>
            <p class="delayInsure grey-font"><span class="type">延误险</span><span class="value"><span class="pr"><%=rootData.delayInsurePrice%></span>&nbsp;<em>x<%=data.delayInsure%>份</em></span></p>
        <%}%>
    </div>
</li>