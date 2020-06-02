$(document).ready(function () {
		$("#category>.category")
				.click(
						function() {
							// console.log($('#consArea').val().trim());
							// console.log($(this).text().trim());
							var category = $(this).text().trim();
							var area = $('#consArea').val().trim();

							// JSON
							url = "list.ajax?reqType=json";
							$.ajax({
								url : url,
								type : "GET",
								cache : false,
								success : function(data, status) {
									if (status == "success")
										parseJSON(data, category);
								}
							});

							function parseJSON(jsonObj) {
								var data = jsonObj.data;
								var cnt = 0;
								var table = "<div id = \"comList\">";
								// 본문 태그 아이디
								if (area != "기타") {
									for (var i = 0; i < data.length; i++) {
										if (category == data[i].ccategory
												&& $('#consArea').val().trim() == data[i].carea
														.trim()) {
											table += "<div class = \"comList\">"
											table += "<div class = \"cname\">" + data[i].cname
													+ "</div>";
											table += "<div class = \"cinfo\">" + data[i].cadr
													+ "</div>";
											table += "<div class = \"cinfo\">" + data[i].ctel
													+ "</div>";
											table += "<div class = \"btnCons\">상담신청</div>"		
												table += "</div class = \"comList\">" 
											cnt++;
										} // end if
									} // end for
								} else {
									for (var i = 0; i < data.length; i++) {
										switch (data[i].carea.trim()) {
										case "서울":
										case "경기":
										case "인천":
										case "부산":
											break;
										default:
											if (category == data[i].ccategory){
												table += "<div class = \"comList\">"
												table += "<div class = \"cname\">"
														+ data[i].cname
														+ "</div>";
												table += "<div class = \"cinfo\">" + data[i].cadr
														+ "</div>";
												table += "<div class = \"cinfo\">" + data[i].ctel
														+ "</div>";
												table += "<div class = \"btnCons\">상담신청</div>"	;	
												table += "</div class = \"comList\">"
												cnt++;
											}
										} // end switch
									} // end for
								} // end if
								if (cnt == 0)
									table = "아직 업체가 없습니다..";
								table += "</div>";
								$("#consList").html(table);

								//else if(category != data[i].ccategory){}
							}
							//$(this).text().trim() == data[i]. && 
						})
})