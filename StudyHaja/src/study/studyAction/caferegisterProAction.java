package study.studyAction;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;
import edu.kosta.roomModel.roomDAO;
import edu.kosta.roomModel.roomVO;


public class caferegisterProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("utf-8");
				roomVO vo= new roomVO();

				vo.setNum(Integer.parseInt(request.getParameter("num")));
				System.out.println("1");
				vo.setR_no(Integer.parseInt(request.getParameter("r_no")));
				System.out.println("2");
				vo.setSubject(request.getParameter("subject"));
				System.out.println("3");
				vo.setImages(request.getParameter("images"));
				vo.setAddress(request.getParameter("address"));
				vo.setArea(request.getParameter("area"));
				
				vo.setLocation(request.getParameter("location"));
				vo.setPay(request.getParameter("pay"));
				vo.setOptions(request.getParameter("options"));
				vo.setC_day((request.getParameter("c_day")));
				vo.setWorking_hour(request.getParameter("working_hour"));
				vo.setWorking_hour2(request.getParameter("working_hour2"));
				vo.setContents(request.getParameter("contents"));
				vo.setTel(request.getParameter("tel"));
				vo.setSeats(request.getParameter("seats"));
				
				vo.setReg_date(new Timestamp(System.currentTimeMillis()));
				
				request.setAttribute("pageNum", request.getParameter("pageNum"));
				System.out.println(vo.getNum());
				System.out.println(request.getParameter("pageNum"));
				System.out.println("4");
				
				roomDAO dao = new roomDAO();
				
				dao.insertStudyCafe(vo);
				
				return "/ahn/jsp/caferegisterPro.jsp";
		
	}

}
