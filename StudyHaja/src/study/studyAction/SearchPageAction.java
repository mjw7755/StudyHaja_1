package study.studyAction;

import java.io.PrintWriter;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyInfoDAO;
import studyModel.StudyInfoVO;


public class SearchPageAction implements CommandAction {

	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String content = request.getParameter("content");
		response.getWriter().write(getJSON(content));
		System.out.println("내용 : "+content);
		System.out.println("내용2 : "+getJSON(content));
		/*ArrayList<StudyInfoVO> vo = new ArrayList<StudyInfoVO>();
		StudyInfoDAO dao = StudyInfoDAO.getInstance();
		vo = dao.selectListAll();
		request.setAttribute("vo", vo);*/
		
		return "/jaewoong/jsp/searchPage.jsp";
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

	
	
}
