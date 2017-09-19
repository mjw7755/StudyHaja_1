package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyBoardModel.*;

public class DeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO  dao = BoardDAO.getInstance();
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		
		int check = dao.delete(Integer.parseInt(num), request.getParameter("passwd")); 
		
		//저장
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return "/juju/board/deletePro.jsp" ;
	}

}





