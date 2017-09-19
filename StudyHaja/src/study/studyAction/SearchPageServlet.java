package study.studyAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyInfoDAO;
import studyModel.StudyInfoVO;

/**
 * Servlet implementation class SearchPageServlet
 */
@WebServlet("/searchPageServlet")
public class SearchPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		
		String[] check = request.getParameterValues("check");
		String td = request.getParameter("td");
		/*String subject = request.getParameter("subject");*/
		String result = td;
		
		/*StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectListAll();*/
		
		
		
		/*if(subject == null){
			subject= null;
			System.out.println(subject);
			return;
		}else {
			response.getWriter().write(getJSON(subject));
			System.out.println(getJSON(subject));
		}*/
		
		
		if(td == null){
			td = null;
		}else {
			try {
				System.out.println(td);
				StudyInfoVO studyTdInfoList = studyDAO.selectContent(td);
				request.setAttribute("vo", studyTdInfoList);
				response.getWriter().write(studyTdInfoList+"");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		if(check == null){
			check = null;
		}else{
			try {
				response.getWriter().write(getJSONC(check));
				System.out.println(getJSONC(check));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
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
	
	/*public String getJSONTd(String td) throws Exception {
		if(td == null)td = null;
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = StudyInfoDAO.getInstance();
		System.out.println();
		ArrayList<StudyInfoVO> studyInfoList = studyDAO.selectContentAll(td);
		
		System.out.println(studyInfoList.toString() + "여기까지 왔지?");
		
		for(int i=0;i<studyInfoList.size();i++){
			result.append("[{\"value\": \""+ studyInfoList.get(i).getSubject()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getKind2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getS_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getE_date()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getDay()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getS_hour()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getS_minute()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getE_hour()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getE_minute()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getPlace1()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getPlace2()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getPlace3()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getPeople()+"\"},");
			result.append("{\"value\": \""+ studyInfoList.get(i).getContent()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}*/

}
