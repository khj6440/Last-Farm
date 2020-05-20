package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewPageData;
import reviewComment.model.vo.ReviewComment;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet(name = "ReviewList", urlPatterns = { "/reviewList" })
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
	
		ReviewPageData pd = new ReviewService().SelectList(reqPage);
		
		ArrayList<Review> r = pd.getList();
		ArrayList<ReviewComment> rc = pd.getList2();
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/reviewList.jsp");
		request.setAttribute("list", pd.getList());
		request.setAttribute("list2", pd.getList2());
		request.setAttribute("pageNavi", pd.getPageNavi());
		request.setAttribute("rp", reqPage);
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
