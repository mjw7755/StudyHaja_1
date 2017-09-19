package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;
import edu.kosta.roomModel.roomDAO;

public class cafedeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  String page = "";
	      request.setCharacterEncoding("utf-8");
	      
	      roomDAO  dao = roomDAO.getInstance();
	      String num = request.getParameter("num");
	      String pageNum = request.getParameter("pageNum");
	      System.out.println("hi :" + num);
	      System.out.println("hello :" + pageNum);
	      
	      dao.delete(Integer.parseInt(num));
	      
	      //저장
	      request.setAttribute("num", num);
	      request.setAttribute("pageNum", pageNum);
	      
	      return "/ahn/jsp/cafedeletePro.jsp" ;
	   }

}
