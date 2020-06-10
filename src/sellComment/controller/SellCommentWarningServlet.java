package sellComment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sellComment.model.service.SellCommentService;

/**
 * Servlet implementation class SellCommentWarningServlet
 */
@WebServlet(name = "SellCommentWarning", urlPatterns = { "/sellCommentWarning" })
public class SellCommentWarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellCommentWarningServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ref = Integer.parseInt(request.getParameter("sellRef"));
		int sellCommentNo = Integer.parseInt(request.getParameter("sellCommentNo"));
	      int sellCommentWarning = Integer.parseInt(request.getParameter("sellCommentWarning"));
	      
	      int result = new SellCommentService().commentWarning(sellCommentNo, sellCommentWarning);
	      RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
	      if(result>0) {
	         request.setAttribute("msg", "신고 성공");
	      }else {
	         request.setAttribute("msg", "신고 실패");
	      }
	      request.setAttribute("loc", "/sellView?sell_no="+ref);
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
