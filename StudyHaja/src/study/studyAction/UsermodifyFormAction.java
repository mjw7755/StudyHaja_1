package study.studyAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import StudyJoinModel.MemberJoinVO;
import StudyJoinModel.memberJoinDAO;


public class UsermodifyFormAction implements CommandAction {
	ArrayList<MemberJoinVO> list= null;

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("connection success1");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		memberJoinDAO memberdao =  memberJoinDAO.getInstance();
		System.out.println("connection success2");
		
		list = memberdao.modifySelectAll(session.getAttribute("sessionid").toString());
		
		request.setAttribute("list", list);
		
		return "/ahn/jsp/memModifyForm.jsp";
	}

}
