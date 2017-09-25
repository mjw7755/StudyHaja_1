package studyModel;

import java.sql.Timestamp;

public class StudyInfoVO {
	int num;
	String subject,kind1,kind2;
	Timestamp reg_date;
	String s_date,e_date;
	int readcount;
	String day,place1,place2,place3;
	int people;
	String content,ip;
	String s_time,e_time;
	String s_hour,s_minute,e_hour, e_minute;
	String format_time;
	String id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFormat_time() {
		return format_time;
	}
	public void setFormat_time(String format_time) {
		this.format_time = format_time;
	}
	public String getS_time() {
		return s_time;
	}
	public void setS_time(String s_time) {
		this.s_time = s_time;
	}
	public String getE_time() {
		return e_time;
	}
	public void setE_time(String e_time) {
		this.e_time = e_time;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getKind1() {
		return kind1;
	}
	public void setKind1(String kind1) {
		this.kind1 = kind1;
	}
	public String getKind2() {
		return kind2;
	}
	public void setKind2(String kind2) {
		this.kind2 = kind2;
	}
	
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}

	public String getS_hour() {
		return s_hour;
	}
	public void setS_hour(String s_hour) {
		this.s_hour = s_hour;
	}
	public String getS_minute() {
		return s_minute;
	}
	public void setS_minute(String s_minute) {
		this.s_minute = s_minute;
	}
	public String getE_hour() {
		return e_hour;
	}
	public void setE_hour(String e_hour) {
		this.e_hour = e_hour;
	}
	public String getE_minute() {
		return e_minute;
	}
	public void setE_minute(String e_minute) {
		this.e_minute = e_minute;
	}
	public String getPlace1() {
		return place1;
	}
	public void setPlace1(String place1) {
		this.place1 = place1;
	}
	public String getPlace2() {
		return place2;
	}
	public void setPlace2(String place2) {
		this.place2 = place2;
	}
	public String getPlace3() {
		return place3;
	}
	public void setPlace3(String place3) {
		this.place3 = place3;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
