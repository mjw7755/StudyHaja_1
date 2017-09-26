package study.studyAction;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import StudyJoinModel.MemberJoinVO;
import StudyJoinModel.memberJoinDAO;
import edu.kosta.roomModel.roomDAO;

public class MemberModifyFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		List list=null;
		memberJoinDAO memberdao =  memberJoinDAO.getInstance();
		
		list = memberdao.modifySelectAll(session.getAttribute("sessionid").toString());
		request.setAttribute("list", list);
		
		return "/ahn/jsp/memModifyForm.jsp";
	}

}
