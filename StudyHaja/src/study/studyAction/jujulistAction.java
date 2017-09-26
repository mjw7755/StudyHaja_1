package study.studyAction;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import studyBoardModel.BoardDAO;


public class jujulistAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize =7; //?붾㈃??異쒕젰 ?덉퐫????
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		String pageNum = request.getParameter("pageNum");
		
		if( pageNum == null ) pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);  // 1
		int startRow = (currentPage * pageSize) - 6 ;  // 1
		int endRow = currentPage * pageSize ;  // 7
		int count = 0, number = 0;
		
		List list = null;
		BoardDAO  dao = BoardDAO.getInstance();
		count = dao.getListAllCount(); //?꾩껜 ?섏씠吏 由ы꽩...  //ex) 9
																//1            7
		if( count > 0 ) {
			list = dao.getSelectAll(startRow, endRow);  //?덉퐫??紐⑸줉 蹂닿린
		} else {
			list = Collections.EMPTY_LIST ;
		}
	
		  //  9       	=		9   -  (1 - 1 ) * 7
		// 湲紐⑸줉???쒖떆 ??湲踰덊샇 
		number = count - (currentPage - 1) * pageSize ;		 // ex) 9
		
		//?대떦 酉곗뿉???ъ슜???띿꽦(???
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		int check = 0;
		if(session.getAttribute("sessionid") != null) {
			check = 1;
		}else
			check = 0;
		
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);
		request.setAttribute("check", check);
				
		return "/board/list.jsp";
	}

}
