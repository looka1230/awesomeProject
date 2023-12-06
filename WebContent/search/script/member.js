/**
 * 
 */

function loginCheck(form) {
	if(form.id.value == "") {
		alert("id를 입력해주세요");
		form.id.value.focus();
		return false;
	}
	else if(form.password.value == "") {
		alert("password를 입력해주세요");
		form.password.value.focus();
		return false;
	} else {
		return true;
	}
}


function joinCheck(form) {
	
	if (form.id.value == "") {
		alert("아이디를 입력해주세요.");
		form.id.focus();
		return false;
	}
	else if (form.id.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		form.id.focus();
		return false;
	}
	else if (form.password.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.password.focus();
		return false;
	}
	
	else if (form.name.value == "") {
		alert("이름을 입력해주세요.");
		form.name.focus();
		return false;
	}

	

	else if (form.nickname.value == "") {
		alert("닉네임을 입력해주세요.");
		form.nickname.focus();
		return false;
	}
	else if (form.gender.value == "성별") {
		alert("성별을 선택해주세요.");
		form.gender.focus();
		return false;
	}
	else if (form.email.value == "") {
		alert("이메일을 입력해주세요.");
		form.email.focus();
		return false;
	}
	else if (form.mem_class.value == "구분") {
		alert("해당되는 회원을 선택해주세요.");
		form.mem_class.focus();
		return false;
	}
	else{
		return true;
	}
/*
	if (form.pwdpwd.value == "") {
		alert("비밀번호를 확인해주세요.");
		form.pwdpwd.focus();
		return false;
	}


	if (form.reid.value == "") {
		alert("아이디 중복체크를 하지 않았습니다.");
		return false;
	}

	if (document.joinform.pwd.value != document.joinform.pwdpwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.joinform.pwdpwd.focus();
		return false;
	}*/

	return true;
}

function idCheck() {
	// 사용자 아이디가 입력되었는지 확인 루틴 구현
	if (document.joinform.userid.value == "") {
		alert("사용자 아이디를 입력해주세요.");
		document.joinform.userid.focus();
		return false;
	}
	// 아이디 중복 체크를 위한 페이지는 새로운 창에 출력한다.(idcheck.jsp)
	var url = "idCheck.do?userid=" + document.joinform.userid.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}
//idCheck.jsp에서 사용 버튼 클릭으로 함수 실행
function idOk(){
	opener.joinform.userid.value = document.frm.userid.value;
	opener.joinform.reid.value = document.frm.userid.value;
	
	self.close();
}
