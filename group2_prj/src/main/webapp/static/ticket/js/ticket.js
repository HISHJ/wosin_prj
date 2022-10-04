var isTicketRunning = false;

/* �뱀젙 �곗폆�ㅽ뵂�� */
function ticketOpenChk(performCd,selOpen,tmsTicketCnt,startDateTime,packageCd){
/*	var year = startDateTime.substring(0,4);
	var month = startDateTime.substring(4,6);
	var day = startDateTime.substring(6,8);
	var hour = startDateTime.substring(8,10);
	var minutes = startDateTime.substring(10,12);

	$.ajax({
        url: '/portal/member/user/nowDate.json',
        success: function(data) {
			var nowDateTime = data.nowDateTime;
			if(!(selOpen == 'Y' && tmsTicketCnt > 0 && (startDateTime <=  nowDateTime || startDateTime == '000000000000') && packageCd != 'O')){
				alert("�덈ℓ�ㅽ뵂�� "+year+"�� "+month+"�� "+day+"�� "+hour+":"+minutes+" 遺��곗엯�덈떎.");
				return false;
			}
			
			showPerformPop2(performCd);
        }
    });*/
	showPerformPop2(performCd);
}

/* TODO �뱀젙 �곗폆�ㅽ뵂�� */
function showPerformPop2(performCd) {

	if(isTicketRunning) {
		return false;
	}

	var mobileYn = "N";

	if(isMobile()) {
		mobileYn = "Y";
	}

	isTicketRunning = true;

	$.ajax({
		type: 'post',
		url: "/portal/ticket/reserve/checkPerform2.json",
		dataType: "json",
		data: {
			performCd:performCd, mobileYn:mobileYn
		},
		success: function(data) {
			if(data.erroryn == 'Y') {
				if(data.errortype == "L") {
					moveToLogin();
					return false;
				}
				alert(data.errormsg);
				return false;
			}
			//console.log(data.link);
			if(data.interparkyn == 'Y') {
				var link = data.link;
				var action = link.split('?')[0];
				var params = link.split('?')[1];
				submitForm(link, action, params);
			}
			else {
				showTicketPop(data.link);
			}
        },
		complete : function(data) {
			isTicketRunning = false;
	    }
   });
}

/**
 * 怨듭뿰 �곗폆 �덈ℓ �앹뾽
 * @param performIdx
 * @returns
 */
function showPerformPop(performCd) {

	if(isTicketRunning) {
		return false;
	}

	var mobileYn = "N";

	if(isMobile()) {
		mobileYn = "Y";
	}

	isTicketRunning = true;

	$.ajax({
		type: 'post',
		url: "/portal/ticket/reserve/checkPerform.json",
		dataType: "json",
		data: {
			performCd:performCd, mobileYn:mobileYn
		},
		success: function(data) {
			if(data.erroryn == 'Y') {
				if(data.errortype == "L") {
					moveToLogin();
					return false;
				}
				alert(data.errormsg);
				return false;
			}
			//console.log(data.link);
			if(data.interparkyn == 'Y') {
				var link = data.link;
				var action = link.split('?')[0];
				var params = link.split('?')[1];
				submitForm(link, action, params);
			}
			else {
				showTicketPop(data.link);
			}
        },
		complete : function(data) {
			isTicketRunning = false;
	    }
   });
}


/**
 * �⑦궎吏� �곗폆 �덈ℓ �앹뾽
 * @param performIdx
 * @returns
 */
function showPackagePop(performCd, pkgCd) {

	if(isTicketRunning) {
		return false;
	}

	var mobileYn = "N";

	if(isMobile()) {
		mobileYn = "Y";
	}

	isTicketRunning = true;

	$.ajax({
		type: 'post',
		url: "/portal/ticket/reserve/checkPackage.json",
		dataType: "json",
		data: {
			performCd:performCd,
			pkgCd:pkgCd,
			mobileYn:mobileYn
		},
		success: function(data) {
			if(data.erroryn == 'Y') {
				if(data.errortype == "L") {
					moveToLogin();
					return false;
				}
				alert(data.errormsg);
				return false;
			}
			//console.log(data.link);
			if(data.interparkyn == 'Y') {
				var link = data.link;
				var action = link.split('?')[0];
				var params = link.split('?')[1];
				submitForm(link, action, params);
			}
			else {
				showTicketPop(data.link);
			}
        },
		complete : function(data) {
			isTicketRunning = false;
	    }
   });
}


/**
 * 怨듭뿰 �곗폆 �덈ℓ 紐⑸줉 �앹뾽
 * @param performIdx
 * @returns
 */
function showPerformListPop() {

	if(isTicketRunning) {
		return false;
	}

	var mobileYn = "N";

	if(isMobile()) {
		mobileYn = "Y";
	}

	isTicketRunning = true;

	$.ajax({
		type: 'post',
		url: "/portal/ticket/reserve/checkPerformList.json",
		dataType: "json",
		data: { mobileYn:mobileYn },
		success: function(data) {
			if(data.erroryn == 'Y') {
				if(data.errortype == "L") {
					moveToLogin();
					return false;
				}
				alert(data.errormsg);
				return false;
			}
			showTicketPop(data.link);
        },
		complete : function(data) {
			isTicketRunning = false;
	    }
   });
}


/**
 * �⑦궎吏� �곗폆 �덈ℓ 紐⑸줉 �앹뾽
 * @param performIdx
 * @returns
 */
function showPackageListPop() {

	if(isTicketRunning) {
		return false;
	}

	var mobileYn = "N";

	if(isMobile()) {
		mobileYn = "Y";
	}

	isTicketRunning = true;

	$.ajax({
		type: 'post',
		url: "/portal/ticket/reserve/checkPackageList.json",
		dataType: "json",
		data: {mobileYn:mobileYn},
		success: function(data) {
			if(data.erroryn == 'Y') {
				if(data.errortype == "L") {
					moveToLogin();
					return false;
				}
				alert(data.errormsg);
				return false;
			}
			showTicketPop(data.link);
        },
		complete : function(data) {
			isTicketRunning = false;
	    }
   });
}

function submitForm(link, action, params) {
	var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", action);

    for(var i = 0; i < params.split('&').length; i++) {
    	paramSet = params.split('&')[i].split('=');
    	var key = "";
    	var value = "";
    	if(paramSet.length > 0) {
    		key = paramSet[0];
    	}
    	if(paramSet.length > 1) {
    		value = paramSet[1];
    	}

        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", value);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

function showTicketPop(link) {
	window.open(link, "callBook", "resizable=yes, status=no, scrollbars=yes, toolbar=no, menubar=no, width=1000, height=930");
}

function moveToLogin() {
	location.href="/portal/member/user/forLogin.do?menuNo=200100&returnUrl="+encodeURIComponent(window.location.href);
}

function isMobile() {
	var isMobile = false;
	var userAgent = navigator.userAgent.toLowerCase();
	var mobileAgent = ['iphone','ipad','ipod','android','blackberry','windows ce','nokia','webos','opera mini','sonyericsson','opera mobi','iemobile'];
	var chklen = mobileAgent.length;

	for(i=0; i < chklen; i++){
		if(userAgent.indexOf(mobileAgent[i]) > -1){
			isMobile = true;
			break;
		}
	}

	return isMobile;

}