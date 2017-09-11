package study.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.studyAction.CommandAction;

public class StudyController extends HttpServlet {
private Map commandMap = new HashMap();
	
	// 초기화 - 1회 호출됨
	// 명령어와 명령어 처리 클래스가 매핑되어 있는 properties 파일을 읽어 들이는 역할
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("StudyConfig");
		System.out.println(props);
		Properties pr = new Properties();
		FileInputStream f = null;
		
		try {
			// commandBoard.properties 파일의 내용을 읽어옴
			f = new FileInputStream(props);
			// commandBoard.properties 파일의 정보를 Properties 객체에 저장
			pr.load(f);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if( f != null) try{ f.close();}catch(Exception e){e.printStackTrace();}
		}
		
		Iterator key = pr.keySet().iterator();
		
		while(key.hasNext()){
			String command = (String)key.next();
			String value= pr.getProperty(command);
			
			try {
				Class className = Class.forName(value);
				
				Object instance = className.newInstance();
				
				commandMap.put(command, instance); //put(key, value)
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = null;
		CommandAction action = null;
		
		try {
			String command = request.getRequestURI();
			System.out.println("command : "+ command); //command : /web06_boardMVC/
			System.out.println("request.getContextPath() : "+request.getContextPath());

			if(command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length() + 1); //web06_boardMVC
			}
			
			action = (CommandAction)commandMap.get(command);
			System.out.println("action : "+action);
			System.out.println(action);
			view = action.process(request, response);
			System.out.println("view : "+view);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//request.setAttribute("CONTENT", view);
		
		request.setAttribute("CONTENT", view);
		RequestDispatcher dp = request.getRequestDispatcher("/templet/templet.jsp");
		dp.forward(request, response);
	}
}
