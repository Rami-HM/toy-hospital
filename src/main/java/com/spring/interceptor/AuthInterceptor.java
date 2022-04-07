package com.spring.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	// preHandel() : 컨트롤러 보다 먼저 수행되는 메소드
	// 예외를 제외한 모든 요청에 대해서 아래 메서드가 실행..!
	// 로그인 체크 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		// 1. 기존 session 정보를 가져옴
		HttpSession session = request.getSession();

		// 2. session에 있는 로그인 정보를 가져옴
		// session 의 반환값은 Object!
		Object obj = session.getAttribute("login"); // session의 key 값...!

		System.out.println("현재 실행중인 파일정보 : " + request.getRequestURI());
		// 로그인 되지 않은 상태라도 아래 두 URI에 대해서는 Controller로 이동하도록 예외등록...!

		List<String> exception = new ArrayList<String>();

		exception.add("/Emp");
		exception.add("/login");
		exception.add("/Center");
		exception.add("/Health");
		exception.add("/Content");

		for (String string : exception) {
			if (String.valueOf(request.getRequestURI()).indexOf(string) != -1)
				return true;
		}

		switch (request.getRequestURI()) {
		case "/":
		case "/echo":
		case "/login":
		case "/PDS/List":
			return true; // dispatcherservlet 실행하러 이동!
		}

		if (obj == null) { // 로그인되지 않았다면...!
			// dispatcherservlet 작동은 안하지만 단, 다시 위 switch문으로 이동하게 되어 로그인 페이지로 이동...!

			response.sendRedirect("/login");
			return false; // dispatcherservlet 작동 금지! }
		}

		// prehandel의 return의 의미는 컨트롤러 요청 uri로 가도 되나 안되나를 허가하는 의미
		// true : 컨트롤러 uri로 가게된다.
		return true;
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}

}
