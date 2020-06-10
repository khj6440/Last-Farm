package sellComment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sellComment.model.service.SellCommentService;
import sellComment.model.vo.SellComment;

/**
 * Servlet implementation class SellCommentInsertServlet
 */
@WebServlet(name = "SellCommentInsert", urlPatterns = { "/sellCommentInsert" })
public class SellCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SellComment sc = new SellComment();
		sc.setSellCommentLevel(Integer.parseInt(request.getParameter("sellCommentLevel")));
		sc.setSellCommentWriter(request.getParameter("sellCommentWriter"));
		sc.setSellCommentContent(request.getParameter("sellCommentContent"));
		sc.setSellRef(Integer.parseInt(request.getParameter("sellNo")));
		sc.setSellCommentRef(Integer.parseInt(request.getParameter("sellCommentRef")));
		//JAVA의 INT에는 NULL값이 들어갈 수 없다. 후처리 작업을 해주어야 함.
		//3. 비즈니스 로직
		int result = new SellCommentService().sellCommentInsert(sc);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0 ) {
			request.setAttribute("msg", "댓글이 등록되었습니다");
		} else {
			request.setAttribute("msg", "댓글 등록 실패");
		}
		//댓글을 작성하면 작성한 댓글의 게시글로 가진다.
		request.setAttribute("loc", "/sellView?sell_no="+sc.getSellRef());
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
