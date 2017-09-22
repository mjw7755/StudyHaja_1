package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import StudyJoinModel.memberJoinDAO;

public class MemberDeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//String page = "";
		request.setCharacterEncoding("utf-8");
		
		memberJoinDAO  dao = memberJoinDAO.getInstance();
		/*String num = request.getParameter("num");*/
		String id = request.getParameter("id");
		String pageNum = request.getParameter("pageNum");
		
		/*dao.delete(id);*/
		dao.delete(id);
		//dao.delete(Integer.parseInt(num));
		//저장
		/*request.setAttribute("num", num);*/
		request.setAttribute("id", id);
		request.setAttribute("pageNum", pageNum);
		
		return "/yong/jsp/DeletePro.jsp";
	}
}








