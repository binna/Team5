package com.community.beans;

// DTO : Data Transfer Object
//	데이터를 담아 나르기 위한 객체

// 클래스 필드명 == DB 필드명 == form의 name

/*  DB 속성명
	Qno Number	// 게시글 No
	Qtitle varchar2(20)	// 제목 -> 20자 미만 받으면 안됨
	Qcontent clob	// 내용물
	Qregdate date	// 날짜
	Qclickcnt number	// 조회수
	Qkeyword varchar2(50) // 키워드
*/

public class WriteDTO {
	
	// 각각 담을 데이터 객체
	private int no;			// 게시글 No
	private String title; 	// 게시글 제목 글자수 : 7 ~ 20자
	private String content;	// 게시글 안의 내용물 : 제한 없음
	private String regDate;	// 날짜
	private int clickCnt;	// 클릭수
	private String keyword;	// 키워드
	
	
	// 기본생성자, 매개변수 생성자
	public WriteDTO() {}

	public WriteDTO(int no, String title, String content, int clickCnt, String keyword) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.clickCnt = clickCnt;
		this.keyword = keyword;
	}
	
	
	// getter, setter
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getClickCnt() {
		return clickCnt;
	}

	public void setClickCnt(int clickCnt) {
		this.clickCnt = clickCnt;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
} // end DTO