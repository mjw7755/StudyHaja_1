package study.studyAction;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeUpdateForm_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num= Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeVO vo = dao.update(num);
		
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		request.setAttribute("vo", vo);
		
		return "/jsp/notice_updateForm.jsp";
	}

}
