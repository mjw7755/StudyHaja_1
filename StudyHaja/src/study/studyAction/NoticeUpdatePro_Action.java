package study.studyAction;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeUpdatePro_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		NoticeVO vo = new NoticeVO();
		
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setWriter(request.getParameter("writer"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		int check = dao.update(vo);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num",vo.getNum());
		request.setAttribute("check", new Integer(check));
		
		return "/ram/jsp/notice_updatePro.jsp";
	}

}
