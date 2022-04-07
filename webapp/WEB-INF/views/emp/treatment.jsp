<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>진단서</title>
		<style>
			.treatment {
				width:100%; height:100%;
			}
			.treatment tr {
				height:45px;
			}
			.treatment th {
				width:120px;
			}
			.treatment td {
				padding-left:20px;
			}
			.cont {
				height:180px;
			}
			#btnPrint, #btnCancel {
				width:100px;
				margin:10px; padding:3px;
				color:white; background-color:gray;
			}
			#btnPrint {
				margin-left:200px;
			}
			#btnCancel {
				margin-left:80px;
			}
		</style>
		<script src="https://code.jquery.com/jquery.min.js"></script>
		<script>
			$(function() {
				// opener로부터 값 가져오기
				document.getElementById("trt_name").innerText = opener.document.getElementsByClassName("pat_name")[0].defaultValue;
				document.getElementById("trt_tel").innerText = opener.document.getElementsByClassName("pat_tel")[0].defaultValue;
				document.getElementById("trt_address").innerText = opener.document.getElementsByClassName("pat_address")[0].defaultValue;
				document.getElementById("trt_email").innerText = opener.document.getElementsByClassName("pat_email")[0].defaultValue;
				document.getElementById("trt_gender").innerText = opener.document.getElementsByClassName("pat_gender")[0].defaultValue;
				document.getElementById("trt_date").innerText = opener.document.getElementsByClassName("trt_date")[0].defaultValue;
				document.getElementById("trt_conts").innerText = opener.document.getElementsByClassName("emp_conts")[0].defaultValue;
				document.getElementById("trt_emp").innerText = opener.document.getElementsByClassName("emp_name")[0].defaultValue;
				document.getElementById("trt_dept").innerText = opener.document.getElementsByClassName("dept_name")[0].defaultValue;
				
				// 출력버튼 클릭
				$("#btnPrint").click(function() {
					window.print();
				});
				
				// 닫기버튼 클릭
				$("#btnCancel").click(function() {
					opener.document.getElementsByClassName("pat_name")[0].className = "";
					opener.document.getElementsByClassName("pat_tel")[0].className = "";
					opener.document.getElementsByClassName("pat_address")[0].className = "";
					opener.document.getElementsByClassName("pat_email")[0].className = "";
					opener.document.getElementsByClassName("pat_gender")[0].className = "";
					opener.document.getElementsByClassName("trt_date")[0].className = "";
					opener.document.getElementsByClassName("emp_conts")[0].className = "";
					opener.document.getElementsByClassName("emp_name")[0].className = "";
					opener.document.getElementsByClassName("dept_name")[0].className = "";
					
					window.close();
				});
				
				window.onunload = function() {
					opener.document.getElementsByClassName("pat_name")[0].className = "";
					opener.document.getElementsByClassName("pat_tel")[0].className = "";
					opener.document.getElementsByClassName("pat_address")[0].className = "";
					opener.document.getElementsByClassName("pat_email")[0].className = "";
					opener.document.getElementsByClassName("pat_gender")[0].className = "";
					opener.document.getElementsByClassName("trt_date")[0].className = "";
					opener.document.getElementsByClassName("emp_conts")[0].className = "";
					opener.document.getElementsByClassName("emp_name")[0].className = "";
					opener.document.getElementsByClassName("dept_name")[0].className = "";
					
					window.close();
				}
			});
		</script>
	</head>
	<body>
		<div>
			<p style="margin-left:20px; font-weight:bold">진단서</p>
			<table border="1" cellpadding="0" cellspacing="0" class="treatment">
				<tr >
					<th colspan="2">이름</th>
					<td colspan="2" id="trt_name"></td>
				</tr>
				<tr>
					<th colspan="2">진단일</th>
					<td colspan="2" id="trt_date"></td>
				</tr>
				<tr>
					<th colspan="2">성별</th>
					<td colspan="2" id="trt_gender"></td>
				</tr>
				<tr>
					<th colspan="2">연락처</th>
					<td colspan="2" id="trt_tel"></td>
				</tr>
				<tr>
					<th colspan="2">이메일</th>
					<td colspan="2" id="trt_email"></td>
				</tr>
				<tr>
					<th colspan="2">주소</th>
					<td colspan="2" id="trt_address"></td>
				</tr>
				<tr>
					<th colspan="2" class="cont">진단내용</th>
					<td colspan="2" id="trt_conts" class="cont"></td>
				</tr>
				<tr>
					<th>의료진부서</th>
					<td id="trt_dept"></td>
					<th>진단자</th>
					<td id="trt_emp"></td>					
				</tr>
			</table>
			
			<input type="button" value="출력" id="btnPrint"/>
			<input type="button" value="닫기" id="btnCancel"/>
		</div>
	</body>
</html>