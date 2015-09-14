<%
var rootData = $.avData._clearData;
%>
<header class="page-header">
    <button class="icon back cancel">取消</button>
    <p class="title">乘机人</p>
    <button class="submit on">确定</button>
</header>
<div class="common-psger page-content">
    <div class="add">
        <button class="text"><span>新增乘机人</span></button>
    </div>
    <div class="psger-list">
        <%_.each(data.psgerList,function(value,key){%>
            <div class="psger-item<%if(value.on){%> on<%}%>" data-pindex="<%=key%>">
                <div class="psger-info">
                    <button class="i-accept"></button>
                    <div class="content">
                        <p><span class="psger-name"><%=value.psgerName%></span><span class="grey-font"><%=rootData.ticketTypes[value.ticketType]%></span></p>
                        <p class="card-info"><span class="card-type"><%=rootData.cardTypes[value.cardType]%></span><span class="card-num"><%=value.cardNum%></span></p>
                        <%if(rootData.supportInsure){%>
                            <p class="insure grey-font"><span>保险</span><span class="pr"><%=rootData.insurancePrice%> x<i><%=value.insure%>份</i></span></p>
                        <%}%>
                    </div>
                    <button class="psger-edit"></button>
                </div>
                <button class="psger-delete"></button>
            </div>
        <%})%>
    </div>
</div>