package study.studyAction;

import java.sql.Timestamp;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeWritePro_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		NoticeVO vo = new NoticeVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setWriter(request.getParameter("writer"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		dao.insert(vo);
		
		return "/ram/jsp/notice_writePro.jsp";
	}

}
