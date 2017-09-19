package edu.kosta.roomAction;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import edu.kosta.roomModel.roomDAO;
import edu.kosta.roomModel.roomVO;

public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		roomDAO dao = null;
		roomVO vo = null;
		try{
			dao = roomDAO.getInstance();
			vo = dao.getDataDetail(num);
			
		} catch(Exception e){  e.printStackTrace();  }
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 7;
		int count = count = dao.getListAllCount();
		int number = count - (currentPage - 1) * pageSize;
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		//String[] arr_options = vo.getOptions().split(",");
		//request.setAttribute("options", "#" + arr_options);
		request.setAttribute("list", vo);
		
		
		return "/jsp/Room2.jsp";
	}

}
