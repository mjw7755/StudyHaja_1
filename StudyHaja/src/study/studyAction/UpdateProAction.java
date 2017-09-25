package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import studyBoardModel.*;

public class UpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");   // 업데이트시 한글 깨짐처리 
		
		String pageNum = request.getParameter("pageNum");
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = new BoardVO();
		
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setId(session.getAttribute("sessionid").toString());
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		
		
		int check = dao.update(vo);  //실제 변경 내용 반영 함수 호출
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);	 //jsp페이지로 pageNum이랑 check값들구가
			
		return "/board/updatePro.jsp";
	}

}
