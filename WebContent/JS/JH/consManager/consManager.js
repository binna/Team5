$(document).ready(
		function() {
			$('.updateComplete').hide(); // 초기수정 완료 버튼
			$('.cancel').hide(); // 초기 취소 버튼
			$('.update')
					.click(
							function() {
								console.log($(this).text());
								$(this).parents('.Info').children(
										'.consInfo').hide();
								// 상담정보 숨기기
								$(this).parents('.Info').children(
									'.consUpdate:not(".csno01")').css({
									'display' : 'block'
								}); // end .consUpdate CSS
								// 상담수정 입력창 보이기
								$(this).hide();
								// 수정버튼 숨기기
								$(this).parents('.Info')
										.children('.delete').hide();
								// 삭제버튼 숨기기
								$(this).parents('.Info').children(
										'.updateComplete').show();
								// 완료버튼 보이기
								$(this).parents('.Info')
										.children('.cancel').show();
								// 취소버튼 보이기

							} // end function

					) // end update click

			$('.cancel')
					.click(
							function() {
								// console.log("update 들어옴")
								$(this).parents('.consData').children(
										'div:not(.cname)').show();
								// 상담정보 보이기
								$(this).parents('.consData').children(
										'.consUpdate').hide();
								// 상담수정 입력창 보이기
								$(this).parents('.consData').children(
										'.updateComplete').hide();
								// 완료버튼 숨기기
								$(this).parents('.consData')
										.children('.update').show();
								// 수정버튼 보이기
								$(this).parents('.consData')
										.children('.delete').show();
								// 삭제버튼 보이기
								$(this).hide();
							} // end function
					) // end update click

					
					
			// 검색 버튼클릭
			$('.searchBtn').click(function() {
				// console.log($('#searchSelect option:selected').val());

				switch ($('#searchSelect option:selected').val()) {
				case "csno":
					// console.log("들어오냐?");
					
					$(".searchForm").attr("action", "consCsnoSelect.cons");
					break;

				case "csuid":
					// console.log("들어오냐?");
					$(".searchForm").attr("action", "consCsuidSelect.cons");
					break;

				case "cname":
					// console.log("들어오냐?");
					$(".searchForm").attr("action", "consCnameSelect.cons");
					break;

				case "cstel":
					// console.log("들어오냐?");
					$(".searchForm").attr("action", "consCstelSelect.cons");
					break;

				case "csarea":
					// console.log("들어오냐?");
					$(".searchForm").attr("action", "consCsareaSelect.cons");
					break;
				} // end switch
			});

			
		}) // end JS

