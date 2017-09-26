package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyBoardModel.BoardDAO;

public class DeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum"); 
		
		dao.delete(num);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", new Integer(pageNum));
		
		
		return "/board/deleteForm.jsp" ;
	}

	
	
	
	
	
	
}
