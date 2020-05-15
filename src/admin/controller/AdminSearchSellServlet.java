package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.SellPageData;

/**
 * Servlet implementation class AdminSearchSellServlet
 */
@WebServlet(name = "AdminSearchSell", urlPatterns = { "/adminSearchSell" })
public class AdminSearchSellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchSellServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searched = request.getParameter("search");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		
		int reqCount= 10;
		if(request.getParameter("reqCount")!=null) {
			reqCount=Integer.parseInt(request.getParameter("reqCount"));
		}
		request.setAttribute("reqCount", reqCount);
		
		
		
		SellPageData pd = new AdminService().searchSell(reqPage,reqCount,searched);

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/manageSell.jsp");

		request.setAttribute("list", pd.getList());
		request.setAttribute("pageNavi", pd.getPageNavi());
		request.setAttribute("totalPage", pd.getTotalPage());
		request.setAttribute("totalCount", pd.getTotalCount());
		
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