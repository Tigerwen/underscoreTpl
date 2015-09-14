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
    <div class="edit-content<%if(data.cardType == 'NI'){%> hide-info<%}%>">
        <div class="item username">
            <div class="label has-icon">姓名<button class="icons icons-help"></button></div>
            <div class="value err-wrap">
                <input type="text" class="psgname err-text" placeholder="与乘机证件一致" data-type="psgerName" value="<%=data.psgerName%>" />
                <p class="err-info"></p>
            </div>
        </div>
        <div class="item cardType">
            <div class="label">证件类型</div>
            <div class="value simulator-select" data-selectid="cardTypeSelect">
            	<span class="tag"><%=rootData.cardTypes[data.cardType]%></span>
                <span class="icons icons-arrow_right"></span>
            	<div class="simulator-select-group" data-type="cardType">
            	<%_.each(rootData.cardTypes,function(value,key){%>
            		<div class="simulator-select-item<%if(key == data.cardType){%> selected<%}%>" data-value="<%=key%>"><%=value%></div>
            	<%})%>
                </div>
            </div>
        </div>
        <div class="item cardNum">
            <div class="label">证件号码</div>
            <div class="value err-wrap">
                <input type="text" class="err-text" placeholder="与乘机证件一致" data-type="cardNum" value="<%=data.cardNum%>" />
                <p class="err-info"></p>
            </div>
        </div>
        <div class="item birthday">
            <div class="label">出生日期</div>
            <div class="value simulator-dateSelect" data-date="<%=(data.birthday||'1980-01-01')%>" data-type="birthday" data-maxdate="<%data.today%>" data-selectid="birthdaySelect"><span class="tags"><%if(!data.birthday){%><span class="grey">1980-01-01</span><%}else{%><%=data.birthday%><%}%></span><span class="icons icons-arrow_right"></span></div>
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
        <%if(rootData.supportInsure){%>
        	<div class="item insure<%if(rootData.accidentBonus && data.ageType == 0){%> hide-item<%}%>">
	            <div class="label has-icon">航意险<button class="icons icons-help"></button></div>
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
        <%if(rootData.delayInsurePrice){%>
        	<div class="item delayInsure<%if(rootData.delayBonus && data.ageType == 0){%> hide-item<%}%>">
	            <div class="label has-icon">延误险<button class="icons icons-help"></button></div>
	            <div class="value">
	                <span class="tag pr"><%=rootData.delayInsurePrice*data.delayInsure%></span>
	                <span class="count-select off" data-selected="<%=rootData.delayInsureAr.indexOf(data.delayInsure)%>" data-type="delayInsure" data-price="<%=rootData.delayInsurePrice%>">
	                <%_.each(rootData.delayInsureAr,function(value,index){%>
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