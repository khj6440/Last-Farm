package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

/**
 * Servlet implementation class AdminDelReviewServlet
 */
@WebServlet(name = "AdminDelReview", urlPatterns = { "/adminDelReview" })
public class AdminDelReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDelReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewNo = request.getParameter("reviewNo");
		System.out.println(reviewNo);
		StringTokenizer sT =  new StringTokenizer(reviewNo, "/");
		ArrayList<String> checkList = new ArrayList<String>();
		while(sT.hasMoreTokens()) {
			checkList.add(sT.nextToken());
		}
		int result = new AdminService().deleteReview(checkList);
		
		PrintWriter out  =response.getWriter();
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
