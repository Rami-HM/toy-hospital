<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>부경대학교병원: 메뉴 & 부서 관리</title>
        <link rel="stylesheet" href="/css/adminhomePage.css"/>
        <link rel="stylesheet" href="/css/menuBar.css" type="text/css">
        <style>
        	header {
        		text-align:center;
        	}
			ul {
				list-style: none;
			}
			.main {
				cursor: e-resize;
				border : 1px solid black;
				width : 150px;
				height: 45px;
				margin:10px auto;
				padding : 10px 10px;
				border-top: solid 1px;
				border-color: #ccc;
				display: block;
				float: left;
			}
			section h1{
				padding: 10px 80px 10px 30px;
				background:#018ace;
				display:block;
				color:#fff;
			}
			#sortable li {
				margin-left: 5px;
			}
			.main:hover{
				background-color: orange;
			}
			
			.main_detail{
				width : 1000px;
				height: 500px;
			}
			
			.subme {
				cursor: n-resize;
				border : 1px solid black;
				width : 150px;
				height: 45px;
				margin:10px;
				padding : 10px 10px;
				border-top: solid 1px;
				border-color: #ccc;
				display: block;
			}
			input[type="button"]{
			width:100px;
			height:20px;
			border:2px solid #018ace;
			border-radius:5px;
			}
			input[type="button"]:first-child{
			background:#018ace;
			color:#fff;
			width:40px; font-weight:bold;}
			input[type="button"]:nth-child(2){
			background:#018ace;
			color:#fff;
			width:40px; font-weight:bold;}
			.bbtn{padding-left:10px;}
			
			input[type="text"]
			{
				padding : 5px 5px;
			}
			.subme:hover
			{
				background-color: #6C8D55;
			}
			
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src = "/js/menulist.js"></script>
        <script>
        $(function(){
        	var mainorder;

	        $("#mainupdatebtn").click(function(){ 
	        	var length = $(".main").length;
	        	
	        	for(var i=0; i<length; i++) {
	        		$(".main")[i].dataset.order = (i+1);
	        	}
	        	
	        	var menu_id_seq =[];
	        	var menu_name_seq = [];
	        	var menu_val_seq = [];
	        	console.log($(".main"));
	        	$.each($(".main"),function(index,menu){
	        		console.log($(".main")[index].children.main_id.defaultValue);
	        		menu_id_seq.push($(".main")[index].children.main_id.defaultValue);
	        		menu_name_seq.push($(".main")[index].children.menu_name.value);
	        	});

	        	$("[name = menu_id_seq]").val(menu_id_seq);
	        	$("[name = menu_name_seq]").val(menu_name_seq);
	 
	        	$("#mainmenuForm").submit();
	        });
	        
	        
	        $("#maininsertbtn").click(function(){ 
	        	$("#sortWrap").append("<li  class = 'main' data-order= '" + ($(".main").length+1) + "'>"
	        			+"<input type = 'text' 	name = 'menu_name' value ='메뉴이름' size = '12'/>"
		       			+"<input type = 'hidden'  name = 'main_id' value = 'insert' /></li>");
	        });
	        
	        $("#maindeletebtn").click(function(){ 
	        	var size = $("#sortWrap")[0].childElementCount;
	        	$("#sortWrap").children()[size-1].remove();
	        });
	        
	        
	        $("#sortWrap").sortable({
	        	containment: $("#main_drag"),
	        	update: function (event, ui) {
	        		
	        		mainorder = $(this).sortable('toArray', {
	        			attribute: 'data-order'
	        		});
	        		console.log(mainorder);
	        	}
	        });
	        
	        $("#sortWrap2").sortable({
	        	axis: "y",
	        	containment: "parent",
	        	update: function (event, ui) {
	        		var order = $(this).sortable('toArray', {
	        			attribute: 'data-order'
	        		});
	        	}
	        });
	        
	        $(".main").on("click",function(){
	        	
	        	$("#sortWrap2 *").remove();
	        	$("#mainname").html($(this)[0].childNodes[1].defaultValue);

	        	console.log('-----');
	        	console.log($(this).find($("[name=main_id]")).val());
	        		$.ajax({
	        			url		:	'/getmenudetail',
	        			type 	: 	'POST',
	        			data 	: 
	        			{
	        				menu_id : $(this).find($("[name=main_id]")).val()
	        			},
	        			success : 	function(data)
	        			{
	        				var jsondata = JSON.parse(data);
	        				$.each(jsondata.subList,function(index,submenu){
	        					$("#sortWrap2").append("<li class = 'subme' data-order ="+ submenu.sub_seq + ">"  + 
	        							"<input type = 'text' name = 'sub_name' size = '12' value = '"+ submenu.sub_name +"' />" +
	        							"<input type = 'hidden' name = 'sub_id' value = '"+ submenu.sub_id +"' />" +
	        							"</li>");
	        				});
	        				$("[name = main_menu_id]").val(jsondata.menu_id);
	        			},
	        			error	 : function(xhr)
	        			{
							alert(xhr.status + " : " + xhr.statusText);
						}
	        	}); 
	        });
	       
	        $("#subupdatebtn").click(function(){ 
	        	var length = $(".subme").length;
	        	
	        	for(var i=0; i<length; i++) {
	        		$(".subme")[i].dataset.order = (i+1);
	        	}
	        	
	        	console.log($(".subme"));
	        	
	        	var sub_id_seq =[];
	        	var sub_name_seq = [];
	        	var sub_val_seq = [];
	        	console.log($(".subme"));
	        	$.each($(".subme"),function(index,menu){
	        		sub_id_seq.push($(".subme")[index].children.sub_id.defaultValue);
	        		sub_name_seq.push($(".subme")[index].children.sub_name.value);
	        	});

	        	$("[name = sub_id_seq]").val(sub_id_seq);
	        	$("[name = sub_name_seq]").val(sub_name_seq);
	 
	        	$("#submenuForm").submit();
	        	
	        	
	        });
	        
	        
	        $("#subinsertbtn").click(function(){ 
	        	$("#sortWrap2").append("<li  class = 'subme' data-order= '" + ($(".subme").length+1) + "'>"
	        			+"<input type = 'text' 	name = 'sub_name' value ='서브메뉴이름' size = '12'/>"
		       			+"<input type = 'hidden'  name = 'sub_id' value = 'insert' /></li>");
	        });
	        
	        $("#subdeletebtn").click(function(){ 
	        	var size = $("#sortWrap2")[0].childElementCount;
	        	$("#sortWrap2").children()[size-1].remove();
	        });
	        
        });
        </script>
        
    </head>
    <body>
        <div id="container">
            <header>
                <a href="/"><img src="/img/hlogo.png" width="250"></a>
            </header>
            <nav align ="center">
            	<script type="text/javascript" src="/js/menulist.js" ></script>
                <%@include file="/WEB-INF/include/menulist.jspf" %>
            </nav>
        
            <section>
            <br />
            <br />
            <br />
            <br />
            <h1>부경대학교병원: 메뉴 & 부서 관리</h1>
            	<br />
            	
            	<div id ="main_drag" style = "height:auto; display: inline-block;" >
            	<div class="bbtn">
	      				<input type ="button" value = "&nbsp;+&nbsp;" id = "maininsertbtn"/>
	      				<input type ="button" value = "&nbsp;-&nbsp;" id = "maindeletebtn"/>
	      				<input type ="button" value = "메인메뉴 수정" id = "mainupdatebtn"/>
	      		</div>
            	<form action = "/UpdateMenu" method="POST" id = "mainmenuForm">
	       			<ul id="sortWrap">
	       				<c:forEach var = "mainmenu" items = "${menuList}">
	       				<c:set var = "count" value = "${count + 1}" />
			       			<li class = "main" data-order= "${count}">
				       			<input type = "text" 	name = "menu_name" value ="${mainmenu.menu_name}" size = "12"/>
				       			<input type = "hidden"  name = "main_id" value = "${mainmenu.menu_id}" />
				       		</li>
	       				</c:forEach>
	       			</ul>
      			
      			<input type = "hidden" name = "menu_id_seq">
	      		<input type = "hidden" name = "menu_name_seq">
	      		
      			</form>
      			
       			</div>
       			
       			
	       		<div class = "main_detail">
       			<form action = "/UpdateSubMenu" method="POST" id = "submenuForm">
	       			
	       			<div>
	       				<h1><span id = "mainname">${selmenu_name}</span> 의 서브메뉴 목록</h1>
	       				<input type = "hidden" name = "main_menu_id" value = "${menu_id}">
	       				<br />
	       			</div><!-- 이건뭐지-->
	       			
	       			 <div  class="bbtn">
	      				<input type ="button" value = "&nbsp;+&nbsp;" id = "subinsertbtn"/>
	      				<input type ="button" value = "&nbsp;-&nbsp;" id = "subdeletebtn"/>
	      				<input type ="button" value = "서브메뉴 수정" id = "subupdatebtn"/>
	      			</div>
	      			
	       				
	       			<div>
	       			<ul id="sortWrap2">
	       				<c:forEach var = "submenu" items = "${subList}">
	       				<c:set var = "scount" value = "${scount + 1}" />
			       			<li  class = "subme" data-order= "${scount}">
				       			<input type = "text" 	name = "sub_name" value ="${submenu.sub_name}" size = "12"/>
					       		<input type = "hidden"  name = "sub_id" value = "${submenu.sub_id}" />
				       		</li>
	       				</c:forEach>
	       			</ul>
	       			</div> <!--  서브메뉴 끝 --> 
	       			<input type = "hidden" name = "sub_id_seq">
	      			<input type = "hidden" name = "sub_name_seq">
       				</form>
	       		</div>
            </section>
            <footer></footer>
        </div>
    </body>
</html>