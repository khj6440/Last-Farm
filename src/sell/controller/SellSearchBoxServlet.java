package sell.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sell.model.service.SellSearchService;
import sell.model.vo.Sell;
import sell.model.vo.SellCategoryPage;

/**
 * Servlet implementation class SellSearchNationalServlet
 */
@WebServlet(name = "SellSearchBox", urlPatterns = { "/sellSearchBox" })
public class SellSearchBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellSearchBoxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String searchWord = request.getParameter("searchTypingBox");
		String sortingTab = request.getParameter("sortingTab");
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		SellCategoryPage scp = new SellCategoryPage();
		if(searchWord=="") {
			sellList = new SellSearchService().selectSellNationalList();
		}else {
			scp = new SellSearchService().searchBoxSorting(reqPage, sortingTab, searchWord);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/sellPage/sellSearchNational.jsp");
		request.setAttribute("sellList", scp.getSellList());
		System.out.println(scp.getSellList().get(0).getSellNo());
		request.setAttribute("pageNavi", scp.getPageNavi());
		request.setAttribute("searchWord", searchWord);
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
