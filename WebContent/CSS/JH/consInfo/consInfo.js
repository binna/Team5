//kakao local
$(document)
		.ready(
				function() {
					var consCategory = [ '장판', '도배', '시트필름', '욕실', '주방', '타일',
							'도어', '마루', '페인트', '목공' ];
					//
					var c1 = 0; // 카테고리저장
					var table = ""; // 회사정보
					var blank = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
					// 공백임당

					$("#btn_search").click(function() {
						parseJSON();
					})

					function parseJSON() {

						for (var i = 0; i < consCategory.length; i++) {

							console.log(c1);
							// 키워드로 장소검색
							$
									.ajax(
											{
												url : 'https://dapi.kakao.com/v2/local/search/keyword.json',
												headers : {
													'Authorization' : 'KakaoAK 96456f6d0e5f0db221b5025473bb3a0e'
												},
												type : 'GET',
												data : {
													'query' : consCategory[i],
												},
												success : function(data) {
													// 호출 성공하면 작성할 내용
													if (data.documents.length != 0) { // 값이
														// 있으면
														// alert("성공?")
														parseJSON2(data) // 15개가
														// 넘어온다

													}
												},
												error : function(request,
														status, error) {
													alert("code:"
															+ request.status
															+ "\n"
															+ "message:"
															+ request.responseText
															+ "\n" + "error:"
															+ error);
												}
											}).done(function(data) {
										console.log(data);
									});
						} // end for
					} // end parseJSON();

					function parseJSON2(jsonObj) {
						// place list

						var documents = jsonObj.documents

						table += "<table>";
						for (var j = 0; j < documents.length; j++) {
							table += "<tr>";
							table += "<td>INTO Company (Cno, Cname, Cadr, Ctel, Carea) VALUES("
									+ "get_seq" + ",</td>";
							table += "<td>'" + documents[j].place_name
									+ "',</td>";
							table += "<td>'" + documents[j].address_name
									+ "',</td>";
							table += "<td>'" + documents[j].phone + "',</td>";
							table += "<td>'"
									+ documents[j].address_name.split(" ")[0];
							+"</td>";
							table += "<td>')</td>"
							table += "</tr>";
							console.log(c1);
						} // end for
						table += "</table>";
						$("#company").html(table); // 데이터 출력
						c1++;
					} // end parseJSON2()
				})
