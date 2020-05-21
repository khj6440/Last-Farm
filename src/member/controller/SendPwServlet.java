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
 * Servlet implementation class SendPwServlet
 */
@WebServlet(name = "SendPw", urlPatterns = { "/sendPw" })
public class SendPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("id");
		String email = request.getParameter("email");
		String mailCode = new SendPw().mailSend(email);
		
		
		Member mPw = new MemberService().searchPw(memberId, email);
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if (mPw != null) {
			Member m = new Member();
			m.setMemberPw(mailCode);
			m.setMemberEmail(email);
			new MemberService().sendPw(m);
			request.setAttribute("msg", "인증번호=비밀번호 입니다. 정보를 변경해주세요");
			request.setAttribute("loc", "/");
			

		} else {
			request.setAttribute("msg", "성함 혹은 이메일을 확인해주세요");
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
