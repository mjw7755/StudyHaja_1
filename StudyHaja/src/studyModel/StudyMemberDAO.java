package studyModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import studyModel.StudyMemberVO;
import studyModel.StudyMemberDAO;

import dbclose.util.CloseUtil;
public class StudyMemberDAO {
	private static StudyMemberDAO instance = new StudyMemberDAO();
	
	public static StudyMemberDAO getInstance() {
		return instance;
	}
	
	public StudyMemberDAO() {}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
//		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	}
	
	public int registerCheck(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from study_members where id= ?";
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()||id.equals("")){
				return 0;
			}
			else{
				return 1; // id 없음
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		
		return -1;//오류
	}
	
	
	public int insertMember(StudyMemberVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try{
			conn = getConnection();
			sb.append("insert into study_members(name, id, passwd, birth, sex, tel, email, flag, reg_date) " );
			sb.append(" values(?,?,?,?,?,?,?,?,?)" );
		
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getSex());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getEmail());
			pstmt.setInt(8, vo.getFlag());
			pstmt.setTimestamp(9, vo.getReg_date());
		
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
		return -1; //데이터베이스 오류
		
	}
}
