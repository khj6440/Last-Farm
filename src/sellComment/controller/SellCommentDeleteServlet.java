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
 * Servlet implementation class SellCommentDeleteServlet
 */
@WebServlet(name = "SellCommentDelete", urlPatterns = { "/sellCommentDelete" })
public class SellCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
	
		int sc = Integer.parseInt(request.getParameter("sellCommentNo"));
		int sc1 = Integer.parseInt(request.getParameter("sellRef"));
//		SellComment sc = new SellComment();
//		sc.setSellCommentNo(Integer.parseInt(request.getParameter("sellCommentNo")));
//		sc.setSellCommentRef(Integer.parseInt(request.getParameter("sellRef")));
		
		
		int result = new SellCommentService().sellCommentDelete(sc);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "삭제되었습니다.");
		}else {
			request.setAttribute("msg", "삭제 실패");
		}
		request.setAttribute("loc", "/sellView?sell_no="+sc1);
		
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
