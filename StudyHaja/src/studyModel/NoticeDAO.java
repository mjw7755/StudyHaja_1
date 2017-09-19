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
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:NoticeDB");
		
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
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
			
			pstmt = conn.prepareStatement("select count(*) from notice");
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
		ArrayList list = null;
		
		try {
			conn = getConnection();
			StringBuffer sb = new StringBuffer();
			
			sb.append("select subject, reg_date,num from notice order by reg_date desc");
			
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			list = new ArrayList<NoticeVO>();
			NoticeVO vo = null;
			while(rs.next()){
				vo = new NoticeVO();
				vo.setSubject(rs.getString("subject"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setNum(rs.getInt("num"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		return list;
	}
	
	public int insert(NoticeVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		
		int num = vo.getNum();
		int number = 0;
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select max(num) from notice");
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				number = rs.getInt(1) + 1;
			}else {
				number = 1;
			}
			
			sb.append("insert into notice(num, writer, subject, content, reg_date) values(notice_num.nextval, ?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setTimestamp(4, vo.getReg_date());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		return 0;
	}
	
	public NoticeVO getDataDetail(int num){
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		NoticeVO vo = null;
		String sql ="";
			
			try {
				conn = getConnection();
				
				sql = "update notice set readcount = readcount + 1 where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeQuery();
				
				pstmt = conn.prepareStatement("select * from notice where num=?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
		
				if(rs.next()){
					vo = new NoticeVO();
					vo.setNum(rs.getInt("num"));
					vo.setWriter(rs.getString("writer"));
					vo.setSubject(rs.getString("subject"));
					vo.setReg_date(rs.getTimestamp("reg_date"));
					vo.setReadcount(rs.getInt("readcount"));
					vo.setContent(rs.getString("content"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				CloseUtil.close(rs); CloseUtil.close(pstmt);
			}
			
			return vo;
	}
	
	public NoticeVO update(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		NoticeVO vo = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from notice where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new NoticeVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setSubject(rs.getString("subject"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		return vo;
	}
	
	public int update(NoticeVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		int result = -1;
		
		try {
			conn = getConnection();
			pstmt= conn.prepareStatement("select * from notice where num = ?");
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			
			sql = "update notice set subject=? ";
					sql += " , content=? where num= ?";
					
					System.out.println(sql);
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, vo.getSubject());
					pstmt.setString(2, vo.getContent());
					pstmt.setInt(3, vo.getNum());
					
					pstmt.executeUpdate();
					result= 1;
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		return result;
	}
	
	public int delete(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("되니?");
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from notice where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pstmt = conn.prepareStatement("delete from notice where num = ?");
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
		}
		return result;
	}
}
