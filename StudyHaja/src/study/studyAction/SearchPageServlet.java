package study.studyAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.ReplyDAO;
import studyModel.ReplyVO;
import studyModel.StudyInfoDAO;
import studyModel.StudyInfoVO;

/**
 * Servlet implementation class SearchPageServlet
 */
@WebServlet("/searchPageServlet")
public class SearchPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		
		String[] check = request.getParameterValues("check");
		String td = request.getParameter("td");
		String selValue = request.getParameter("selValue");
		String subject = request.getParameter("subject");
		String replyContent = request.getParameter("replyContent");
		
		String subSearch = request.getParameter("subSearch");
		
		
		/*StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectListAll();*/
		if(subject != null && check != null && selValue != null){
			System.out.println("1-1");
			response.getWriter().write(getJSON(subject,check,selValue));
		}else if(subject != null && check != null && selValue == null){
			System.out.println("1-2");
			response.getWriter().write(getJSON(subject,check));
		}else if(subject != null && check == null && selValue != null){
			System.out.println("1-3");
			response.getWriter().write(getJSON(subject,selValue));
		}else if(subject == null && check != null && selValue != null){
			System.out.println("1-4");
			response.getWriter().write(getJSON(check,selValue));
		}
		
		
		if(replyContent == null){
			replyContent = null;
		}else {
			try {
				System.out.println(replyContent);
				response.getWriter().write(getJSONReplyContent(replyContent));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(selValue == null){
			selValue = null;
			
		}else {
			try {
				System.out.println("1");
				System.out.println(selValue);
				response.getWriter().write(getJSONselValue(selValue));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(subject == null ){
			subject = null;
		}else {
			System.out.println("2");
			System.out.println(subSearch);
			System.out.println(subject);
			response.getWriter().write(getJSONsearch(subject,subSearch));
		}
		
		if(check == null){
			check = null;
		}else{
			try {
				System.out.println("3");
				System.out.println(check);
				response.getWriter().write(getJSONC(check));
				System.out.println(getJSONC(check));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(td == null){
			td = null;
		}else {
			try {
				
				response.getWriter().write(getJSONTd(td));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
	}
	
	public String getJSONsearch(String content,String subSearch) {
		if(content == null) content = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectListSearch(content,subSearch);
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}

	
	
	
	public String getJSON(String content) {
		if(content == null) content = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectList(content);
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
	public String getJSON(String content, String[] check, String selValue) {
		if(content == null) content = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectList(content,check,selValue);
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	public String getJSON(String content, String[] check) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectList(content,check);
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	public String getJSON(String content, String selValue) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectList(content,selValue);
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	public String getJSON(String[] check, String selValue) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectList(check,selValue);
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
	
	
	
	public String getJSONC(String[] check) throws SQLException {
		if(check == null) check = null;
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.listCheckAll(check);
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
	public String getJSONAll() throws SQLException {
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectListAll();
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
	public String getJSONTd(String td) throws Exception {
		if(td == null)td = null;
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		StudyInfoVO vo = studyDAO.selectContent(td);
		studyDAO.updateReadCount(td);
		
			result.append("[{\"value\": \""+ vo.getSubject()+"\"},");
			result.append("{\"value\": \""+ vo.getKind2()+"\"},");
			result.append("{\"value\": \""+ vo.getS_date()+"\"},");
			result.append("{\"value\": \""+ vo.getE_date()+"\"},");
			result.append("{\"value\": \""+ vo.getDay()+"\"},");
			result.append("{\"value\": \""+ vo.getS_hour()+"\"},");
			result.append("{\"value\": \""+ vo.getS_minute()+"\"},");
			result.append("{\"value\": \""+ vo.getE_hour()+"\"},");
			result.append("{\"value\": \""+ vo.getE_minute()+"\"},");
			result.append("{\"value\": \""+ vo.getPlace1()+"\"},");
			result.append("{\"value\": \""+ vo.getPlace2()+"\"},");
			result.append("{\"value\": \""+ vo.getPlace3()+"\"},");
			result.append("{\"value\": \""+ vo.getPeople()+"\"},");
			result.append("{\"value\": \""+ vo.getContent()+"\"}],");
		
		result.append("]}");
		return result.toString();
	}
	
	public String getJSONselValue(String selValue) throws SQLException {

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectListSelValue(selValue);
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
	
	public String getJSONReplyContent(String replyContent) throws SQLException {
			
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			ReplyDAO replyDAO = ReplyDAO.getInstance();
			replyDAO.insertReply(replyContent);
			ArrayList<ReplyVO> replyList = replyDAO.selectAllReply();
			for(int i=0;i<replyList.size();i++){
				result.append("[{\"value\": \""+ replyList.get(i).getId()+"\"},");
				result.append("{\"value\": \""+ replyList.get(i).getContent()+"\"}],");
			}
			result.append("]}");
			return result.toString();
		}

}
