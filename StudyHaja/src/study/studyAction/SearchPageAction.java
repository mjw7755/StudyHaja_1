package study.studyAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.ReplyDAO;
import studyModel.ReplyVO;
import studyModel.StudyInfoDAO;
import studyModel.StudyInfoVO;

public class SearchPageAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<StudyInfoVO> vo = new ArrayList<StudyInfoVO>();
		ArrayList<ReplyVO> replyVO = new ArrayList<ReplyVO>();
		int count = 0;
		
		StudyInfoDAO dao = StudyInfoDAO.getInstance();
		vo = dao.selectListAll();
		ReplyDAO replyDAO = ReplyDAO.getInstance();
		/*count =replyDAO.selectReplyAllCount();*/
		
		/*ReplyDAO replyDAO = ReplyDAO.getInstance();
		replyVO = replyDAO.selectAllReply(tdText);*/
		
		
		request.setAttribute("replyList", replyVO);
		request.setAttribute("list", vo);
		
		
		return "/jaewoong/jsp/searchPage.jsp";
	}

}
