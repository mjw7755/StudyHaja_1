package studyModel;

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

public class NoticeDAO {

	private static NoticeDAO instance = new NoticeDAO();
	
	public static NoticeDAO getInstance(){
		return instance;
	}
	
	public NoticeDAO(){	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
//		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	}
	
	//notice_view페이지에서 사용할 레코드 갯수 얻어오는 메소드
	public int getListAllCount(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) from mvcnotice");
			rs = pstmt.executeQuery();
			
			if( rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		return count;
	}
	
	public ArrayList<NoticeVO> listAll() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeVO> list = null;
		
		try {
			conn = getConnection();
			StringBuffer sb = new StringBuffer();
			
			sb.append("SELECT SUBJECT, REG_DATE FROM MVCNOTICE");
			
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			list = new ArrayList<NoticeVO>();
			NoticeVO vo = null;
			while(rs.next()){
				vo = new NoticeVO();
				vo.setSubject(rs.getString("SUBJECT"));
				vo.setReg_date(rs.getTimestamp("REG_DATE"));
				/*System.out.println(rs.getString("subject"));
				System.out.println(rs.getTimestamp("reg_date"));*/

				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		
		return list;
	}
	
	
}
