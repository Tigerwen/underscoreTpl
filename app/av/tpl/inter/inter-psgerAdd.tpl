<%
var rootData = $.avData._clearData;
%>
<li class="form-psger form-wrap" data-index="<%=data.cIndex%>">
    <button class="form-delete"></button>
    <div class="form-content">
        <button class="form-delete-icon"></button>
        <button class="icon-arrow_right"></button>
        <p>
            <span class="type name"><%=data.psgerName%></span>
            <span class="value grey-font"><%=rootData.ticketTypes[data.ticketType]%></span>
        </p>
        <p><span class="type card-type"><%=rootData.cardTypes[data.cardType]%></span><span class="value"><%=data.cardNum%></span></p>
        <%if(rootData.supportInsure){%>
            <p class="insure grey-font"><span class="type">保险</span><span class="value"><span class="pr"><%=rootData.insurancePrice%></span>&nbsp;<em>x<%=data.insure%>份</em></span></p>
        <%}%>
    </div>
</li>