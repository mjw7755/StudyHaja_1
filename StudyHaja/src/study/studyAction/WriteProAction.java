package study.studyAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.roomModel.roomDAO;
import edu.kosta.roomModel.roomVO;


/*public class WriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		roomVO vo = new roomVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setSubject(request.getParameter("subject"));
		vo.setArea(request.getParameter("area"));  
		vo.setLocation(request.getParameter("location"));
		vo.setPay(request.getParameter("pay"));
		vo.setReadcount(Integer.parseInt(request.getParameter("readcount")));
		
		
		roomDAO dao = roomDAO.getInstance();
		dao.insert(vo);
		
		return "/board/writePro.jsp";
	}

}
*/