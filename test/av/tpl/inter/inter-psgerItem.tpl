<%
var rootData = $.avData._clearData;
%>
<div class="psger-item on" data-pindex="<%=data.index%>" data-pid="<%=data.psger.pid%>" data-certid="<%=data.psger.certid%>">
    <div class="psger-info">
        <button class="i-accept"></button>
        <div class="content">
            <p><span class="psger-name"><%=data.psger.psgerName%></span><span class="grey-font"><%=rootData.ticketTypes[data.psger.ticketType]%></span></p>
            <p class="card-info"><span class="card-type"><%=rootData.cardTypes[data.psger.cardType]%></span><span class="card-num"><%=data.psger.cardNum%></span></p>
            <%if(rootData.supportInsure){%>
                <p class="insure grey-font"><span>保险</span><span class="pr"><%=rootData.insurancePrice%> x<i><%=data.psger.insure%>份</i></span></p>
            <%}%>
        </div>
        <button class="psger-edit"></button>
    </div>
    <button class="psger-delete"></button>
</div>