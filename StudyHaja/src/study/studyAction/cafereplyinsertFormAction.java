package study.studyAction;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.roomModel.CafeReplyDAO;
import edu.kosta.roomModel.CafeReplyVO;

public class cafereplyinsertFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		String	replycontents = request.getParameter("replycontents");
		int num= Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int point = Integer.parseInt(request.getParameter("point"));
		response.getWriter().write(getJSONsearch(replycontents,num,point));
		//request.setAttribute("num", num);
		return "/ahn/jsp/roomList.jsp";
	}
	
	public String getJSONsearch(String replycontents, int num, int point) {
	      if(replycontents == null) replycontents = "";
	      StringBuffer result = new StringBuffer("");
	      result.append("{\"result\":[");
	      CafeReplyDAO DAO = new CafeReplyDAO();
	      
	      DAO.cafereplyInsert(replycontents, num, point);
	      
	      
	      ArrayList<CafeReplyVO> cafereply_arr = DAO.cafereplySelect(num);
	      
	      for(int i=0;i<cafereply_arr.size();i++){
	    	  
	         result.append("[{\"value\": \""+ cafereply_arr.get(i).getId()+"\"},");
	         result.append("{\"value\": \""+ cafereply_arr.get(i).getCafecontents()+"\"}],");
	      }
	      result.append("]}");
	      return result.toString();
	   }

}
