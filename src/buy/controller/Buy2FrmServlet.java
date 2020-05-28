package buy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import sell.model.vo.Sell;

/**
 * Servlet implementation class Buy2FrmServlet
 */
@WebServlet(name = "Buy2Frm", urlPatterns = { "/buy2Frm" })
public class Buy2FrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buy2FrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sellNo = Integer.parseInt(request.getParameter("sell_no"));
		String sellName = request.getParameter("sell_name");
		int type = Integer.parseInt(request.getParameter("type"));
		int sellPrice = Integer.parseInt((request.getParameter("sell_price")));
		int deliveryFee = Integer.parseInt(request.getParameter("sell_delivery_fee"));
		int sellCount = Integer.parseInt(request.getParameter("sell_count"));
		int sellMax = Integer.parseInt(request.getParameter("sell_max"));
		String sellRegionalAddr = request.getParameter("sell_regional_addr");
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/buy/buy2.jsp");
		request.setAttribute("sellNo", sellNo);
		request.setAttribute("sellName", sellName);
		request.setAttribute("type", type);
		request.setAttribute("sellPrice", sellPrice);
		request.setAttribute("deliveryFee", deliveryFee);
		request.setAttribute("sellCount", sellCount);
		request.setAttribute("sellMax", sellMax);
		request.setAttribute("sellRegionalAddr", sellRegionalAddr);
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
