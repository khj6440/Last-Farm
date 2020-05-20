package reviewComment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.QuestionPageData;
import review.model.service.ReviewService;
import review.model.vo.ReviewPageData;
import reviewComment.model.service.reviewCommentService;

/**
 * Servlet implementation class ReviewCommentServlet
 */
@WebServlet(name = "ReviewComment", urlPatterns = { "/reviewComment" })
public class ReviewCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String commentWriter = request.getParameter("commentWriter");
		String commentContent = request.getParameter("reviewCommentContent");
		int result = new reviewCommentService().insertComment(reviewNo, commentContent ,commentWriter);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "댓글 등록 성공");
		}else {
			//삭제 실패
			request.setAttribute("msg", "댓글 등록 실패");
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
