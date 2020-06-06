$(document)
		.ready(
				function() {
					$("#category>.category")
							.click(
									function() {
										$("#ex").remove();
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
															&& $('#consArea')
																	.val()
																	.trim() == data[i].carea
																	.trim()) {
														table += "<div class = \"comList\">"
														table += "<div class = \"comname\">"
																+ data[i].cname
																+ "</div>";
														table += "<div class = \"cominfo\">"
																+ data[i].cadr
																+ "</div>";
														table += "<div class = \"cominfo\">"
																+ data[i].ctel
																+ "</div>";
														table += "<div class = \"btnCons\">상담신청</div>"
														table += "<div class = \"comNo\">"
																+ data[i].cno
																+ "</div>"
														table += "</div class = \"comList\">"
														cnt++;
													} // end if
												} // end for
											} else {
												for (var i = 0; i < data.length; i++) {
													switch (data[i].carea
															.trim()) {
													case "서울":
													case "경기":
													case "인천":
													case "부산":
														break;
													default:
														if (category == data[i].ccategory) {
															table += "<div class = \"comList\">"
															table += "<div class = \"comname\">"
																	+ data[i].cname
																	+ "</div>";
															table += "<div class = \"cominfo\">"
																	+ data[i].cadr
																	+ "</div>";
															table += "<div class = \"cominfo\">"
																	+ data[i].ctel
																	+ "</div>";
															table += "<div class=\"btnCons\">상담신청</div>";
															table += "<div class = \"comNo\">"
																	+ data[i].cno
																	+ "</div>"
															table += "</div class = \"comList\">"
															cnt++;
														}
													} // end switch
												} // end for
											} // end if
											if (cnt == 0)
												table = "<div id=\"ex\"> <div class = \"ex\">아직 업체가 없습니다...<br>지역을 선택한 후 카테고리를 눌러 주세요~</div></div>"
											table += "</div>";
											$("#consList").html(table);
										} // end function()
									}); // end main function

					$('.category').click(function() {
						$('.cateImg').css({
							'border' : 'none'
						});

						$('.category').children('div').css({
							'color' : 'black'
						});

						$(this).children('.cateImg').css({
							'border' : '2px solid #0080c0'
						});

						$(this).children('div').css({
							'color' : '#0080c0'
						});
						isCheckLR();
					}); // end click function

					moveScrollRight = function() {
						
						var _scrollX = $('#category').scrollLeft();
						$('#category').animate({scrollLeft : (_scrollX + 292)},500,function(){isCheckLR()});
						isCheckLR();
					}; // end left click

					moveScrollLeft = function() {
						var _scrollX = $('#category').scrollLeft();
						$('#category').animate({scrollLeft : (_scrollX - 292)},500,function(){isCheckLR()});
						
					}; // end right click

					$('#category')
							.hover(
									function() {
										console.log($('#category').scrollLeft());
										if (_scrollX = $('#category')
												.scrollLeft() != 292) {
											$('.mRight').css({
												'visibility' : 'visible'
											})
										} else if (_scrollX = $('#category')
												.scrollLeft() != 0) {
											$('.mLeft').css({
												'visibility' : 'visible'
											})
										}
										;
										isCheckLR();
									}); // end mouseHover

					$('#category').mouseleave(function() {

						$('.mRight').css({
							'visibility' : 'hidden'
						})
						$('.mLeft').css({
							'visibility' : 'hidden'
						})
					}); // end mouseLeave

					$('.mLeft').hover(function() {
						$('.mLeft').css({
							'visibility' : 'visible'
						});
						isCheckLR();
					}); // end mLeft hover

					$('.mRight').hover(function() {
						$('.mRight').css({
							'visibility' : 'visible'
						});
						isCheckLR();
					}); // end mRight hover

					function isCheckLR() {
						if (_scrollX = $('#category').scrollLeft() >= 292) {
							$('.mRight').css({
								'visibility' : 'hidden'
							})
							$('.mLeft').css({
								'visibility' : 'visible'
							})
						} else if (_scrollX = $('#category').scrollLeft() <= 0) {
							$('.mRight').css({
								'visibility' : 'visible'
							})
							$('.mLeft').css({
								'visibility' : 'hidden'
							})
						}
					} // end isCheckLR
				
				}) // end JS
