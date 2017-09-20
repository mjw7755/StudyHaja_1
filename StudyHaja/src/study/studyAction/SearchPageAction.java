package study.studyAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyInfoDAO;
import studyModel.StudyInfoVO;

public class SearchPageAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<StudyInfoVO> vo = new ArrayList<StudyInfoVO>();
		
		StudyInfoDAO dao = StudyInfoDAO.getInstance();
		vo = dao.selectListAll();
		
		request.setAttribute("list", vo);
		
		
		return "/jaewoong/jsp/searchPage.jsp";
	}

}
