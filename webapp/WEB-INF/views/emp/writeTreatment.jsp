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
            height:250px;
         }
         #btnOk, #btnCancel {
            width:100px;
            margin:10px; padding:3px;
            color:white; background-color:gray;
         }
         #btnOk {
            margin-left:200px;
         }
         #btnCancel {
            margin-left:80px;
         }
      </style>
      <script src="https://code.jquery.com/jquery.min.js"></script>
      <script>
         $(function() {
            // 닫기버튼 클릭
            $("#btnCancel").click(function() {
               window.close();
            });
            
            // 제출
            $("#btnOk").click(function() {
               $("#form").submit();
               opener.location.href="/emp/home";
			   window.close();
            });
         });
      </script>
   </head>
   <body>
      <div>
         <p style="margin-left:20px; font-weight:bold">진단서</p>
         <form action="/emp/reservation/view/treatment/write/process" method="POST" id="form" data-ajax="false">
            <input type="hidden" name="pat_id" value="${ pat_id }" />
            <input type="hidden" name="emp_id" value="${ emp_id }" />
            <input type="hidden" name="res_num" value="${ res_num }" />
            
            <table border="1" cellpadding="0" cellspacing="0" class="treatment">
               <tr >
                  <th colspan="2">이름</th>
                  <td colspan="2" id="trt_name">
                     ${ patient.pat_name }
                     <input type="hidden" name="pat_name" value="${ patient.pat_name }" />
                  </td>
               </tr>
               <tr>
                  <th colspan="2">성별</th>
                  <td colspan="2" id="trt_gender">
                     ${ patient.pat_gender }
                     <input type="hidden" name="pat_gender" value="${ patient.pat_gender }" />
                  </td>
               </tr>
               <tr>
                  <th colspan="2">연락처</th>
                  <td colspan="2" id="trt_tel">
                     ${ patient.pat_tel }
                     <input type="hidden" name="pat_tel" value="${ patient.pat_tel }" />
                  </td>
               </tr>
               <tr>
                  <th colspan="2">이메일</th>
                  <td colspan="2" id="trt_email">
                     ${ patient.pat_email }
                     <input type="hidden" name="pat_email" value="${ patient.pat_email }" />
                  </td>
               </tr>
               <tr>
                  <th colspan="2">주소</th>
                  <td colspan="2" id="trt_address">
                     ${ patient.pat_address }
                     <input type="hidden" name="pat_email" value="${ patient.pat_email }" />
                  </td>
               </tr>
               <tr>
                  <th colspan="2" class="cont">진단내용</th>
                  <td colspan="2" id="trt_conts" class="cont">
                     <textarea name="emp_conts" cols="80" rows="15"></textarea>
                  </td>
               </tr>
            </table>
            
            <input type="button" value="제출" id="btnOk"/>
            <input type="button" value="닫기" id="btnCancel"/>
         </form>
      </div>
   </body>
</html>