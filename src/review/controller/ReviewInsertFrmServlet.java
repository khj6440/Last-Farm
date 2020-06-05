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

import review.model.service.ReviewService;
import review.model.vo.Review;
import sellEnd.model.vo.SellEnd;

/**
 * Servlet implementation class ReviewInsertFrmServlet
 */
@WebServlet(name = "ReviewInsertFrm", urlPatterns = { "/reviewInsertFrm" })
public class ReviewInsertFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int sellEndNo = Integer.parseInt(request.getParameter("sellEndNo"));
		String sellEndWriter = request.getParameter("sellEndWriter");
	
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/notice/reviewInsert.jsp");
		HttpSession session = request.getSession();
		session.setAttribute("sellEndNo", sellEndNo);
		session.setAttribute("sellEndWriter", sellEndWriter);
		request.setAttribute("loc", "/");
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
