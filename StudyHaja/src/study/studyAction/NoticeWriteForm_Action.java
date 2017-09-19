package study.studyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeWriteForm_Action implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = 0;
		
		request.setAttribute("num", num);
		
		return "/jsp/notice_writeForm.jsp";
	}

}
