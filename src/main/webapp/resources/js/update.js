$(function() {
	
	//회원정보 수정
	$('#updateBtn').click(function(){
		$('#nameDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#name').val() == '')
			$('#nameDiv').html('수정할 이름을 입력하세요.');
		else if($('#pwd').val() == '')
			$('#pwdDiv').html('수정할 비밀번호를 입력하세요.');
		else
			$.ajax({
			type: 'post',
			url:'/spring/user/update',
			data: $('#updateForm').serialize(),
			success: function(){
				alert('회원정보 수정 완료')
				location.href = '/spring/user/list?pg=' + $('#pg').val();
			},
			error: function(e){
				console.log(e);
			}
		});
	});
	
	
	//회원정보 수정
	$('#deleteBtn').click(function(){
		$('#nameDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#name').val() == '')
			$('#nameDiv').html('수정할 이름을 입력하세요.');
		else if($('#pwd').val() == '')
			$('#pwdDiv').html('수정할 비밀번호를 입력하세요.');
		else
			$.ajax({
			type: 'post',
			url:'/spring/user/checkDeleteInfo',
			data: $('#updateForm').serialize(),
			success: function(){
				alert('회원정보 수정 완료')
				location.href = '/spring/user/list?pg=' + $('#pg').val();
			},
			error: function(e){
				console.log(e);
			}
		});
	});
	
	//회원탈퇴수정
	$('#deleteBtn').click(function(){
		$('#nameDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#name').val() == '')
			$('#nameDiv').html('이름을 입력하세요.');
		else if($('#pwd').val() == '')
			alert('탈퇴하려면 비밀번호를 입력하세요.');
		else
			$.ajax({
			type: 'post',
			url:'/spring/user/delete',
			data: $('#updateForm').serialize(),
			success: function(){
				let choice = confirm('정말 탈퇴 하시겠습니까?')
				if(choice) {
					alert('성공적으로 탈퇴되었습니다.')
					location.href = '/spring/user/list';
				} else {
					alert('다시 작성해주세요.');
					 document.getElementById('updateForm').reset();
            	}
			},
			error: function(e){
				console.log(e);
			}
		});
	});

});