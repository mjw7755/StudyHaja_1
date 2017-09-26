package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import StudyJoinModel.MemberJoinVO;
import StudyJoinModel.memberJoinDAO;

public class UsermodifyProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberJoinVO vo = new MemberJoinVO();
		HttpSession session = request.getSession();
		vo.setId(session.getAttribute("sessionid").toString());
		vo.setPasswd(request.getParameter("passwd"));
		vo.setHp(request.getParameter("hp"));
		vo.setEmail(request.getParameter("email"));
		vo.setAddr1(request.getParameter("addr1"));
		vo.setAddr2(request.getParameter("addr2"));
		
		memberJoinDAO dao = memberJoinDAO.getInstance();
		
		int check = dao.userModify(vo);
		
		if(check==1){
			request.setAttribute("result", 1);
		}
		else{
			request.setAttribute("result", -1);
		}
		
		
		return "/ahn/jsp/memModifyPro.jsp";
	}

}
