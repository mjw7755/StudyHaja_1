package study.studyAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import StudyJoinModel.MemberJoinVO;
import StudyJoinModel.memberJoinDAO;
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
		String id = (String) request.getSession().getAttribute("sessionid");
		StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		String[] check = request.getParameterValues("check");
		String td = request.getParameter("td");
		String selValue = request.getParameter("selValue");
		String subject = request.getParameter("subject");
		String replyContent = request.getParameter("replyContent");
		String tdText = request.getParameter("tdText");
		String subSearch = request.getParameter("subSearch");
		String pid = request.getParameter("pid");
		String modText = request.getParameter("modText");
		String ppid = request.getParameter("ppid");
		String myid = request.getParameter("myid");
		/*StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectListAll();*/
		
		if(myid==null){
			
		}else {
			try {
				response.getWriter().write(getJSONmyList(myid));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(ppid==null){
			
		}else{
			try {
				response.getWriter().write(getJSONReplyDelete(ppid,tdText));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(pid==null && modText==null){
			
		}else {
			try {
				response.getWriter().write(getJSONReplyModify(pid,modText,tdText));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		if(replyContent == null){
			replyContent = null;
		}else {
			try {
				response.getWriter().write(getJSONReplyContent(replyContent,tdText,id));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(selValue == null){
			selValue = null;
		
		}else {
			try {
				response.getWriter().write(getJSONselValue(selValue));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(subject == null ){
			subject = null;
			
		}else {
			response.getWriter().write(getJSONsearch(subject,subSearch));
		}
		
		if(check == null){
			check= null;
			
		}else{
			try {
				response.getWriter().write(getJSONC(check));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
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
			result.append("{\"value\": \""+ studyInfoList.get(i).getFormat_time()+"\"},");
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
	
	
	
	
	public String getJSONC(String[] check) throws Exception {
		if(check == null) check = null;
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.listCheckAll(check);
		ReplyDAO replyDAO = ReplyDAO.getInstance();
		
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getFormat_time()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"},");
			result.append("{\"value\": \""+ replyDAO.selectReplyAllCount(studyInfoList.get(i).getNum()) +"\"}],");
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
	
	public String getJSONmyList(String myid) throws SQLException {
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectMyListAll(myid);
		ReplyDAO replyDAO = ReplyDAO.getInstance();
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getFormat_time()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"},");
			result.append("{\"value\": \""+ replyDAO.selectReplyAllCount(studyInfoList.get(i).getNum()) +"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
	public String getJSONTd(String td) throws Exception {
		if(td == null)td = null;
		StringBuffer result = new StringBuffer("");
		
		StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		StudyInfoVO vo = studyDAO.selectContent(td);
		studyDAO.updateReadCount(td);
		ReplyDAO reDAO = ReplyDAO.getInstance();
		ArrayList<ReplyVO> replyVO = reDAO.selectAllReply(td);
		memberJoinDAO memDAO = memberJoinDAO.getInstance();
		MemberJoinVO memVO = memDAO.selectTdMember(vo.getId());
		
		
		result.append("{\"result\":[");
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
			result.append("{\"value\": \""+ vo.getContent().replaceAll("\r\n", "<br>")+"\"}],");
		
		result.append("],\"tdText\":[");
		for(int i=0;i<replyVO.size();i++){
		result.append("[{\"value\": \""+ replyVO.get(i).getId()+"\"},");
		result.append("{\"value\": \""+ replyVO.get(i).getReply_num()+"\"},");
		result.append("{\"value\": \""+ replyVO.get(i).getContent()+"\"}],");
		}
		result.append("],\"tdMember\":[");
		result.append("[{\"value\": \""+ memVO.getName()+"\"},");
		result.append("{\"value\": \""+ memVO.getId()+"\"},");
		result.append("{\"value\": \""+ memVO.getHp()+"\"},");
		result.append("{\"value\": \""+ memVO.getEmail()+"\"}],");
		
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
			result.append("{\"value\": \""+ studyInfoList.get(i).getFormat_time()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReg_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getReadcount()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
	
	public String getJSONReplyContent(String replyContent, String tdText, String id) throws SQLException {
			
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			ReplyDAO replyDAO = ReplyDAO.getInstance();
			replyDAO.insertReply(replyContent,tdText,id);
			ArrayList<ReplyVO> replyList = replyDAO.selectAllReply(tdText);
			System.out.println("이거 -> "+replyList.get(0).getReply_num());
			
			for(int i=0;i<replyList.size();i++){
				result.append("[{\"value\": \""+ replyList.get(i).getId()+"\"},");
				result.append("{\"value\": \""+ replyList.get(i).getReply_num()+"\"},");
				result.append("{\"value\": \""+ replyList.get(i).getContent()+"\"}],");
			}
			result.append("]}");
			return result.toString();
		}
	
	public String getJSONReplyModify(String pid, String modText,String tdText) throws SQLException {
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ReplyDAO replyDAO = ReplyDAO.getInstance();
		int resultmod = replyDAO.replyModify(pid, modText);
		ArrayList<ReplyVO> replyList = replyDAO.selectAllReply(tdText);
		for(int i=0;i<replyList.size();i++){
			result.append("[{\"value\": \""+ replyList.get(i).getId()+"\"},");
			result.append("{\"value\": \""+ replyList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ replyList.get(i).getContent()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	public String getJSONReplyDelete(String ppid,String tdText) throws SQLException {
		System.out.println("dd");
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ReplyDAO replyDAO = ReplyDAO.getInstance();
		replyDAO.replyDelete(ppid);
		ArrayList<ReplyVO> replyList = replyDAO.selectAllReply(tdText);
		for(int i=0;i<replyList.size();i++){
			result.append("[{\"value\": \""+ replyList.get(i).getId()+"\"},");
			result.append("{\"value\": \""+ replyList.get(i).getNum()+"\"},");
			result.append("{\"value\": \""+ replyList.get(i).getContent()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}

}
