function loginchk() {
    const form = document.login_form;
    const chkUserID = checkValidUserID(form);
    const chkPw = checkValidPassword(form);

    if (chkUserID) {
        document.getElementById('alert_userID').innerText = "";
        form.userID.style.border = '2px solid';
        form.userID.style.borderColor = '#00D000';
    } else {
        form.userID.style.border = '2px solid';
        form.userID.style.borderColor = '#FF0000';
        document.getElementById('alert_userID').style.color = '#FF0000';
    }
    if (chkPw) {
        document.getElementById('alert_userPassword').innerText = "";
        form.userPassword.style.border = '2px solid';
        form.userPassword.style.borderColor = '#00D000';
    } else {
        form.userPassword.style.border = '2px solid';
        form.userPassword.style.borderColor = '#FF0000';
        document.getElementById('alert_userPassword').style.color = '#FF0000';
    }

    
    if (chkUserID && chkPw) {
        form.submit();
    }
}
function checkValidUserID(form) {
    if (form.userID.value == "") {
        document.getElementById('alert_userID').innerText = "Please enter userid.";
        //form.userID.focus();
        return false;
    }
    const id = form.userID.value;
        // String.prototype.search() :: 검색된 문자열 중에 첫 번째로 매치되는 것의 인덱스를 반환한다. 찾지 못하면 -1 을 반환한다.

	const spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if (id.length < 4) {
        // 최소 4문자.
        document.getElementById('alert_userID').innerText = "ID를 4자 이상 입력해주세요.";
        return false;
    } else if (id.search(/\s/) != -1) {
        // 공백 제거.
        document.getElementById('alert_userID').innerText = "ID에 공백이 존재합니다.";
        return false;
    }  else if (spe > 0) {
		// 특수문자 입력 방지.
		document.getElementById('alert_userID').innerText = "유효하지 않은 ID 입니다. 숫자와 영문으로만 기입해주세요";
        return false;
}
    return true;
}
    function checkValidPassword(form) {
        if (form.userPassword.value == "") {
            document.getElementById('alert_userPassword').innerText = "Please enter password.";
            //form.password.focus();
            return false;
        }
    

    const pw = form.userPassword.value;
    // String.prototype.search() :: 검색된 문자열 중에 첫 번째로 매치되는 것의 인덱스를 반환한다. 찾지 못하면 -1 을 반환한다.
    // number
    const num = pw.search(/[0-9]/g);
    // alphabet
    const eng = pw.search(/[a-z]/ig);
    // special characters
    const spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    if (pw.length < 8) {
        // 최소 8문자.
        document.getElementById('alert_userPassword').innerText = "비밀번호를 8자 이상 입력해주세요";
        return false;
    } else if (pw.search(/\s/) != -1) {
        // 공백 제거.
        document.getElementById('alert_userPassword').innerText = "비밀번호에 공백이 존재합니다.";
        return false;
    } else if ( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ) {
        // 숫자, 영어, 특수문자 중 2개 조합.
        document.getElementById('alert_userPassword').innerText = "영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.";
        return false;
}
    return true;
}

