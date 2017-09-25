package edu.kosta.roomModel;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import studyModel.ReplyDAO;
import studyModel.ReplyVO;

public class CafeReplyDAO {

	private static CafeReplyDAO instance = new CafeReplyDAO();
	
	public static CafeReplyDAO getInstance(){
		return instance;
	}
	
	public CafeReplyDAO(){	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:BoardDB");
		
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();
	}
	
	public void cafereplyInsert( String replycontents, int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		CafeReplyVO vo = new CafeReplyVO();
		String sql = "insert into cafereply(id,cafecontents,reg_date,num) values (?,?,?,?)"; 
		//String sql2 = "select points from room where num = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "ahn"); //subject
			pstmt.setString(2, replycontents);
			pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(4,num);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				;
				if(pstmt!=null) CloseUtil.close(pstmt);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}

	public ArrayList<CafeReplyVO> cafereplySelect(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CafeReplyVO vo = null;
		ArrayList<CafeReplyVO> voArr = new ArrayList<CafeReplyVO>();
		
		String sql = "select * from cafereply where num = ? order by reg_date desc";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				vo = new CafeReplyVO();
				vo.setId(rs.getString("id"));
				vo.setCafecontents(rs.getString("cafecontents"));
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
