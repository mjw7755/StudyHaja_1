package study.studyAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import StudyJoinModel.memberJoinDAO;
import StudyJoinModel.MemberJoinVO;

@WebServlet("/IdCheckAction")
public class IdCheckAction extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		memberJoinDAO dao = memberJoinDAO.getInstance();
		int result = 0;
		
		try {
			result = dao.confirmId(id);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		PrintWriter pw = response.getWriter();
		if(result == 1){
			pw.println(result);
		
		}else{ 
			pw.println(result); 
		}
	}
}
