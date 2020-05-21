package buy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buy.model.service.BuyService;
import buy.model.vo.Buy;
import buyEnd.model.vo.BuyEnd;
import sellComment.model.service.SellCommentService;
import sellComment.model.vo.SellViewData;

/**
 * Servlet implementation class Buy3FrmServlet
 */
@WebServlet(name = "Buy3Frm", urlPatterns = { "/buy3Frm" })
public class Buy3FrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Buy3FrmServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String r1 = request.getParameter("imp_uid");// 결제 고유 Id
		String r2 = request.getParameter("paid_amount");// 결제 금액
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		int type = Integer.parseInt(request.getParameter("type"));
		String memberId = request.getParameter("memberId");
		int sellCount = Integer.parseInt(request.getParameter("sellCount"));
		int sellMax = Integer.parseInt(request.getParameter("sell_max"));
		
		int result = new BuyService().updateSell(sellNo,type,sellCount,type,memberId,sellCount,sellMax,r1,r2);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/buy/buy3.jsp");
		request.setAttribute("r1", r1);
		request.setAttribute("r2", r2);
		request.setAttribute("type", type);
							
		rd.forward(request, response);
						

			
		}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
