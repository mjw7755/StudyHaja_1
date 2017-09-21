package studyModel;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class StudyInfoDAO {
private static StudyInfoDAO instance = new StudyInfoDAO();
	
	public static StudyInfoDAO getInstance() {
		return instance;
	}
	
	public StudyInfoDAO() {}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
//		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	}
	
	public int insertStudyInfo(StudyInfoVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try{
			conn = getConnection();
			sb.append("insert into study_info(num, subject, kind1, kind2, s_date, e_date, day," );
			sb.append(" place1, place2, place3, people, content, ip, reg_date, "
					+ "s_hour, s_minute, e_hour, e_minute) "
					+ "values(study_num.nextval,?, ?, ?, ?, ?, ?, "
					+ "?, ?, ?, ?, ?, ?, ?,"
					+ "?, ?, ?, ?)");
			
		
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getSubject()); //subject
			pstmt.setString(2, vo.getKind1()); //kind1
			pstmt.setString(3, vo.getKind2()); //kind2
			pstmt.setString(4, vo.getS_date()); //s_date
			pstmt.setString(5, vo.getE_date()); //e_date
			pstmt.setString(6, vo.getDay()); //day
			pstmt.setString(7, vo.getPlace1()); //place1
			pstmt.setString(8, vo.getPlace2()); //place2
			pstmt.setString(9, vo.getPlace3()); //place3
			pstmt.setInt(10, vo.getPeople()); //people
			pstmt.setString(11, vo.getContent()); //content
			pstmt.setString(12, vo.getIp()); //ip
			pstmt.setTimestamp(13, vo.getReg_date()); //reg_date
			pstmt.setString(14, vo.getS_hour()); //s_hour
			pstmt.setString(15, vo.getS_minute()); //s_minute
			pstmt.setString(16, vo.getE_hour()); //e_hour
			pstmt.setString(17, vo.getE_minute()); //e_minute
		
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
		
		return -1;
	}
	
	public ArrayList<StudyInfoVO> selectList(String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE SUBJECT LIKE ?";
		try {
	
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+content+"%");
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				
				studyArr.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return studyArr;
	}
	
	public ArrayList<StudyInfoVO> selectListSearch(String content,String subSearch) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		final int SEC = 60;
	    final int MIN = 60;
	    final int HOUR = 24;
	    final int DAY = 30;
	    final int MONTH = 12;
		
	    String msg = "";
		
		if(subSearch.equals("제목")){
			subSearch = "subject";
		}else if(subSearch.equals("장소")){
			subSearch = "place2";
		}
		
		String sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT,FORMAT_TIME FROM STUDY_INFO WHERE "+subSearch+" LIKE '%"+content+"%'";
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				long curTime = System.currentTimeMillis();
			    long regTime = rs.getTimestamp("reg_date").getTime();
			    long diffTime = (curTime - regTime) / 1000;
			    
			    if (diffTime < SEC) {
		    		// sec
		    		msg = "방금 전";
		    	} else if ((diffTime /= SEC) < MIN) {
		    		// min
		    		msg = diffTime + "분 전";
		    	} else if ((diffTime /= MIN) < HOUR) {
		    		// hour
		    		msg = (diffTime) + "시간 전";
		    	} else if ((diffTime /= HOUR) < DAY) {
		    		// day
		    		msg = (diffTime) + "일 전";
		    	} else if ((diffTime /= DAY) < MONTH) {
		    		// day
		    		msg = (diffTime) + "달 전";
		    	} else {
		    		msg = (diffTime) + "년 전";
		    	}
			    
				
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				vo.setFormat_time(msg);
				
				studyArr.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return studyArr;
	}
	
	public ArrayList<StudyInfoVO> selectListSelValue(String selValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE place2 = ?";
		final int SEC = 60;
	    final int MIN = 60;
	    final int HOUR = 24;
	    final int DAY = 30;
	    final int MONTH = 12;
		
	    String msg = "";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,selValue);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				long curTime = System.currentTimeMillis();
			    long regTime = rs.getTimestamp("reg_date").getTime();
			    long diffTime = (curTime - regTime) / 1000;
			    
			    if (diffTime < SEC) {
		    		// sec
		    		msg = "방금 전";
		    	} else if ((diffTime /= SEC) < MIN) {
		    		// min
		    		msg = diffTime + "분 전";
		    	} else if ((diffTime /= MIN) < HOUR) {
		    		// hour
		    		msg = (diffTime) + "시간 전";
		    	} else if ((diffTime /= HOUR) < DAY) {
		    		// day
		    		msg = (diffTime) + "일 전";
		    	} else if ((diffTime /= DAY) < MONTH) {
		    		// day
		    		msg = (diffTime) + "달 전";
		    	} else {
		    		msg = (diffTime) + "년 전";
		    	}

				
				
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				vo.setFormat_time(msg);
				
				studyArr.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return studyArr;
	}
	
	/*3개 다들어왔을때*/
	public ArrayList<StudyInfoVO> selectList(String content,String[] check, String selValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE ";
		
		if(check.length > 1){
			for(int i=0;i<check.length;i++){
				if(i == check.length-1){
					sql += "kind2 = '"+check[i]+"' and ";
				}else{
					sql += "kind2 = '"+check[i]+"' or ";
				}
			}
		}else {
			sql += "KIND2 = '"+check[0]+"' and ";
		}
		
		sql += "subject like '%"+content+"%' and place2 = '"+selValue+"'";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				
				studyArr.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return studyArr;
	}
	/*3개 메소드 끝*/
	
	/*2-3개 들어왔을때*/
	public ArrayList<StudyInfoVO> selectList(String[] check, String selValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE ";
		
		if(check.length > 1){
			for(int i=0;i<check.length;i++){
				if(i == check.length-1){
					sql += "kind2 = '"+check[i]+"' and ";
				}else{
					sql += "kind2 = '"+check[i]+"' or ";
				}
			}
		}else {
			sql += "KIND2 = '"+check[0]+"' and ";
		}
		
		sql += "place2 = '"+selValue+"'";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				
				studyArr.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return studyArr;
	}
	/*3개 메소드 끝*/
	
	
	/*2-2개 들어왔을때*/
	public ArrayList<StudyInfoVO> selectList(String content, String selValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE ";
		
		
		sql += "subject like '%"+content+"%' and place2 = '"+selValue+"'";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				
				studyArr.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return studyArr;
	}
	/*3개 메소드 끝*/
	
	
	/*2-1개 들어왔을때*/
	public ArrayList<StudyInfoVO> selectList(String content,String[] check) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE ";
		
		if(check.length > 1){
			for(int i=0;i<check.length;i++){
				if(i == check.length-1){
					sql += "kind2 = '"+check[i]+"' and";
				}else{
					sql += "kind2 = '"+check[i]+"' or ";
				}
			}
		}else {
			sql += "KIND2 = '"+check[0]+"' and ";
		}
		
		sql += "subject like '%"+content+"%'";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				
				studyArr.add(vo);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return studyArr;
	}
	/*3개 메소드 끝*/
	
	public ArrayList<StudyInfoVO> selectListAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudyInfoVO vo = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "select * from study_info";
		final int SEC = 60;
	    final int MIN = 60;
	    final int HOUR = 24;
	    final int DAY = 30;
	    final int MONTH = 12;
		
	    String msg = "";
	    
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				long curTime = System.currentTimeMillis();
			    long regTime = rs.getTimestamp("reg_date").getTime();
			    long diffTime = (curTime - regTime) / 1000;
			    
			    if (diffTime < SEC) {
		    		// sec
		    		msg = "방금 전";
		    	} else if ((diffTime /= SEC) < MIN) {
		    		// min
		    		msg = diffTime + "분 전";
		    	} else if ((diffTime /= MIN) < HOUR) {
		    		// hour
		    		msg = (diffTime) + "시간 전";
		    	} else if ((diffTime /= HOUR) < DAY) {
		    		// day
		    		msg = (diffTime) + "일 전";
		    	} else if ((diffTime /= DAY) < MONTH) {
		    		// day
		    		msg = (diffTime) + "달 전";
		    	} else {
		    		msg = (diffTime) + "년 전";
		    	}
			    
				
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt("num"));
				vo.setSubject(rs.getString("subject"));
				vo.setKind1(rs.getString("kind1"));
				vo.setKind2(rs.getString("kind2"));
				vo.setS_date(rs.getString("s_date"));
				vo.setE_date(rs.getString("e_date"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setDay(rs.getString("day"));
				vo.setPlace1(rs.getString("place1"));
				vo.setPlace2(rs.getString("place2"));
				vo.setPlace3(rs.getString("place3"));
				vo.setPeople(rs.getInt("people"));
				vo.setContent(rs.getString("content"));
				vo.setIp(rs.getString("ip"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setS_hour(rs.getString("s_hour"));
				vo.setS_minute(rs.getString("s_minute"));
				vo.setE_hour(rs.getString("e_hour"));
				vo.setE_minute(rs.getString("e_minute"));
				vo.setFormat_time(msg);
				studyArr.add(vo);
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		
		return studyArr;
		
	}
	
	public ArrayList<StudyInfoVO> listCheckAll(String[] check) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StudyInfoVO> studyArr = null;
		String sql = "";
		conn = getConnection();
		
		final int SEC = 60;
	    final int MIN = 60;
	    final int HOUR = 24;
	    final int DAY = 30;
	    final int MONTH = 12;
		
	    String msg = "";
		
		try {
			
			
			sql = "SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE ";
			
			
			if(check.length > 1){
				for(int i=0;i<check.length;i++){
					if(i == check.length-1){
						sql += "kind2 = '"+check[i]+"'";
					}else{
						sql += "kind2 = '"+check[i]+"' or ";
					}
				}
			}else {
				sql += "KIND2 = '"+check[0]+"'";
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			StudyInfoVO vo = null;
			while(rs.next()){
				long curTime = System.currentTimeMillis();
			    long regTime = rs.getTimestamp("reg_date").getTime();
			    long diffTime = (curTime - regTime) / 1000;
			    
			    if (diffTime < SEC) {
		    		// sec
		    		msg = "방금 전";
		    	} else if ((diffTime /= SEC) < MIN) {
		    		// min
		    		msg = diffTime + "분 전";
		    	} else if ((diffTime /= MIN) < HOUR) {
		    		// hour
		    		msg = (diffTime) + "시간 전";
		    	} else if ((diffTime /= HOUR) < DAY) {
		    		// day
		    		msg = (diffTime) + "일 전";
		    	} else if ((diffTime /= DAY) < MONTH) {
		    		// day
		    		msg = (diffTime) + "달 전";
		    	} else {
		    		msg = (diffTime) + "년 전";
		    	}
			   
			    
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt(1));
				vo.setKind2(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setReg_date(rs.getTimestamp(4));
				vo.setReadcount(rs.getInt(5));
				vo.setFormat_time(msg);
				
				studyArr.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		
		
		
		
		
		return studyArr;
	}
	
	public int getListAllCount(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			
			String sql = "select count(*) from study_info";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}

		return result;
	}
	
	public StudyInfoVO selectContent(String td) throws Exception{
		
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		StudyInfoVO vo = null;
		
		try {
			sql = "select subject,kind2,s_date,e_date,day,s_hour,s_minute,e_hour,e_minute,place1,place2,place3,people,content from study_info where num = ?";
						
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(td));
			rs =pstmt.executeQuery();
					
			
			if(rs.next()){
				
				vo = new StudyInfoVO();
				vo.setSubject(rs.getString("subject"));
				vo.setKind2(rs.getString("kind2"));
				vo.setS_date(rs.getString("s_date"));
				vo.setE_date(rs.getString("e_date"));
				vo.setDay(rs.getString("day"));
				vo.setS_hour(rs.getString("s_hour"));
				vo.setS_minute(rs.getString("s_minute"));
				vo.setE_hour(rs.getString("e_hour"));
				vo.setE_minute(rs.getString("e_minute"));
				vo.setPlace1(rs.getString("place1"));
				vo.setPlace2(rs.getString("place2"));
				vo.setPlace3(rs.getString("place3"));
				vo.setPeople(rs.getInt("people"));
				vo.setContent(rs.getString("content"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		
		
		return vo;
		
		
	}
	
	public void updateReadCount(String td){
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		String sql = "update study_info set readcount = readcount+1 where num=?";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(td));
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	
	
	
}
