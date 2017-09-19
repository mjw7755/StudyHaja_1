package study.studyAction;

import java.text.SimpleDateFormat;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studyModel.NoticeDAO;
import studyModel.NoticeVO;

public class ListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize = 5;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeDAO dao = NoticeDAO.getInstance();
		list = dao.listAll();
		
		request.setAttribute("list", list);
		return "/ram/jsp/notice_view.jsp";
	}

}
