package studyModel;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class ReplyDAO {
	
private static ReplyDAO instance = new ReplyDAO();
	
	public static ReplyDAO getInstance(){
		return instance;
	}
	
	public ReplyDAO(){	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");
		
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();
	}
	
	
	public void insertReply(String replyContent){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into Reply(id,content) values('mjw',?)";
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, replyContent);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ArrayList<ReplyVO> selectAllReply(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReplyVO vo = null;
		ArrayList<ReplyVO> voArr = new ArrayList<ReplyVO>();
		
		String sql = "select * from Reply";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				vo = new ReplyVO();
				vo.setId(rs.getString("id"));
				vo.setContent(rs.getString("content"));
				
				voArr.add(vo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		
		return voArr;
	}
}
