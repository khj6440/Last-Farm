
package member.controller;



import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import sell.model.service.SellSearchService;
import sell.model.vo.Sell;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.변수 값 저장
		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("pw");
		
		//3.비지니스 로직 처리
		Member m = new MemberService().selectOneMember(memberId,memberPw);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(m!=null) {
			if(m.getMemberStatus()==1) {
				HttpSession session = request.getSession();
				session.setAttribute("member", m);
				request.setAttribute("msg", "로그인 성공");
				request.setAttribute("loc", "/");
			}else if(m.getMemberStatus()==2) {
				request.setAttribute("msg", "관리자 문의(탈퇴 회원)");
				request.setAttribute("loc", "/");
			}else{
				request.setAttribute("msg", "관리자 문의(비활성화 회원)");
				request.setAttribute("loc", "/");
			}
		}
		else {
			request.setAttribute("msg", "ID,PW를 확인하세요.");
			request.setAttribute("loc", "/loginFrm");
		}
		//경로로 보내줌
		rd.forward(request, response);
		
				
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
