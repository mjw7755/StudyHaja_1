package study.studyAction;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;

public class caferegisterformAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int num = 0, r_no= 1, re_step = 0, re_level = 0;
		
		request.setAttribute("pageNum", request.getAttribute("pageNum"));
		request.setAttribute("num", num);
		request.setAttribute("r_no", r_no);
		
		return "/ahn/jsp/caferegisterForm.jsp";		
	}

}
