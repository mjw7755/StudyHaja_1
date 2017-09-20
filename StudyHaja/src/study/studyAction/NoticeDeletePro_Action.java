/*package edu.kosta.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.Model.NoticeDAO;

public class NoticeDeletePro_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		NoticeDAO dao = NoticeDAO.getInstance();
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		int check= dao.delete(Integer.parseInt(num));
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		return "/jsp/notice_deletePro.jsp";
	}

}
*/
package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class NoticeDeletePro_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  String page = "";
	      
		  request.setCharacterEncoding("utf-8");
	      
	      NoticeDAO  dao = NoticeDAO.getInstance();
	      
	      String num = request.getParameter("num");
	      String pageNum = request.getParameter("pageNum");
	      
	      System.out.println("hi :" + num);
	      System.out.println("hello :" + pageNum);
	      
	      dao.delete(Integer.parseInt(num));
	      
	      //저장
	      request.setAttribute("num", num);
	      request.setAttribute("pageNum", pageNum);
	      
	      return "/ram/jsp/notice_deletePro.jsp" ;
	   }
	}


