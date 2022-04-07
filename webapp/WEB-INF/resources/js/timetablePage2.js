$(document).ready(
		function() {
			var timetable = "";

			for (var hour = 09; hour < 19; hour++) {
				var hr = hour + ":00:00";
				var check = "<a href = '' class='resgo'>예약하기</a>";

				timetable += "<tr class='tr'>";
				timetable += "<td class=" + hr + ">";
				timetable += hour + ":00:00 ~" + hour + ":59:59";
				timetable += "</td>";
				timetable += "<td class='td2'>";

				if ("${resVo.size()}" == '1') {
					// timetable += check;
				} else {
					for (var size = 0; size < '${reslistsize}' - 1; size++) {
						console.log("${resVo.get(size).res_time}" == hr);
						if ("${resVo.get(size).res_time}" == hr)
							check = "예약 완료 ";
					}
				}

				timetable += check;
				timetable += "</td>";
				timetable += "</tr>";
			}
			; // table 그리기

			$(function() {
				$('.resgo').on(
						"click",
						function() {
							var time = $(this).parents(1).children().eq(1)
									.attr("class");
							var slash = '${empVo.emp_name}';
							var emp = slash.split('/');
							var num = emp[0].trim();
							console.log(num);
							$(this).attr(
									"href",
									"/Reserv/UpdateForm?res_date=${rv.res_date}&emp_name="
											+ num + "&res_time=" + time);
						});
			});
			// console.log(timetable);
			$('.morning').append(timetable);
		});