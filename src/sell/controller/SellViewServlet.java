package sell.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import sellComment.model.service.SellCommentService;
import sellComment.model.vo.SellViewData;

/**
 * Servlet implementation class SellViewServlet
 */
@WebServlet(name = "SellView", urlPatterns = { "/sellView" })
public class SellViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
				request.setCharacterEncoding("utf-8");
				//2. 변수에 값 저장
				int sellNo = Integer.parseInt(request.getParameter("sell_no"));
				String sellWriter = request.getParameter("sell_writer");
				//3. 비즈니스 로직
				SellViewData svd = new SellCommentService().selectOneSell(sellNo); //기존에 n만 넘기던 것을 댓글이 추가되면서 list도 넘기게 된다
				Member m = new SellCommentService().selectOneWriter(sellWriter);
				//4. 결과처리
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellPage.jsp");
				request.setAttribute("s", svd.getS());
				request.setAttribute("list", svd.getList());
				request.setAttribute("m", m);
				//svd 자체를 넘겨주어도 된다.
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
