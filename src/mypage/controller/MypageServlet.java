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
		
		
		String memberId = request.getParameter("memberId");
		Member m = new MypageService().selectOneMember(memberId);
		int totalCount = 0;
		int totalEndCount= 0;
				
				
		
		if(m.getMemberType()==1) {
			totalCount =new MypageService().totalBuy(memberId);
			totalEndCount = new MypageService().totalBuyEnd(memberId);
			System.out.println("소비자입니다");
		}else if(m.getMemberType()==2) {
			totalCount =new MypageService().totalSell(memberId);
			totalEndCount = new MypageService().totalSellEnd(memberId);
			System.out.println("판매자입니다");
		}else {
			System.out.println("관리자");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("totalEndCount", totalEndCount);
		rd.forward(request, response);
		
		
//		ArrayList<Message> msgList = new MypageService().getMsgList(memberId);
//		
//		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
//		request.setAttribute("m", m);
//		request.setAttribute("list", list);
//		request.setAttribute("endList", endList);
//		request.setAttribute("msgList", msgList);
//		rd.forward(request, response);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
