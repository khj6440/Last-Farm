package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import message.model.vo.Message;
import mypage.model.service.MypageService;
import sell.model.vo.Sell;
import sellEnd.model.vo.SellEnd;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet(name = "Mypage", urlPatterns = { "/mypage" })
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String memberId = request.getParameter("memberId");
		String memberId="user7";
		
		
		Member m = new MypageService().selectOneMember(memberId);
		ArrayList<Sell> buyList = new MypageService().getBuyList(memberId);
		ArrayList<SellEnd> buyEndList = new MypageService().getBuyEndList(memberId);
		
		ArrayList<Message> msgList = new MypageService().getMsgList(memberId);
		
		ArrayList<SellEnd> sellEndList = new MypageService().getSellEndList(memberId);
		ArrayList<Sell> sellList = new MypageService().getSellList(memberId);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
		request.setAttribute("m", m);
//		request.setAttribute("sellList", sellList);
//		request.setAttribute("sellEndList", sellEndList);
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
