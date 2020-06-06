package com.community.beans;

// DTO : Data Transfer Object, 데이터를 담아 나르기 위한 객체
// 클래스 필드명 == DB 필드명 form의 name명

/*  DB 속성명
	-- 나중에 등록자 아이디로 따로 만들자!
	-- 기본키 Pk인 댓글 등록 번호
	Cno number NOT NULL,
	-- 게시글
	Cqno number NOT NULL,
	-- 댓글 내용
	Ccontent clob NOT NULL,
	-- 댓글 등록일
	Cregdate date DEFAULT SYSDATE,
	PRIMARY KEY (Cno)
*/

public class CommentDTO {
	
	// 각각 담을 데이터 객체
	private int Cno;			// 댓글  No
	private int Cqno;			// PK, 게시글 번호
	private String Ccomment;	// 댓글 내용
	private String CregDate;	// 댓글 등록 날짜
	
	// 기본생성자, 매개변수 생성자
	public CommentDTO() {}

	public CommentDTO(int cno, int cqno, String ccomment) {
		super();
		Cno = cno;
		Cqno = cqno;
		Ccomment = ccomment;
	}

	
	// getter, setter
	public int getCno() {
		return Cno;
	}
	public void setCno(int cno) {
		Cno = cno;
	}

	public int getCqno() {
		return Cqno;
	}
	public void setCqno(int cqno) {
		Cqno = cqno;
	}

	public String getCcomment() {
		return Ccomment;
	}
	public void setCcomment(String ccomment) {
		Ccomment = ccomment;
	}

	public String getCregDate() {
		return CregDate;
	}
	public void setCregDate(String cregDate) {
		CregDate = cregDate;
	}
	
} // end CommentDTO