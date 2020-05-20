package member.controller;

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
 * Servlet implementation class SellerSignInServlet
 */
@WebServlet(name = "SellerSignIn", urlPatterns = { "/sellerSignIn" })
public class SellerSignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerSignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		Member m = new Member();
		m.setMemberName(request.getParameter("name"));
		m.setMemberId(request.getParameter("id"));
		m.setMemberPhone(request.getParameter("phone"));
		m.setMemberPw(request.getParameter("pw"));
		m.setMemberEmail(request.getParameter("email"));
		m.setMemberCode(request.getParameter("code"));
		m.setCompanyName(request.getParameter("company"));
		m.setMemberPostCode(request.getParameter("postCode1"));
		m.setMemberRoadAddr(request.getParameter("roadAddr1"));
		m.setMemberDetailAddr(request.getParameter("detailAddr1"));
		m.setMemberPostCode2(request.getParameter("postCode2"));
		m.setMemberRoadAddr2(request.getParameter("roadAddr2"));
		m.setMemberDetailAddr2(request.getParameter("detailAddr2"));
		m.setBankName(request.getParameter("bankName"));
		m.setBankAccount(request.getParameter("bankAccount"));
		
		int result = new MemberService().insertMemberSeller(m);
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
