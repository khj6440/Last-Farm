package sell.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sellComment.model.service.SellCommentService;
import sellComment.model.vo.SellViewData;

/**
 * Servlet implementation class SellPageDelRequestServlet
 */
@WebServlet(name = "SellPageDelRequest", urlPatterns = { "/sellPageDelRequest" })
public class SellPageDelRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellPageDelRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int sellNo = Integer.parseInt(request.getParameter("sell_no"));
		int sellDel = Integer.parseInt(request.getParameter("sell_delete_state"));
		
		int result = new SellCommentService().selectOneSell(sellNo, sellDel);
				
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "글 삭제 요청이 접수되었습니다 ");
		} else {
			request.setAttribute("msg", "삭제 요청 실패");
		}
		
		request.setAttribute("loc", "/sellView?sell_no=4");
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
