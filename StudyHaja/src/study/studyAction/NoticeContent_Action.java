package study.studyAction;

import java.text.SimpleDateFormat;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeContent_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String result =request.getParameter("result");
		
		int max_num=0;
		int min_num=0;
		if(result.equals("previous")){
			num--;
		}else if(result.equals("next")){
			num++;
		}else
			num=num;
		
		System.out.println("num : " + num);
		System.out.println("pageNum : " + pageNum);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		NoticeDAO dao = NoticeDAO.getInstance();
		
		
		NoticeVO vo = dao.getDataDetail(num); 
		NoticeVO vo2 = dao.getPreviousSubject(num);
		NoticeVO vo3 = dao.getNextSubject(num);
		
		max_num = dao.getMaxNum();
		min_num = dao.getMinNum();
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("vo", vo);		
		request.setAttribute("vo2", vo2);
		request.setAttribute("vo3", vo3);
		request.setAttribute("max_num",max_num);
		request.setAttribute("min_num", min_num);
		return "/ram/jsp/notice_content.jsp";
	}

}
