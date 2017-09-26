package StudyJoinModel;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
	
	public class memberJoinDAO {

		   private static memberJoinDAO instance = new memberJoinDAO();   // 한번만 객체를 생성하여 모든 클라이언트들이 공유
		   
		   public static memberJoinDAO getInstance(){
		      return instance;
		   }// getInstance()

   public Connection getConnection() throws Exception {
      Context ctx = new InitialContext();

      DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");

      DriverManager.setLogWriter(new PrintWriter(System.out));

      return ds.getConnection();
   }
   
	//getListAllCount() : list.jsp 페이지에서 사용할 레코드 갯수 얻어오는 메소드
	public int getListAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//현재 board 테이블의 레코드 수 구하기
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM studymember" );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
	} // getListAllCount() end

	//getSelectAll(startRow, endRow) : list.jsp 에서 사용할 전체 레코드 출력 메소드
		public List<MemberJoinVO> getSelectAll( int start,  int end ) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			List  list = null;
			
			try {
				conn = getConnection();
				StringBuffer sb = new StringBuffer();
			
				sb.append("SELECT * FROM studymember where num>=? and num<=?");
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					list = new ArrayList(end);
					
					do {
						MemberJoinVO vo = new MemberJoinVO();
						vo.setNum(rs.getInt("num"));
						vo.setId(rs.getString("id"));
						vo.setPasswd(rs.getString("passwd"));
						vo.setHp(rs.getString("hp"));
						vo.setEmail(rs.getString("email"));
						/*vo.setReadcount(rs.getInt("readcount"));*/
						
						
	
						
						// list 객체에 데이터 저장 Bean인 BoardVO 객체에 저장한다.
						list.add(vo);
						
					} while( rs.next() ) ;	
				} // if end
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
			}				
			return list;
		} // getSelectAll(startRow, endRow) end
   
   
   
   

   public int update(MemberJoinVO vo) {
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
   public MemberJoinVO update(int num) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      MemberJoinVO vo = null;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("SELECT * FROM STUDYMEMBER WHERE NUM = ?");
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            vo = new MemberJoinVO();
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
   public MemberJoinVO modifyMember(String id){
	   Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql="";
	      String dbid = ""; // id값 받아올 변수
	      try {
	         conn = getConnection();
	         sql = "update studymember set passwd = ?, email = ?, hp = ?, addr1=?, addr2=?";
	         rs = pstmt.executeQuery();
	               MemberJoinVO vo = new MemberJoinVO();
	               pstmt = conn.prepareStatement(sql);
	               
	               pstmt.setString(1, vo.getPasswd());
	               pstmt.setString(2, vo.getEmail());
	               pstmt.setString(3, vo.getHp());
	               pstmt.setString(4, vo.getAddr1());
	               pstmt.setString(5, vo.getAddr2());
	               pstmt.executeUpdate();
	               
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         CloseUtil.close(conn);CloseUtil.close(rs);CloseUtil.close(pstmt);
	      }
	      
	      return null;
		}

   public List<MemberJoinVO> modifySelectAll(String id ) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List  list = null;
		
		try {
			conn = getConnection();
			StringBuffer sb = new StringBuffer();
		
			sb.append("SELECT * FROM studymember where id = ? ");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
					MemberJoinVO vo = new MemberJoinVO();
						vo.setName(rs.getString("name"));
			            vo.setId(rs.getString("id"));
			            vo.setEmail(rs.getString("email"));
			            vo.setPasswd(rs.getString("passwd"));
			            vo.setHp(rs.getString("hp"));
			            vo.setAddr1(rs.getString("addr1"));
			            vo.setAddr2(rs.getString("addr2"));
			            vo.setFlag(rs.getInt("flag"));;
					/*vo.setReadcount(rs.getInt("readcount"));*/
					// list 객체에 데이터 저장 Bean인 BoardVO 객체에 저장한다.
					list.add(vo);
					
				} 	 // if end
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return list;
	} // modifySelectALL(startRow, endRow) end

  
	   public int delete(String id) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      //String dbid = "";
      int result = 0;

      try {
         conn = getConnection();
         pstmt = conn.prepareStatement("DELETE FROM STUDYMEMBER WHERE id = ?");
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();

       /*  if (rs.next()) {
            dbid = rs.getString("id");
            if (dbid.equals(id)) {
               pstmt = conn.prepareStatement("DELETE FROM STUDYMEMBER WHERE NUM = ?");
               pstmt.setInt(1, num);
               result = pstmt.executeUpdate();
               result = 1; // 글삭 성공 1
            } else
               result = 0; // 글삭 실패 0
         }*/

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseUtil.close(conn);
         CloseUtil.close(pstmt);
         CloseUtil.close(rs);
      }
      return result;
   }

   public int insert(MemberJoinVO vo) throws SQLException {
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
   public int confirmId(String id)  // 아이디 중복확인
		   throws Exception {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs= null;
		   int result=-1;
		    
		   
		   try {
		   conn = getConnection();
		   pstmt = conn.prepareStatement("select id from studymember where id = ?");
		   pstmt.setString(1, id);
		   rs= pstmt.executeQuery();
		      
		   if(rs.next())
			   result = 1; //해당 아이디 있음
		   else
			   result = -1;//해당 아이디 없음
		   
		   } catch(Exception ex) {
		   ex.printStackTrace();
		   } finally {
		   if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		   if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		   if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		   }
		   return result;
		   }
   
   public int loginCheck(String id, String passwd){
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs= null;
	   String dbpw = "";
	   String dbname = "";
	   int result=0;
	   try{
		  
		   conn = getConnection();
		   StringBuffer sb = new StringBuffer();
		   sb.append("select passwd, name from studymember where id=?");
		   pstmt = conn.prepareStatement(sb.toString());
		   pstmt.setString(1, id);
		   rs = pstmt.executeQuery();
		   
		   if(rs.next()){
			   dbpw = rs.getString("passwd");
			   dbname = rs.getString("name");
			   
			   if(dbpw.equals(passwd)){
				   result = 1; //비번이 같으면
			   }else
				   result = 0; //비번이 틀리면
		   }else{
			   result = -1; // id가 없다면
		   }
		   
	   }catch(Exception e){
		   e.printStackTrace();
	   }finally {
		   try{
			   if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			   if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			   if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	return result; 
    } // end logincheck
   
    public String getName(String id){
    	Connection conn = null;
 	   PreparedStatement pstmt = null;
 	   ResultSet rs= null;
 	   String name=null;
 	   int result=0;
 	   try{
 		  
 		   conn = getConnection();
 		   StringBuffer sb = new StringBuffer();
 		   sb.append("select name from studymember where id=?");
 		   pstmt = conn.prepareStatement(sb.toString());
 		   pstmt.setString(1, id);
 		   rs = pstmt.executeQuery();
 		   
 		   if(rs.next()){
 			  name = rs.getString("name");
 		   }
 	   }catch(Exception e){
 		   e.printStackTrace();
 	   }finally {
 		   try{
 			   if (rs != null) try { rs.close(); } catch(SQLException ex) {}
 			   if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
 			   if (conn != null) try { conn.close(); } catch(SQLException ex) {}
 		   }catch(Exception e){
 			   e.printStackTrace();
 		   }
    	return name;
    }//end getName
}
    
    public MemberJoinVO selectTdMember(String tdId) {
    	Connection conn = null;
  	   PreparedStatement pstmt = null;
  	   ResultSet rs= null;
  	   MemberJoinVO vo = null;
  	   String sql = "select name,id,email,hp from studymember where id=?";
  	   try{
  		  
  		   conn = getConnection();
  		   pstmt = conn.prepareStatement(sql);
  		   pstmt.setString(1, tdId);
  		   rs = pstmt.executeQuery();
  		   
  		   if(rs.next()){
  			  vo = new MemberJoinVO();
  		
  			  vo.setName(rs.getString("name"));
  			  vo.setId(rs.getString("id"));
  			  vo.setEmail(rs.getString("email"));
  			  vo.setHp(rs.getString("hp"));
  		   }
  	   }catch(Exception e){
  		   e.printStackTrace();
  	   }finally {
  		   try{
  			   if (rs != null) try { rs.close(); } catch(SQLException ex) {}
  			   if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
  			   if (conn != null) try { conn.close(); } catch(SQLException ex) {}
  		   }catch(Exception e){
  			   e.printStackTrace();
  		   }
    	
    	return vo;
    }
    }
	}