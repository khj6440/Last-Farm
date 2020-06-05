package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.model.vo.Member;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet(name = "UpdateMember", urlPatterns = { "/updateMember" })
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = new Member();
		m.setMemberName(request.getParameter("name"));
		m.setMemberId(request.getParameter("id"));
		m.setMemberPhone(request.getParameter("phone"));
		m.setMemberPw(request.getParameter("pw"));
		m.setMemberEmail(request.getParameter("email"));
		m.setCompanyName(request.getParameter("company"));
		
		m.setMemberPostCode(request.getParameter("postCode1"));
		m.setMemberRoadAddr(request.getParameter("roadAddr1"));
		m.setMemberDetailAddr(request.getParameter("detailAddr1"));
		
		m.setMemberPostCode2(request.getParameter("postAddr2"));
		m.setMemberRoadAddr2(request.getParameter("roadAddr2"));
		m.setMemberDetailAddr2(request.getParameter("detailAddr2"));
		m.setBankName(request.getParameter("bankName"));
		m.setBankAccount(request.getParameter("bankAccount"));
		//3. 비지니스 로직
		int result=new MypageService().updateMember(m);
		
		System.out.println(m.getBankAccount());
		HttpSession session = request.getSession(false);
		session.setAttribute("m", m);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "변경되셨습니다.");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "관리자에게 문의주세요.");
			request.setAttribute("loc", "/mypage?memberId=" + m.getMemberId());
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
