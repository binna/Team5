package com.cons.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AjaxWriteListJson {
	int count;  // 데이터 개수
	String status;  // 처리 결과
	
//	@JsonIgnore
	String memo;   // response 에서 제외할 필드
	
	@JsonProperty("data")  // Json property 이름과 Java 필드명이 다른 경우
	List<consDTO> list;	

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public List<consDTO> getList() {
		return list;
	}

	public void setList(List<consDTO> list) {
		this.list = list;
	}
	
	
	
	
	
}








