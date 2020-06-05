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

/**
 * Servlet implementation class ReviewSearchServlet
 */
@WebServlet(name = "ReviewSearch", urlPatterns = { "/reviewSearch" })
public class ReviewSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		
		ArrayList<Review> list =null;
		
		
		if(type.equals("id")) {
			ReviewPageData pd = new ReviewService().serchIdMember(reqPage,keyword, type);
			request.setAttribute("list", pd.getList());
			request.setAttribute("pageNavi", pd.getPageNavi());
		}else {
			ReviewPageData pd = new ReviewService().serchContentMember(reqPage, keyword, type);		
			request.setAttribute("list", pd.getList());
			request.setAttribute("pageNavi", pd.getPageNavi());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/reviewList.jsp");
		
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
