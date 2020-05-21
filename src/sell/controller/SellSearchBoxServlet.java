package sell.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sell.model.service.SellSearchService;
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
		
		int reqPage = 1;
		if(request.getParameter("reqPage") !=null) {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}
		String type1 = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		String searchWord = request.getParameter("searchTypingBox");
		String sortingTab = request.getParameter("sortingTab1");
		

			SellCategoryPage scp = new SellSearchService().sellEnd(reqPage,type1,type2,searchWord, sortingTab);	
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellSearchNational.jsp");
			request.setAttribute("sellList", scp.getSellList());
			request.setAttribute("pageNavi", scp.getPageNavi());
			rd.forward(request, response);
		
		
//		System.out.println(reqPage);
//		System.out.println(searchWord);
//		System.out.println(sortingTab);
		
		/*ArrayList<Sell> sellList = new ArrayList<Sell>();
		SellCategoryPage scp = new SellCategoryPage();
		
		if(searchWord=="") {
			sellList = new SellSearchService().selectSellNationalList();
		}else {
			scp = new SellSearchService().searchBoxSorting(reqPage, sortingTab, searchWord);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellSearchNational.jsp");
		request.setAttribute("sellList", scp.getSellList());
		request.setAttribute("sortingTab", sortingTab);
//		System.out.println(scp.getSellList().get(0).getSellNo());
		request.setAttribute("pageNavi", scp.getPageNavi());
		request.setAttribute("searchWord", searchWord);
		rd.forward(request, response);*/
	}

   

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
