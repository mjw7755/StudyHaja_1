/*package edu.kosta.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeDeleteForm_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/jsp/notice_deleteForm.jsp";
	}

}*/
package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeDeleteForm_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  String page = "";
	      request.setCharacterEncoding("utf-8");
	      
	      NoticeDAO  dao = NoticeDAO.getInstance();
	      String num = request.getParameter("num");
	      String pageNum = request.getParameter("pageNum");
	      
	      dao.delete(Integer.parseInt(num));
	      
	      //저장
	      request.setAttribute("num", num);
	      request.setAttribute("pageNum", pageNum);
	      
	      return "/ram/jsp/notice_deletePro.jsp" ;
	   }

}
