package study.studyAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyInfoDAO;
import studyModel.StudyInfoVO;

public class SearchPageAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String content = request.getParameter("content");
		response.getWriter().write(getJSON(content));
		
		
		return null;
	}

	public String getJSON(String content) {
		if(content == null) content = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		StudyInfoDAO studyDAO = new StudyInfoDAO();
		ArrayList<StudyInfoVO> studyMemberList = studyDAO.selectList(content);
		for(int i=0;i<studyMemberList.size();i++){
			result.append("[{\"value\": \""+ studyMemberList.get(i).getNum()+"\"},");
		}
		return null;
	}

	
}
