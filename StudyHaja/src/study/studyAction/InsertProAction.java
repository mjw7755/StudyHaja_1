package study.studyAction;


import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;
import edu.kosta.roomModel.*;


public class InsertProAction implements CommandAction {
	
	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		StudymemberVO vo = new StudymemberVO();
		//vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setName(request.getParameter("name"));
		vo.setId(request.getParameter("id"));
		vo.setPasswd(request.getParameter("passwd"));  
		vo.setEmail(request.getParameter("email"));
		vo.setSex(request.getParameter("sex"));
		vo.setHp(request.getParameter("hp"));
		vo.setAddr1(request.getParameter("addr1"));
		vo.setAddr2(request.getParameter("addr2"));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		vo.setFlag(0); // 가입만 한 초기상태
		
		
		StudymemberDAO dao = StudymemberDAO.getInstance();
		dao.insert(vo);
		
		return "/ahn/jsp/InsertPro.jsp";
	}

}
