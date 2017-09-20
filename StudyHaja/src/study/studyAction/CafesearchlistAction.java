package study.studyAction;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.roomModel.roomDAO;

public class CafesearchlistAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		roomDAO  dao = roomDAO.getInstance();
		int pageSize =9; //화면에 출력 레코드 수 
		int SU = pageSize-1;
		
		String pageNum = request.getParameter("pageNum");
		String searchlocation = request.getParameter("searchlocation");
		System.out.println("CafesearchlistAction : " +searchlocation);
		
		if( pageNum == null ) pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);  // 1
		System.out.println("1");
		int startRow = (currentPage * pageSize) - SU ;  // 1
		int endRow = (currentPage * pageSize) ;  // 7
		
		/*int endRow = (currentPage * pageSize) - SU ;  // 1
		int startRow = (currentPage * pageSize) ;  // 7
*/		
		int count = 0, number = 0;
		
		List list = null;
		count = dao.getListSearch(searchlocation); //전체 페이지 리턴...  //ex) 10
		System.out.println("count :" + count);											//1            7
		
		if( count > 0 ) {
			list = dao.selectsearchlist(Integer.parseInt(pageNum),searchlocation);  //레코드 목록 보기
		} else {
			list = Collections.EMPTY_LIST ;
		}
		
		//System.out.println(list.size());
		
	
		  //  9       	=		9   -  (1 - 1 ) * 7
		// 글목록에 표시 할 글번호 
		number = count - (currentPage - 1) * pageSize ;		 // ex) 9
		
		//해당 뷰에서 사용할 속성(저장)
		System.out.println("2");
		request.setAttribute("currentPage", new Integer(currentPage));
		System.out.println("3");
		request.setAttribute("startRow", new Integer(startRow));
		System.out.println("4");
		request.setAttribute("endRow", new Integer(endRow));
		System.out.println("5");
		request.setAttribute("count", new Integer(count));
		System.out.println("6");
		request.setAttribute("pageSize", new Integer(pageSize));
		System.out.println("7");
		request.setAttribute("number", new Integer(number));
		System.out.println("8");
		request.setAttribute("list", list);
		
		return "/ahn/jsp/roomList.jsp";
	}

}
