package study.studyAction;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;
import edu.kosta.roomModel.CafeReplyDAO;
import edu.kosta.roomModel.CafeReplyVO;
import edu.kosta.roomModel.roomDAO;
import edu.kosta.roomModel.roomVO;

public class roomContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		roomDAO dao = null;
		roomVO vo = null;
		CafeReplyVO replyvo = null;
		CafeReplyDAO replydao = null;
		ArrayList<CafeReplyVO> reply_arr = new ArrayList<CafeReplyVO>();
		try{
			dao = roomDAO.getInstance();
			replydao = CafeReplyDAO.getInstance();
			vo = dao.getDataDetail(num);
			
			reply_arr = replydao.cafereplySelect(num);
			
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
		request.setAttribute("reply_arr", reply_arr);
		
		return "/ahn/jsp/Room2.jsp";
	}

}
