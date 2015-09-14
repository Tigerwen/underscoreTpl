<%
var rootData = $.avData._clearData;
%>
<header class="page-header">
    <button class="icon back cancel">取消</button>
    <p class="title"><%=data.title%></p>
    <button class="submit<%if(data.showBtn){%> on<%}%>">完成</button>
</header>
<%data = data.psgerData;%>
<div class="edit-psger">
    <div class="edit-content i18n">
        <div class="item lastname">
            <div class="label has-icon">姓(英文)<button class="icons icons-help"></button></div>
            <div class="value err-wrap">
                <input type="text" class="psgname err-text" placeholder="Last Name，如HAN" data-type="lastName" value="<%=data.lastName%>" />
                <p class="err-info"></p>
            </div>
        </div>
        <div class="item firstname">
            <div class="label has-icon">名(英文)<button class="icons icons-help"></button></div>
            <div class="value err-wrap">
                <input type="text" class="psgname err-text" placeholder="First Name，如MEIMEI" data-type="firstName" value="<%=data.firstName%>" />
                <p class="err-info"></p>
            </div>
        </div>
        <div class="item ticketType">
            <div class="label">乘机人类型</div>
            <div class="value item-select" data-type="ticketType">
                <%_.each(rootData.ticketTypes,function(value,key){%>
                    <div class="options<%if(key == data.ticketType){%> selected<%}%>" data-value="<%=key%>"><%=value.replace('票','')%></div>
                <%})%>
            </div>
        </div>
        <div class="item gender">
            <div class="label">性别</div>
            <div class="value item-select" data-type="gender">
                <%if(data.gender == 1){%>
                    <div class="options selected" data-value="1">男</div>
                    <div class="options" data-value="2">女</div>
                <%}else{%>
                    <div class="options" data-value="1">男</div>
                    <div class="options selected" data-value="2">女</div>
                <%}%>
            </div>
        </div>
        <div class="item birthday">
            <div class="label">出生日期</div>
            <div class="value simulator-dateSelect" data-date="<%-(data.birthday||'1980-01-01')%>" data-type="birthday" data-maxdate="<%data.today%>" data-selectid="birthdaySelect"><span class="tags"><%if(!data.birthday){%><span class="grey">1980-01-01</span><%}else{%><%=data.birthday%><%}%></span><span class="icons icons-arrow_right"></span></div>
        </div>
        <div class="item citizenship country">
            <div class="label">国籍</div>
            <div class="value" data-type="citizenship">
                <span class="tag"><%=data.citizenshipDes%></span>
                <span class="icons icons-arrow_right"></span>
            </div>
        </div>
        <div class="item card-info">
            <div class="label has-icon simulator-select"><span class="tag"><%=rootData.cardTypes[data.cardType]%></span><span class="icons icons-arrow_bottom"></span>
                <div class="simulator-select-group">
                <%_.each(rootData.cardTypes,function(value,key){%>
                    <div class="simulator-select-item<%if(key == data.cardType){%> selected<%}%>" data-value="<%=key%>"><%=value%></div>
                <%})%>
                </div>
            </div>
            <div class="value err-wrap">
                <input type="text" class="card-num err-text" placeholder="证件号码" value="<%=data.cardNum%>" data-type="cardNum" />
                <p class="err-info"></p>
            </div>
        </div>
        <div class="item cardValidity">
            <div class="label">证件有效期</div>
            <div class="value simulator-dateSelect" data-date="<%-(data.cardValidity||'2020-01-01')%>" data-type="cardValidity" data-selectid="cardValiditySelect"><span class="tags"><%if(!data.cardValidity){%><span class="grey">2020-01-01</span><%}else{%><%=data.cardValidity%><%}%></span><span class="icons icons-arrow_right"></span></div>
        </div>
        <div class="item cardAssign country">
            <div class="label">证件签发地</div>
            <div class="value" data-type="cardAssign">
                <span class="tag"><%=data.cardAssignDes%></span>
                <span class="icons icons-arrow_right"></span>
            </div>
        </div>
        <%if(rootData.supportInsure){%>
        	<div class="item insure">
	            <div class="label has-icon">保险<button class="icons icons-help"></button></div>
	            <div class="value">
	                <span class="tag pr"><%=rootData.insurancePrice*data.insure%></span>
	                <span class="count-select off" data-selected="<%=rootData.insurancesAr.indexOf(data.insure)%>" data-type="insure" data-price="<%=rootData.insurancePrice%>">
	                <%_.each(rootData.insurancesAr,function(value,index){%>
	                	<div class="select-options" data-value="<%=value%>"><%=value%></div>
	                <%})%>
	                </span>
	            </div>
	        </div>
        <%}%>
    </div>
</div>
<%if(rootData.sellChild){%>
<footer>
    <p>1. 儿童票：2周岁（含）-12周岁（不含）<br>2. 儿童及婴儿乘机需有成人陪伴，一名成人最多携带两名儿童。</p>
</footer>
<%}%>