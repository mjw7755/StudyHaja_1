package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;
import edu.kosta.roomModel.roomDAO;
import edu.kosta.roomModel.roomVO;



public class cafeupdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int num=0; 
		
		num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		roomVO vo = null;
		try{
		roomDAO dao = roomDAO.getInstance();
		
		
		vo = dao.update(num);
		
		}catch(Exception e){e.printStackTrace();}
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("list", vo);
		
		return "/ahn/jsp/cafeupdateForm.jsp";	
	}

}
