package study.studyAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyInfoDAO;
import studyModel.StudyInfoVO;
import studyModel.StudyMemberVO;

public class RegisterProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		StudyInfoVO studyvo= new StudyInfoVO();
		
		//studyvo.setNum(Integer.parseInt(request.getParameter("num")));
		studyvo.setSubject(request.getParameter("subject"));
		studyvo.setKind1(request.getParameter("kind1"));
		studyvo.setKind2(request.getParameter("kind2"));
		studyvo.setS_date(request.getParameter("s_date"));
		studyvo.setE_date(request.getParameter("e_date"));
		String[] arr = request.getParameterValues("day");
		String days="";
		for(String string:arr){
			days+= string+", ";
		}
		studyvo.setDay(days);
		studyvo.setPlace1(request.getParameter("place1"));
		studyvo.setPlace2(request.getParameter("place2"));
		studyvo.setPlace3(request.getParameter("place3"));
		studyvo.setPeople(Integer.parseInt(request.getParameter("people")));
		studyvo.setContent(request.getParameter("content"));
		String start_date="";
		studyvo.setS_hour(request.getParameter("s_hour"));
		studyvo.setS_minute(request.getParameter("s_minute"));
		studyvo.setE_hour(request.getParameter("e_hour"));
		studyvo.setE_minute(request.getParameter("e_minute"));
		studyvo.setReg_date(new Timestamp(System.currentTimeMillis()));
		studyvo.setIp(request.getRemoteAddr());
		
		StudyInfoDAO sdao = new StudyInfoDAO();
		sdao.insertStudyInfo(studyvo);
		
		return "/ahn_jsp/registerPro.jsp";
	}

}
