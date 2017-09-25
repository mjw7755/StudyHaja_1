package study.studyAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import studyBoardModel.*;


public class WriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		request.setCharacterEncoding("utf-8");
		BoardVO vo = new BoardVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setId(session.getAttribute("sessionid").toString());
		vo.setTitle(request.getParameter("title"));  
		vo.setContent(request.getParameter("content"));
		
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		vo.setRef(Integer.parseInt(request.getParameter("ref")));
		vo.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		vo.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		vo.setPath(request.getParameter("path"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.insert(vo);
		
		return "/board/writePro.jsp";
	}

}
