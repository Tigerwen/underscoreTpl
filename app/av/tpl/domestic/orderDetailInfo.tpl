<%var rootData = $.avData._clearData;%>
<p class="title">金额详情</p>
<%if(data.adultTicketCount){%>
    <div class="item ticket-info">
        <div class="type"><p>成人</p></div>
        <div class="value">
        <%if(data.adultITicketCount){%>
            <p>
                <span class="info-des">票价</span>
                <span class="count-des">x<span class="count"><%=data.adultITicketCount%></span>人</span>
                <span class="price pr"><%=rootData.priceTag.NI%></span>
            </p>
        <%}%>
        <%if(data.adultITicketCount != data.adultTicketCount){%>
            <p>
                <span class="info-des">票价<span class="grey">（没买保险）</span></span>
                <span class="count-des">x<span class="count"><%=(data.adultTicketCount-data.adultITicketCount)%></span>人</span>
                <span class="price pr"><%=rootData.priceTag.N%></span>
            </p>
        <%}%>
            <p>
                <span class="info-des">机建+燃油</span>
                <span class="count-des">x<span class="count"><%=data.adultTicketCount%></span>人</span>
                <span class="price pr"><%=rootData.constructionFee%></span>
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
                <span class="price pr"><%=rootData.priceTag.CI%></span>
            </p>
        <%}%>
        <%if(data.childITicketCount != data.childTicketCount){%>
            <p>
                <span class="info-des">票价<span class="grey">（没买保险）</span></span>
                <span class="count-des">x<span class="count"><%=(data.childTicketCount-data.childITicketCount)%></span>人</span>
                <span class="price pr"><%=rootData.priceTag.C%></span>
            </p>
        <%}%>
            <p>
                <span class="info-des">机建+燃油</span>
                <span class="count-des">x<span class="count"><%=data.childTicketCount%></span>人</span>
                <span class="price pr"><%=rootData.childConstructionFee%></span>
            </p>
        </div>
    </div>
<%}%>
<%if(data.insureCount){%>
    <div class="item">
        <p>
            <span class="info-des">航空意外险</span>
            <span class="count-des">x<span class="count"><%=data.insureCount%></span>份</span>
            <span class="pr price"><%=rootData.insurancePrice%></span>
        </p>
    </div>
<%}%>
<%if(data.delayInsureCount){%>
    <div class="item">
        <p>
            <span class="info-des">航空延误险</span>
            <span class="count-des">x<span class="count"><%=data.delayInsureCount%></span>份</span>
            <span class="pr price"><%=rootData.delayInsurePrice%></span>
        </p>
    </div>
<%}%>
<%if(data.xjlCount){%>
    <div class="item">
        <p>
            <span class="info-des">大礼包</span>
            <span class="count-des">x<span class="count"><%=data.xjlCount%></span>份</span>
            <span class="pr price"><%=data.xjlPrice%></span>
            <span class="minus">-</span>
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