package edu.kosta.roomModel;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
	
	public class StudymemberDAO {

		   private static StudymemberDAO instance = new StudymemberDAO();   // 한번만 객체를 생성하여 모든 클라이언트들이 공유
		   
		   public static StudymemberDAO getInstance(){
		      return instance;
		   }// getInstance()

   public Connection getConnection() throws Exception {
      Context ctx = new InitialContext();

      DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");

      DriverManager.setLogWriter(new PrintWriter(System.out));

      return ds.getConnection();
   }
   public int update(StudymemberVO vo) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String dbid = ""; // id값 받아올 변수
      int result = -1;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("SELECT NUM FROM STUDYMEMBER WHERE ID = ?");
         pstmt.setString(1, dbid);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            dbid = rs.getString("id");
            if(dbid.equals(vo.getId())) {
               
               
               pstmt = conn.prepareStatement("UPDATE STUDYMEMBER SET NAME = ?, "
                     + "PASSWD = ?, EMAIL = ?, HP = ?, ADDR1 = ?, ADDR2 = ?,"
                     + " SEX = ? ");
               
               pstmt.setString(1, vo.getName());
               pstmt.setString(2, vo.getPasswd());
               pstmt.setString(3, vo.getEmail());
               pstmt.setString(4, vo.getHp());
               pstmt.setString(5, vo.getAddr1());
               pstmt.setString(6, vo.getAddr2());
               pstmt.setString(7, vo.getSex());
               pstmt.executeUpdate();
               
               result = 1; // 수정완료
            } else result = 0; // 수정 실패
            
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         CloseUtil.close(conn);CloseUtil.close(rs);CloseUtil.close(pstmt);
      }
      
      return result;
   }
   public StudymemberVO update(int num) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      StudymemberVO vo = null;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("SELECT * FROM STUDYMEMBER WHERE NUM = ?");
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            vo = new StudymemberVO();
            vo.setName(rs.getString("name"));
            vo.setId(rs.getString("id"));
            vo.setEmail(rs.getString("email"));
            vo.setPasswd(rs.getString("passwd"));
            vo.setHp(rs.getString("hp"));
            vo.setAddr1(rs.getString("addr1"));
            vo.setAddr2(rs.getString("addr2"));
            vo.setFlag(rs.getInt("flag"));
         }

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseUtil.close(rs);
         CloseUtil.close(conn);
         CloseUtil.close(pstmt);
      }
      return vo;
   }

   public int delete(int num, String id) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String dbid = "";
      int result = 0;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("SELECT ID FROM STUDYMEMBER WHERE NUM = ?");
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            dbid = rs.getString("id");
            if (dbid.equals(id)) {
               pstmt = conn.prepareStatement("DELETE FROM STUDYMEMBER WHERE NUM = ?");
               pstmt.setInt(1, num);
               result = pstmt.executeUpdate();
               result = 1; // 글삭 성공 1
            } else
               result = 0; // 글삭 실패 0
         }

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseUtil.close(conn);
         CloseUtil.close(pstmt);
         CloseUtil.close(rs);
      }
      return result;
   }

   public int insert(StudymemberVO vo) throws SQLException {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         conn = getConnection();

         String sql = "INSERT INTO STUDYMEMBER(NUM, NAME, ID, EMAIL, PASSWD, SEX, HP, ADDR1, ADDR2, REG_DATE, FLAG)"
               + " VALUES (STUDYMEMBER_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
         pstmt = conn.prepareStatement(sql);

         // ? 값 셋팅
         pstmt.setString(1, vo.getName());
         pstmt.setString(2, vo.getId());
         pstmt.setString(3, vo.getEmail());
         pstmt.setString(4, vo.getPasswd());
         pstmt.setString(5, vo.getSex());
         pstmt.setString(6, vo.getHp());
         pstmt.setString(7, vo.getAddr1());
         pstmt.setString(8, vo.getAddr2());
         //pstmt.setTimestamp(11, vo.getReg_date());
         pstmt.setTimestamp(9, vo.getReg_date());
         pstmt.setInt(10, 0); // 가입만 한 초기상태

         // 실행 excuteXXX()
         rs = pstmt.executeQuery();

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseUtil.close(rs);
         CloseUtil.close(pstmt);
         CloseUtil.close(conn);
      }
      return 0;
   }
}