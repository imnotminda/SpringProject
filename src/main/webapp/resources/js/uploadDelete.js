$(function() {
	//전체 선택-헤제
	$('#selectAll').click(function() {
		if(this.checked) {
			$('.check').prop('checked', true);
		} else {
			$('.check').prop('checked', false);
		}
	});
	
	//선택헤제 -> 전체선택 uncheck
	$('.check').click(function() {
		if(!this.checked) {
			$('#selectAll').prop('checked', false);
		}
		if ($('.check:checked').length === $('.check').length) {
            $('#selectAll').prop('checked', true);
        }
	});

});

//선택삭제
$('#deleteBtn').click(function() {

    $.ajax({
        url: '/spring/user/uploadDelete',
        type: 'post',
        data: $('#uploadListForm').serialize(), //체크된 항목만 서버로 간다
        success: function() {
            alert('이미지 삭제 완료');
            location.href = "/spring/user/uploadList";
        },      
        error: function(e) {
        	console.log(e);
        }
    });
});