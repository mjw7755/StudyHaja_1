package study.studyAction;


import java.sql.Timestamp;

import java.text.SimpleDateFormat;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class ListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize = 5;
		/*SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");*/
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum="1";
		
		int currentPage = Integer.parseInt(pageNum);
		int count = 0, number=0;
		
		number = count - (currentPage - 1) * pageSize;
		
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeVO vo = new NoticeVO();
		list = dao.listAll();
		
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);
		/*request.setAttribute("sdf", sdf);*/
		System.out.println(list.get(0).getSubject());
		return "/ram/jsp/main_notice.jsp";
	}

	
	}
