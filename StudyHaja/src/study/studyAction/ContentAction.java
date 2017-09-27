package study.studyAction;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import studyBoardModel.*;


public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception  {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.getDataDetail(num); 
		
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		vo.setId(vo.getId());
		vo.setTemp_id((String)session.getAttribute("sessionid"));
		
		int check = dao.update(vo);
		
		session.getAttribute("sessionid");
		if(session.getAttribute("sessionid") == null) {
			check = -1;
		} else if(session.getAttribute("sessionid").equals("admin")){
			check = 2;
			if(vo.getId().equals(session.getAttribute("sessionid"))){
				check = 1;
			}
		}
		System.out.println("체크 값" + check);
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("vo", vo);	
		request.setAttribute("check", check);
		
		return "/board/content.jsp";
	}

}
