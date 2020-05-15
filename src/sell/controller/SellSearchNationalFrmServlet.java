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
@WebServlet(name = "SellSearchNationalFrm", urlPatterns = { "/sellSearchNationalFrm" })
public class SellSearchNationalFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellSearchNationalFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String sortingTab = request.getParameter("sortingTab");
		SellCategoryPage scp = new SellSearchService().selectList(reqPage, sortingTab);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/sellPage/sellSearchNational.jsp");
		request.setAttribute("sellList", scp.getSellList());
		System.out.println(scp.getSellList().get(0).getSellNo());
		request.setAttribute("pageNavi", scp.getPageNavi());
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
