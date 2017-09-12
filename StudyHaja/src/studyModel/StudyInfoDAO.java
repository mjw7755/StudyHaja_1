package studyModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		String sql = "select num,kind2,subject,reg_date,readcount from study_info where content = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			rs = pstmt.executeQuery();
			studyArr = new ArrayList<StudyInfoVO>();
			
			while(rs.next()){
				vo = new StudyInfoVO();
				vo.setNum(rs.getInt("num"));
				vo.setKind2(rs.getString("kind2"));
				vo.setSubject(rs.getString("subject"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadcount(rs.getInt("readcount"));
				
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
}
