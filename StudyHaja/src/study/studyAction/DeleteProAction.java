package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import studyBoardModel.*;

public class DeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO  dao = BoardDAO.getInstance();
		BoardVO vo = new BoardVO();
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		
		int check = dao.delete(Integer.parseInt(num), vo); 
		
		//저장
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return "/board/deletePro.jsp" ;
	}

}





