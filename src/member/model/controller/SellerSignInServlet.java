package member.model.controller;

import java.io.IOException;
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
		m.setMemberPostCode(request.getParameter("postAddr"));
		m.setMemberRoadAddr(request.getParameter("roadAddr"));
		m.setMemberDetailAddr(request.getParameter("detailAddr"));
		
		int result = new MemberService().insertMember(m);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
