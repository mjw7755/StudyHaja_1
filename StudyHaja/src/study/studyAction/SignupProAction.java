package study.studyAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyMemberDAO;
import studyModel.StudyMemberVO;

public class SignupProAction implements CommandAction {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		StudyMemberVO membervo = new StudyMemberVO();
		
		membervo.setName(request.getParameter("name"));
		membervo.setId(request.getParameter("id"));
		if(request.getParameter("passwd").equals(request.getParameter("passwd2"))){
			membervo.setPasswd(request.getParameter("passwd"));
		}
		membervo.setBirth(request.getParameter("birth"));
		membervo.setTel(request.getParameter("tel"));
		membervo.setEmail(request.getParameter("email"));
		membervo.setSex(request.getParameter("sex"));
		membervo.setFlag(1);
		membervo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		
		StudyMemberDAO memberdao = StudyMemberDAO.getInstance();
		memberdao.insertMember(membervo);
		return "/ahn/jsp/signupPro.jsp";
	}

}
