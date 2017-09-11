package study.studyAction;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyMemberDAO;

public class SignupFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		/*Date reg_date = new Date ( );
		System.out.println (reg_date);
		request.setAttribute("reg_date", reg_date);*/
		
		return "/ahn_jsp/signupForm.jsp";
	}

}
