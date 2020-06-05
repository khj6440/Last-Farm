package reviewComment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewComment.model.service.reviewCommentService;

/**
 * Servlet implementation class ReviewCommentUpdateServlet
 */
@WebServlet(name = "ReviewCommentUpdate", urlPatterns = { "/reviewCommentUpdate" })
public class ReviewCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reviewCommentNo = Integer.parseInt(request.getParameter("reviewCommentNo"));
		String reviewCommentContent = request.getParameter("reviewCommentContent");
		
		
		int result = new reviewCommentService().commentUpdate(reviewCommentNo, reviewCommentContent);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "수정 성공");
		}else {
			request.setAttribute("msg", "수정 실패");
		}
		request.setAttribute("loc", "/reviewList?reqPage=1");
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
