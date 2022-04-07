function unique(array) {
	var result = [];
	//중복처리 부분
	$.each(array, function(index, element) {
		if ($.inArray(element, result) == -1)
			result.push(element);
	});

	return result;
}

function tostring(array) {
	//값 넘겨주기 부분
	var resultString = "";
	$.each(array, function(index, element) {
		resultString = resultString + "," + element;
	});
	return resultString;
}

$(function() {
	var pat_selectedCust = [];
	var emp_selectedCust = [];

	$(".selectable").selectable({
		filter : '.info',
		selected : function(evnet, ui) {
			
			$(ui.selected).find(".pat_id").each(function() {
				pat_selectedCust.push($(this).text());
				console.log($(this).text());
			});

			$(ui.selected).find(".emp_id").each(function() {
				emp_selectedCust.push($(this).text());
				console.log($(this).text());
			});
		},
		unselected : function(evnet, ui) {
			$(ui.unselected).find(".pat_id").each(function() {
				var idx = pat_selectedCust.indexOf($(this).text());
				pat_selectedCust.splice(idx, 1);
			});

			$(ui.unselected).find(".emp_id").each(function() {
				var idx = emp_selectedCust.indexOf($(this).text());
				emp_selectedCust.splice(idx, 1);
			});
		}
	});


	$("#deletebtn").on(
			'click',
			function() {
				var pat_size = 0;
				var emp_size = 0;

				pat_size = unique(pat_selectedCust).length;
				emp_size = unique(emp_selectedCust).length;

				console.log(emp_size);
				$("[name=pat_ids]").val(tostring(unique(pat_selectedCust)));
				$("[name=emp_ids]").val(tostring(unique(emp_selectedCust)));

				if (emp_size == 0 && pat_size == 0) {
					alert("삭제하실 회원을 선택해주세요.");
					return false;
				}

				var result = confirm('정말 회원  ' + pat_size + '명,' + '의료진 : '
						+ emp_size + '명을 정말 삭제 하시겠습니까?');
				if (result) {
					$("#deletebtn").submit();
					alert("삭제되었습니다.");
				} else {
					alert("취소되었습니다.");
				}
			});
});