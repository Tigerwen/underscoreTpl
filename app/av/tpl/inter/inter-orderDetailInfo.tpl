<p class="title">金额详情</p>
<%var rootData = $.avData._clearData;%>
<%if(data.adultTicketCount){%>
    <div class="item ticket-info">
        <div class="type"><p>成人</p></div>
        <div class="value">
        <%if(data.adultITicketCount){%>
            <p>
                <span class="info-des">票价</span>
                <span class="count-des">x<span class="count"><%=data.adultITicketCount%></span>人</span>
                <span class="price pr"><%=rootData.preferPrice%></span>
            </p>
        <%}%>
        <%if(data.adultITicketCount != data.adultTicketCount){%>
            <p>
                <span class="info-des">票价<span class="grey">（没买保险）</span></span>
                <span class="count-des">x<span class="count"><%=(data.adultTicketCount-data.adultITicketCount)%></span>人</span>
                <span class="price pr"><%=rootData.adultPrice%></span>
            </p>
        <%}%>
            <p>
                <span class="info-des">税费</span>
                <span class="count-des">x<span class="count"><%=data.adultTicketCount%></span>人</span>
                <span class="price pr"><%=rootData.adultTax%></span>
            </p>
        </div>
    </div>
<%}%>
<%if(data.childTicketCount){%>
    <div class="item ticket-info">
        <div class="type"><p>儿童</p></div>
        <div class="value">
        <%if(data.childITicketCount){%>
            <p>
                <span class="info-des">票价</span>
                <span class="count-des">x<span class="count"><%=data.childITicketCount%></span>人</span>
                <span class="price pr"><%=rootData.childPrice%></span>
            </p>
        <%}%>
        <%if(data.childITicketCount != data.childTicketCount){%>
            <p>
                <span class="info-des">票价<span class="grey">（没买保险）</span></span>
                <span class="count-des">x<span class="count"><%=(data.childTicketCount-data.childITicketCount)%></span>人</span>
                <span class="price pr"><%=rootData.childPrice%></span>
            </p>
        <%}%>
            <p>
                <span class="info-des">税费</span>
                <span class="count-des">x<span class="count"><%=data.childTicketCount%></span>人</span>
                <span class="price pr"><%=rootData.childTax%></span>
            </p>
        </div>
    </div>
<%}%>
<%if(data.insureCount){%>
    <div class="item">
        <p>
            <span class="info-des">保险</span>
            <span class="count-des">x<span class="count"><%=data.insureCount%></span>人</span>
            <span class="pr price"><%=rootData.insurancePrice%></span>
        </p>
    </div>
<%}%>
<%if(data.expressCount){%>
    <div class="item">
        <p>
            <span class="info-des">邮寄费</span>
            <span class="count-des">x<span class="count"><%=data.expressCount%></span><i>份</i></span>
            <span class="pr price"><%=data.invoicePrice%></span>
        </p>
    </div>
<%}%>