package edu.kosta.roomModel;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;





public class roomDAO {  // controller
	
	private static roomDAO instance = new roomDAO();	// 한번만 객체를 생성하여 모든 클라이언트들이 공유
	
	public static roomDAO getInstance(){
		return instance;
	}// getInstance()
	
	// 생성자
	public roomDAO(){}  
		
	// DB연결
	public Connection getConnection() throws Exception{
		// 연결은 JNDI & POLL 형태로 연결 객체 생성해서 리턴
		Context ctx = new InitialContext();
		//Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");	
		//DBMS 에러를 찾는데 도움
	
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();

	}// getConnection();
			
/*	public ArrayList<roomVO> select() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<roomVO> voArr = null;
		String sql = "select * from room";
		try{
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			roomVO vo = null;
			voArr = new ArrayList<roomVO>();
			
			
			
			while(rs.next()){
				vo = new roomVO();
				
				vo.setAa(rs.getString("aa"));
				
				voArr.add(vo);
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
		
		return voArr;
	}*/

	//getListAllCount() : list.jsp 페이지에서 사용할 레코드 갯수 얻어오는 메소드
	public int getListSearch(String searchlocation){
		System.out.println("getListSearch : " + searchlocation);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		StringBuffer  sb = new StringBuffer();
		try {
			conn = getConnection();
			
			//현재 board 테이블의 레코드 수 구하기
			sb.append("SELECT COUNT(*) FROM ROOM where address like ?" );
			System.out.println(sb.toString());
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, "%"+searchlocation+"%");
			System.out.println("2:" + sb.toString());
			rs = pstmt.executeQuery();
			
			if( rs.next() ) 
				count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
	}
	public int getListAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//현재 board 테이블의 레코드 수 구하기
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM ROOM" );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) 
				count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
	} // getListAllCount() end
	
	public String showTimeAgo(int num){
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List  list = null;
		
		final int SEC = 60;
		final int MIN = 60;
		final int HOUR = 24;
		final int DAY = 30;
		final int MONTH = 30;
		
		String msg="";
		String sql;
		roomVO vo = null;
		
		
		long curTime=System.currentTimeMillis();
		
		try {
		   	conn = getConnection();
		   	//조회수 증가
		   
		   	pstmt = conn.prepareStatement("select reg_date from room where num = ?");
		   	pstmt.setInt(1, num);
		   	rs = pstmt.executeQuery();
		   	
		   	if(rs.next()) {
		   			  vo = new roomVO();
		              //vo.setReg_date(rs.getTimestamp("reg_date"));
		              long regTime = rs.getTimestamp("reg_date").getTime();
		              long diffTime = (curTime - regTime) / 1000;
		              
		              if(diffTime<SEC){
		            	  msg="방금 전";
		              }else if((diffTime /= SEC)<MIN){
		            	  msg = diffTime + "분 전";
		      		} else if ((diffTime /= MIN) < HOUR) {
		      			// hour
		      			msg = (diffTime) + "시간 전";
		      		} else if ((diffTime /=HOUR) < DAY) {
		      			// day
		      			msg = (diffTime) + "일 전";
		      		} else if ((diffTime /= DAY) < MONTH) {
		      			// day
		      			msg = (diffTime) + "달 전";
		      		} else {
		      			msg = (diffTime) + "년 전";
		      		}
		             
		              System.out.println(regTime);
		   	}
		     }catch(Exception e){
					e.printStackTrace();
				}finally {
					CloseUtil.close(rs);
					CloseUtil.close(pstmt);
					CloseUtil.close(conn);
				}
	
		return msg;
	}
	//getSelectAll(startRow, endRow) : list.jsp 에서 사용할 전체 레코드 출력 메소드
		public List<roomVO> getSelectAll( int pageNum ) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			List  list = null;
			String[] arr;
			
			 
			try {
				conn = getConnection();
				StringBuffer  sb = new StringBuffer();
			
				//sb.append("SELECT * FROM ROOM where r_no >= ? and r_no <= ? order by reg_date desc");
				sb.append("SELECT * FROM ROOM order by reg_date desc");
				
				/*sb.append("SELECT * R " );
		        sb.append("FROM(SELECT NUM, R_NO, IMAGES, SUBJECT, ADDRESS, AREA, LOCATION, PAY, OPTIONS, C_DAY, WORKING_HOUR, READCOUNT,TEL, SEATS, REG_DATE, CONTENTS, ROWNUM R " );
		        sb.append("FROM(SELECT * " );
		        sb.append("FROM ROOM ORDER BY reg_date DESC) WHERE R>=? AND R<=? " );*/
		         
		        //ORDER BY R_NO DESC)
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				
				for(int i=0; i<(pageNum-1)*9 && rs.next(); i++) {}
				for(int i=0; i<9 && rs.next(); i++) {
					list = new ArrayList(9);
					
					do {
						roomVO vo = new roomVO();
						
						vo.setNum(rs.getInt("num"));
						
						vo.setImages(rs.getString("images"));
						vo.setSubject(rs.getString("subject"));
						vo.setArea(rs.getString("area"));
						vo.setLocation(rs.getString("location"));
						vo.setPay(rs.getString("pay"));
						vo.setOptions(rs.getString("options"));
						vo.setWorking_hour(rs.getString("working_hour"));
						vo.setWorking_hour2(rs.getString("working_hour2"));
						vo.setC_day(rs.getString("c_day"));
						vo.setTel(rs.getString("tel"));
						vo.setSeats(rs.getString("seats"));
						vo.setContents(rs.getString("contents"));
						vo.setReadcount(rs.getInt("readcount"));
						vo.setReg_date(rs.getTimestamp("reg_date"));
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
		}
// getSelectAll(startRow, endRow) end
		public List<roomVO> selectsearchlist(int pageNum, String searchlocation) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			List  list = null;
			String[] arr;
			try {
				conn = getConnection();
				StringBuffer  sb = new StringBuffer();
			
				//sb.append("SELECT * FROM ROOM where r_no >= ? and r_no <= ? order by reg_date desc");
				sb.append("SELECT * FROM ROOM where address LIKE ? order by reg_date desc");
				System.out.println(sb.toString());
				
				/*sb.append("SELECT * R " );
		        sb.append("FROM(SELECT NUM, R_NO, IMAGES, SUBJECT, ADDRESS, AREA, LOCATION, PAY, OPTIONS, C_DAY, WORKING_HOUR, READCOUNT,TEL, SEATS, REG_DATE, CONTENTS, ROWNUM R " );
		        sb.append("FROM(SELECT * " );
		        sb.append("FROM ROOM ORDER BY reg_date DESC) WHERE R>=? AND R<=? " );*/
		         
		        //ORDER BY R_NO DESC)
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, "%"+searchlocation+"%");
/*				pstmt.setString(1, "'%"+"부산"+"%'");
*/				System.out.println("2 : " + sb.toString());
				rs = pstmt.executeQuery();
				
				for(int i=0; i<(pageNum-1)*9 && rs.next(); i++) {}
				for(int i=0; i<9 && rs.next(); i++) {
					list = new ArrayList(9);
					
					do {
						roomVO vo = new roomVO();
						vo.setNum(rs.getInt("num"));
						
						vo.setImages(rs.getString("images"));
						vo.setSubject(rs.getString("subject"));
						vo.setArea(rs.getString("area"));
						vo.setLocation(rs.getString("location"));
						vo.setPay(rs.getString("pay"));
						vo.setOptions(rs.getString("options"));
						vo.setWorking_hour(rs.getString("working_hour"));
						vo.setWorking_hour2(rs.getString("working_hour2"));
						vo.setC_day(rs.getString("c_day"));
						vo.setTel(rs.getString("tel"));
						vo.setSeats(rs.getString("seats"));
						vo.setContents(rs.getString("contents"));
						vo.setReadcount(rs.getInt("readcount"));
						vo.setReg_date(rs.getTimestamp("reg_date"));
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
		}
public roomVO getDataDetail(int num) {
	 Connection conn = null;
     PreparedStatement pstmt=null;
     ResultSet rs = null;
	
     roomVO vo = null;
     String sql = "";
     
     try {
   	conn = getConnection();
   	//조회수 증가
   	sql = "UPDATE room SET READCOUNT = READCOUNT+1 WHERE NUM = ?";
   	pstmt = conn.prepareStatement(sql);
   	pstmt.setInt(1, num);
   	pstmt.executeQuery();
   	
   	pstmt = conn.prepareStatement("select * from room where num = ?");
   	pstmt.setInt(1, num);
   	rs = pstmt.executeQuery();
   	
   	if(rs.next()) {
   			  vo = new roomVO();
              vo.setNum(rs.getInt("num"));
              vo.setImages(rs.getString("images"));
              vo.setSubject(rs.getString("subject"));
              vo.setAddress(rs.getString("address"));
              vo.setArea(rs.getString("area"));
              vo.setLocation(rs.getString("location"));
              vo.setPay(rs.getString("pay"));
              vo.setOptions(rs.getString("options"));
              vo.setC_day(rs.getString("c_day"));
              vo.setWorking_hour(rs.getString("working_hour"));
              vo.setContents(rs.getString("contents"));
              vo.setReadcount(rs.getInt("readcount"));
              vo.setTel(rs.getString("tel"));
              vo.setSeats(rs.getString("seats"));
              vo.setReg_date(rs.getTimestamp("reg_date"));
              vo.setWorking_hour2(rs.getString("working_hour2"));

   	}
     }catch(Exception e){
			e.printStackTrace();
		}finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	return vo;
}
public int insertStudyCafe(roomVO vo){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	int r_no = vo.getR_no();
	int number=0;
	try{
		conn = getConnection();
		
		pstmt = conn.prepareStatement("SELECT MAX(NUM) FROM room");
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			number = rs.getInt(1)+1;
		}else {
			number = 1;
		}
		
		r_no = number;
		sb.append("insert into room(num, images, subject, address, area, location, pay, options, c_day, working_hour,  contents, tel, seats, reg_date, working_hour2, r_no ) " );
		sb.append(" values(room_num.nextval,?,    ?,        ?,     ?,    ?,       ?,   ?,        ?,     ?, 			?, 	      ?,      ?,      ?,  ?,     ?)");
		
	
		pstmt = conn.prepareStatement(sb.toString());
		
		pstmt.setString(1, vo.getImages()); //subject
		pstmt.setString(2, vo.getSubject()); //kind1
		pstmt.setString(3, vo.getAddress()); //kind2
		pstmt.setString(4, vo.getArea()); //s_date
		pstmt.setString(5, vo.getLocation()); //e_date
		pstmt.setString(6, vo.getPay()); //day
		pstmt.setString(7, vo.getOptions()); //place1
		pstmt.setString(8, vo.getC_day()); //place2
		pstmt.setString(9, vo.getWorking_hour()); //place3
		pstmt.setString(10, vo.getContents()); //content
		pstmt.setString(11, vo.getTel()); //tel
		pstmt.setString(12, vo.getSeats()); //reg_date
		pstmt.setTimestamp(13, vo.getReg_date()); //s_hour
		pstmt.setString(14, vo.getWorking_hour2());
		pstmt.setInt(15, vo.getR_no());
		//pstmt.setStringForClob()
		pstmt.executeUpdate();
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null) CloseUtil.close(rs);
			if(pstmt!=null) CloseUtil.close(pstmt);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	return 0;
}
public roomVO update(int num) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	roomVO vo = null;
	
	try {
		conn = getConnection();
		String sql = "select * from room where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			vo = new roomVO();
			vo.setImages(rs.getString("images"));
			vo.setSubject(rs.getString("subject"));
			vo.setAddress(rs.getString("address"));
			vo.setArea(rs.getString("area"));
			vo.setLocation(rs.getString("location"));
			vo.setPay(rs.getString("pay"));
			vo.setOptions(rs.getString("options"));
			vo.setC_day(rs.getString("c_day"));
			vo.setWorking_hour(rs.getString("working_hour"));
			vo.setTel(rs.getString("tel"));
			vo.setSeats(rs.getString("seats"));
			vo.setContents(rs.getString("contents"));
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
	}
	
	return vo;
}
public int update(roomVO vo) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	int result = 0;
	try {
		conn = getConnection();
		/*conn = getConnection();
		String passwd = "";
		String sql = "select passwd from board where num=?";
		pstmt = conn.prepareStatement(sql);
		System.out.println(vo.getNum());
		pstmt.setInt(1, vo.getNum());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			System.out.println("들어오나?");
			passwd = rs.getString("passwd");
		}
		System.out.println(vo.getPasswd());
		System.out.println(passwd);*/
		
		//if(passwd.equals(vo.getPasswd())){
		String sql = "update room set images=?, subject=?, address=?, area=?,location=?, pay=?, options=?, c_day=?, working_hour=?, tel=?, seats=?, contents=?, working_hour2=? where num=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getImages());
		pstmt.setString(2, vo.getSubject());
		pstmt.setString(3, vo.getAddress());
		pstmt.setString(4, vo.getArea());
		pstmt.setString(5, vo.getLocation());
		pstmt.setString(6, vo.getPay());
		pstmt.setString(7, vo.getOptions());
		pstmt.setString(8, vo.getC_day());
		pstmt.setString(9, vo.getWorking_hour());
		pstmt.setString(10, vo.getTel());
		pstmt.setString(11, vo.getSeats());
		pstmt.setString(12, vo.getContents());
		pstmt.setString(13, vo.getWorking_hour2());
		pstmt.setInt(14, vo.getNum());
		
		pstmt.executeUpdate();
		result = 1;
	} catch(Exception e){
		e.printStackTrace();
		
	} finally{
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
	}
	
		return result;
	}

	public int delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete FROM ROOM WHERE NUM=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return result;
 } // delete() end

}
		//insert(vo) method - 새로운 글을 게시판에 추가, 글 입력 처리에 사용
		/*public int insert(roomVO vo) {
			Connection conn = null ;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			//답변 글인지 일반(새 게시글)인지 구분해서 입력 시키는 로직
			//int num = vo.getNum();				//내부적 부모 글번호
			//int ref = vo.getRef();					//부모의 ref(그룹 번호)
			//int re_step = vo.getRe_step();		//부모의 그룹내 순서
			//int re_level = vo.getRe_level();		//부모의 그룹내 레벨
			//int number = 0;							// board 테이블에 들어갈 번호
			StringBuffer sb = new StringBuffer();
			
			try {
				conn = getConnection();
				//현재 board 테이블에 레코드 유무 판단과 글 번호 지정
				pstmt = conn.prepareStatement("SELECT MAX(NUM) FROM BOARD");
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					number = rs.getInt(1) + 1;     // 1 : num , 다음 글 번호는 가장 큰 번호 + 1 
				} else {
					number = 1;
				} // if end
				
				//제목글과 답변글 간의 순서 결정
				if( num != 0 ) {  //답변글
					re_level = re_level + 1;
					
					pstmt = conn.prepareStatement(
							"SELECT MAX(RE_STEP) FROM BOARD WHERE REF = ? AND RE_LEVEL = ? ");
					pstmt.setInt(1, ref);
					pstmt.setInt(2, re_level);
					rs = pstmt.executeQuery();
					
					if( rs.next() ) {
						if( re_step == 0 ) {
							re_step = rs.getInt(1) + 1;
						}
					} else {
						re_step = 0; 			// 첫번째 글
					} // in if end
					
				} else {				// 부모글인 경우 글번호 없음
					ref= number;
					re_step = 0;
					re_level = 0;
				} // out if end
				
				//insert 명령 처리
				sb.append("INSERT INTO BOARD(NUM, WRITER, SUBJECT, EMAIL, CONTENT, PASSWD, REG_DATE, ");
				sb.append(" REF, RE_STEP, RE_LEVEL, IP) VALUES(BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getWriter());
				pstmt.setString(2, vo.getSubject());
				pstmt.setString(3, vo.getEmail());
				pstmt.setString(4, vo.getContent());
				pstmt.setString(5, vo.getPasswd());
				pstmt.setTimestamp(6, vo.getReg_date());
				
				pstmt.setInt(7, ref);
				pstmt.setInt(8, re_step);
				pstmt.setInt(9, re_level);
				pstmt.setString(10, vo.getIp());			
				
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
			}	
			return 0;
		} // insert() end
}*/







