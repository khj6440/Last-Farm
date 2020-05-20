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
 * Servlet implementation class AdminDelCommentServlet
 */
@WebServlet(name = "AdminDelComment", urlPatterns = { "/adminDelComment" })
public class AdminDelCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDelCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("타긴함?");
		String commentNo = request.getParameter("commentNo");
		String type = request.getParameter("type");
		StringTokenizer sT =  new StringTokenizer(commentNo, "/");
		ArrayList<String> checkList = new ArrayList<String>();
		while(sT.hasMoreTokens()) {
			checkList.add(sT.nextToken());
		}
		
		int result = new AdminService().deleteComment(checkList,type);
		
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
