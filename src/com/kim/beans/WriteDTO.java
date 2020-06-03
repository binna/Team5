package com.kim.beans;

public class WriteDTO {
	private int pid;
	private String pname;
	private int pprice;
	private String pbrand;
	private String pimage;
	private int pcode;
	
	public WriteDTO() {
		super();
	}

	public WriteDTO(int pid, String pname, int pprice, String pbrand, String pimage, int pcode) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pbrand = pbrand;
		this.pimage = pimage;
		this.pcode = pcode;
	}

	public int getPid() {
		System.out.println("getuid()호출");
		return pid;
	}

	public void setPid(int pid) {
		System.out.println("setuid()호출");
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getPbrand() {
		return pbrand;
	}

	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

		
	@Override
	public String toString() {
		return "WriteDTO] " + pid + " : " + pname + " : " 
				+ pprice + " : " + pbrand + " : " + pimage + " : " + pcode;
	}

	
}