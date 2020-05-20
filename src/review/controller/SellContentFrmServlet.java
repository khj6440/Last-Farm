package review.controller;

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
import review.model.service.ReviewService;
import review.model.vo.Review;
import sellEnd.model.vo.SellEnd;

/**
 * Servlet implementation class SellContentFrmServlet
 */
@WebServlet(name = "SellContentFrm", urlPatterns = { "/sellContentFrm" })
public class SellContentFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellContentFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reviewRef = Integer.parseInt(request.getParameter("reviewBuyEndNo"));
		SellEnd s = new ReviewService().sellSearch(reviewRef);
		Member m = new ReviewService().memberScore(reviewRef);
		ArrayList<Review> list = new ReviewService().sellReview(reviewRef);
		int mem = m.getMemberScore();
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/sellReviewList.jsp");
		HttpSession session = request.getSession();
		session.setAttribute("sellEnd", s);
		session.setAttribute("memberScore", mem);
		request.setAttribute("list", list);
		request.setAttribute("loc", "/sellEnd");
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
