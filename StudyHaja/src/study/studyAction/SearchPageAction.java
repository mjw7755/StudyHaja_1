package study.studyAction;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.StudyMemberDAO;

public class SearchPageAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return "/jaewoong/jsp/searchPage.jsp";
	}

}
