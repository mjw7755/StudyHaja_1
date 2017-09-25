package study.studyAction;

import java.sql.Timestamp;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeWritePro_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		System.out.print("세션 ID : " + session.getAttribute("sessionid"));
		
		request.setCharacterEncoding("utf-8");
		NoticeVO vo = new NoticeVO();
		
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setWriter(session.getAttribute("memname").toString());
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		vo.setId(session.getAttribute("sessionid").toString());
	
		NoticeDAO dao = NoticeDAO.getInstance();
		dao.insert(vo);
		
		return "/ram/jsp/notice_writePro.jsp";
	}

}
