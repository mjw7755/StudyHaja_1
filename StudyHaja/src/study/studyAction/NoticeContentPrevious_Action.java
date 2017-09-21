package study.studyAction;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeContentPrevious_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		num--;
		
		String pageNum = request.getParameter("pageNum");
		
		System.out.println("num : " + num);
		System.out.println("pageNum : " + pageNum);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeVO vo = dao.getDataDetail(num); 
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("vo", vo);		
		
		return "/ram/jsp/notice_content.jsp";
	}

}
