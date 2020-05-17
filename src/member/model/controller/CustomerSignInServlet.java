package member.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class CustomerSignInServlet
 */
@WebServlet(name = "CustomerSignIn", urlPatterns = { "/customerSignIn" })
public class CustomerSignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerSignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.인코딩-필터
		
	
		Member m = new Member();
		m.setMemberName(request.getParameter("name"));
		m.setMemberId(request.getParameter("id"));
		m.setMemberPhone(request.getParameter("phone"));
		m.setMemberPw(request.getParameter("pw"));
		m.setMemberEmail(request.getParameter("email"));
		m.setMemberCode(request.getParameter("code"));
		m.setMemberPostCode(request.getParameter("postAddr"));
		m.setMemberRoadAddr(request.getParameter("roadAddr"));
		m.setMemberDetailAddr(request.getParameter("detailAddr"));
		int result = new MemberService().insertMember(m);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if (result > 0) {
			request.setAttribute("msg", "회원가입 성공");
			request.setAttribute("loc", "/");
		} else {
			request.setAttribute("msg", "회원가입 실패");
			request.setAttribute("loc", "/");

		}
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
