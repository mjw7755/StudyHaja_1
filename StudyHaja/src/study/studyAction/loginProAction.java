package study.studyAction;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import StudyJoinModel.memberJoinDAO;

public class loginProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String id= request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String tel = request.getParameter("hp");
		String email = request.getParameter("email");
		
		String msg="";
		int result = 0;
		
		
		memberJoinDAO dao = new memberJoinDAO();
		
		result = dao.loginCheck(id, passwd);
		name = dao.getName(id);
		
		request.setAttribute("result", result);
		HttpSession session = request.getSession();
		System.out.println("name :" + name);
		session.setAttribute("memname",name);
		session.setAttribute("sessionid",id);
		session.setAttribute("memtel", tel);
		session.setAttribute("mememail", email);
		session.setAttribute("result", result);
		
		return "/ahn/jsp/loginPro.jsp";
	}

}
