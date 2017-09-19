package edu.kosta.roomModel;

import java.io.Serializable;
import java.sql.Timestamp;
												//네트워크에서 데이터는 바이트 단위로 전송이 된다.
												// 객체를 바이트 단위로 보내야한다.
												// 객체 직렬화, 객체 데이터를 바이트 단위로 분해하여 보내주는것 
public class roomVO implements Serializable {    //model
		// 필드 선언
		private int num;
		private int r_no;
		
		private String images;
		private String subject;
		private String address;
		private String area;
		private String location;
		private String pay;
		private String options;
		private String c_day;
		private String working_hour;
		private String working_hour2;
		private String content;
		private int readcount;
		private String tel;
		private String seats;
		private Timestamp reg_date;
		private String contents;
		
		public String getWorking_hour2() {
			return working_hour2;
		}
		public void setWorking_hour2(String working_hour2) {
			this.working_hour2 = working_hour2;
		}
		public int getR_no() {
			return r_no;
		}
		public void setR_no(int r_no) {
			this.r_no = r_no;
		}
		
		public String getContents() {
			return contents;
		}
		public void setContents(String contents) {
			this.contents = contents;
		}
		public Timestamp getReg_date() {
			return reg_date;
		}
		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		public String getSeats() {
			return seats;
		}
		public void setSeats(String seats) {
			this.seats = seats;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getImages() {
			return images;
		}
		public void setImages(String images) {
			this.images = images;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getArea() {
			return area;
		}
		public void setArea(String area) {
			this.area = area;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getPay() {
			return pay;
		}
		public void setPay(String pay) {
			this.pay = pay;
		}
		public String getOptions() {
			return options;
		}
		public void setOptions(String options) {
			this.options = options;
		}
		public String getC_day() {
			return c_day;
		}
		public void setC_day(String c_day) {
			this.c_day = c_day;
		}
		public String getWorking_hour() {
			return working_hour;
		}
		public void setWorking_hour(String working_hour) {
			this.working_hour = working_hour;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		
		

		
}
