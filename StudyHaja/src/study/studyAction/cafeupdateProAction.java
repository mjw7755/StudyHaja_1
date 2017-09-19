package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;
import edu.kosta.roomModel.roomDAO;
import edu.kosta.roomModel.roomVO;

public class cafeupdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		roomVO vo = new roomVO();
		
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		//vo.setR_no(Integer.parseInt(request.getParameter("r_no")));
		vo.setSubject(request.getParameter("subject"));
		vo.setImages(request.getParameter("images"));
		vo.setAddress(request.getParameter("address"));
		vo.setArea(request.getParameter("area"));
		vo.setLocation(request.getParameter("location"));
		vo.setPay(request.getParameter("pay"));
		vo.setOptions(request.getParameter("options"));
		vo.setC_day((request.getParameter("c_day")));
		vo.setWorking_hour(request.getParameter("working_hour"));
		vo.setContents(request.getParameter("contents"));
		vo.setTel(request.getParameter("tel"));
		vo.setSeats(request.getParameter("seats"));
		
		roomDAO dao = roomDAO.getInstance();
		
		int check = dao.update(vo);
		
		if(check==1){
			request.setAttribute("result", 1);
		}
		else{
			request.setAttribute("result", 0);
		}
		
		System.out.println(check);
		request.setAttribute("num", vo.getNum());
		request.setAttribute("pageNum", request.getParameter("pageNum"));
		return "/jsp/cafeupdatePro.jsp";
	}

}
