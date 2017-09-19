package edu.kosta.roomModel;

import java.io.*;
import java.sql.Date;
import java.sql.Timestamp;

//dto, dao 직렬화 하는 것이 좋다
public class StudymemberVO implements Serializable {
   // 멤버변수(인스턴스 변수) => jsp에서는 프로퍼티(property) 라고 부른다.
   // 프로퍼티들은 가능하면 html form의 input name과 일치시켜 주는 것이 좋다

   private int num; // 회원번호
   private String name;
   private String id;
   private String passwd;
   private String email;
   private String hp;
   private String addr1, addr2;
   private String sex;
   private Timestamp reg_date;
   private int flag; // 회원 상태 정보

   public StudymemberVO() {
      System.out.println("MemberVO() 생성자");
      // 기본 생성자 반드시 필요
      // 기본 생성자가 없으면 jsp에서 useBean으로 객체 생성을 할 수 없다.
   }

   // 생성자 오버로드

   public StudymemberVO(int num, String name, String id, String passwd, String email, String hp,
         String addr1, String addr2, Timestamp reg_date, int flag) {
      super();
      this.num = num;
      this.name = name;
      this.id = id;
      this.passwd = passwd;
      this.email = email;
      this.hp = hp;
      this.addr1 = addr1;
      this.addr2 = addr2;
      this.sex = sex;
      this.reg_date = reg_date;
      this.flag = flag;
   }

   // setter, getter

   

   public void setNum(int num) {
      this.num = num;
   }

   public String getSex() {
      return sex;
   }

   public void setSex(String sex) {
      this.sex = sex;
   }

   public int getNum() {
      return num;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPasswd() {
      return passwd;
   }

   public void setPasswd(String passwd) {
      this.passwd = passwd;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getHp() {
      return hp;
   }

   public void setHp(String hp) {
      this.hp = hp;
   }

   public String getAddr1() {
      return addr1;
   }

   public void setAddr1(String addr1) {
      this.addr1 = addr1;
   }

   public String getAddr2() {
      return addr2;
   }

   public void setAddr2(String addr2) {
      this.addr2 = addr2;
   }

   public Timestamp getReg_date() {
      return reg_date;
   }

   public void setReg_date(Timestamp reg_date) {
      this.reg_date = reg_date;
   }

   public int getFlag() {
      return flag;
   }

   public void setFlag(int flag) {
      this.flag = flag;
   }

   // 주소도 하나로 합침
   public String getAllAddr() {
      return addr1 + " " + addr2;
   }

   // toString() 오버라이드
   @Override
   public String toString() {
      return "StudymemberVO [num=" + num + ", name=" + name + ", id=" + id + ", passwd=" + passwd + ", email=" + email
            + ", hp=" + hp + ", addr1=" + addr1 + ", addr2="
            + addr2 + ", reg_date=" + reg_date + ", flag=" + flag + "]";
   }
}