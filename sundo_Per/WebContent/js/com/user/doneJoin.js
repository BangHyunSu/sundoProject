/**
******************************************************************************************
*** 파일명    : doneJoin.js
*** 설명      : 회원가입 - 가입완료
***
*** -----------------------------    Modified Log   --------------------------------------
*** ver             date                author                  description
*** --------------------------------------------------------------------------------------
*** 1.0         2023.03.14              LSH
******************************************************************************************
**/
$(function() {
	// 메인으로 가기
	$('#btnMain').bind('click', function() {
		goUrl( getUrl('/usr/main/main.do') );
		return false;
	});
	// 로그인하기
	$('#btnLogin').bind('click', function() {
		goUrl( getUrl('/com/common/login.do') );
		return false;
	});
});
