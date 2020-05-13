package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class ChartersetEncodingFilter
 */
@WebFilter("/ChartersetEncodingFilter")
public class CharsetEncodingFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public CharsetEncodingFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("필터객체 소멸!");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// 서블릿 도착 전에 처리할 사전 작업
		System.out.println("사전작업");
		request.setCharacterEncoding("utf-8");
		HttpServletRequest req = (HttpServletRequest) request;
		// 어느 페이지 요청되는지 찾는 방법
		System.out.println("요청 url : " + req.getRequestURI());
		chain.doFilter(request, response);
		System.out.println("사후작업");
		// 서블릿에서 클라이언트로 응답 나기기 전 사후 작업
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("필터객체 생성");
	}

}
