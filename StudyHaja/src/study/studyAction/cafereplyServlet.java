package study.studyAction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.roomModel.CafeReplyDAO;
import edu.kosta.roomModel.CafeReplyVO;

/**
 * Servlet implementation class cafereplyServlet
 */
@WebServlet("/cafereplyServlet")
public class cafereplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String	replycontents = request.getParameter("replycontents");
		int num= Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		System.out.println(replycontents);
		if(replycontents==null){
			replycontents = null;
		}else{
			response.getWriter().write(getJSONsearch(replycontents,num));			
		}
	}
	
	public String getJSONsearch(String replycontents, int num) {
		  
	

	      if(replycontents == null) replycontents = "";
	      StringBuffer result = new StringBuffer("");
	      result.append("{\"result\":[");
	      CafeReplyDAO DAO = new CafeReplyDAO();
	      
	      DAO.cafereplyInsert(replycontents, num);
	      
	      
	      ArrayList<CafeReplyVO> cafereply_arr = DAO.cafereplySelect(num);
	      
	      for(int i=0;i<cafereply_arr.size();i++){
	    	  
	         result.append("[{\"value\": \""+ cafereply_arr.get(i).getId()+"\"},");
	         result.append("{\"value\": \""+ cafereply_arr.get(i).getCafecontents()+"\"}],");
	      }
	      result.append("]}");
	      return result.toString();
	   }


}
