package sell.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sell.model.service.SellSearchService;
import sell.model.vo.Sell;
import sell.model.vo.SellCategoryPage;

/**
 * Servlet implementation class SellSearchNationalFrmServlet
 */
@WebServlet(name = "SellFrm", urlPatterns = { "/sellFrm" })
public class SellFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		String page = request.getParameter("sell_no");
		ArrayList<Sell> list = new SellSearchService().selectSellNationalList(page);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellPage.jsp");
		request.setAttribute("sellpage",list);
		System.out.println(list);
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
