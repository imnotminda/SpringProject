$(function() {

	//아이디 중복 체크
	$('#id').focusout(function(){
		$('#idDiv').empty();
		
		if($('#id').val() == '')
			$('#idDiv').html('아이디를 먼저 입력하세요').css('color','red');
		else
			$.ajax({
			type: 'post',
			url:'/spring/user/checkId',
			data: 'id=' + $('#id').val(),
			dataType: 'text',
			success: function(data){
				if(data.trim() == 'exist'){
					$('#idDiv').html('사용 불가능').css('color','red');
				} else {
					$('#idDiv').html('사용 가능').css('color','blue');
				}
			},
			error: function(e){
				console.log(e);
			}
		});
	});
	
	//회원가입
	$('#writeBtn').click(function(){
		$('#nameDiv').empty();
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#name').val() == '')
			$('#nameDiv').html('이름을 입력하세요.');
		else if($('#id').val() == '')
			$('#idDiv').html('아이디를 입력하세요.');
		else if($('#pwd').val() == '')
			$('#pwdDiv').html('비밀번호를 입력하세요.');
		else
			$.ajax({
			type: 'post',
			url:'/spring/user/write',
			data: $('#writeForm').serialize(),
			success: function(){
				alert('회원가입 완료')
				location.href = '/spring/user/list';
			},
			error: function(e){
				console.log(e);
			}
		});
	});

});