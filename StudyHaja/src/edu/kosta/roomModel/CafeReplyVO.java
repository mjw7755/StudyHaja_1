package edu.kosta.roomModel;

import java.sql.Timestamp;

public class CafeReplyVO {
	String id,cafecontents;
	Timestamp reg_date;
	int num;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCafecontents() {
		return cafecontents;
	}
	public void setCafecontents(String cafecontents) {
		this.cafecontents= cafecontents;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
