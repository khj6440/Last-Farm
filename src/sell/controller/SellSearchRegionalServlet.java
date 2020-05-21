package sell.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sell.model.service.SellCategoryService;
import sell.model.vo.SellCategoryPage;

/**
 * Servlet implementation class SellSearchRegionalServlet
 */
@WebServlet(name = "sellSearchRegional", urlPatterns = { "/sellSearchRegional" })
public class SellSearchRegionalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SellSearchRegionalServlet() {
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
//		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellSearchRegional.jsp");
//		rd.forward(request, response);
		

		int reqPage = 1;
		if (request.getParameter("reqPage") != null) {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));

		}
		String addr = "서울 강남구";
		if (request.getParameter("sido") != null && request.getParameter("gugun")!=null) {
			addr = request.getParameter("sido") + " " + request.getParameter("gugun");
		}
		String type1 = null;
		if (request.getParameter("type1") != null) {
			type1 = request.getParameter("type1");
		}
		String type2 = null;
		if (request.getParameter("type2") != null) {
			type2 = request.getParameter("type2");
		}
		String searchWord = null;
		if (request.getParameter("searchTypingBox") != null) {
			searchWord = request.getParameter("searchTypingBox");
		}
		String sortingTab = "마감시간 순";
		if(request.getParameter("sortingTab")!="마감시간 순") {
			sortingTab = request.getParameter("sortingTab");
		}
		SellCategoryPage scp = new SellCategoryService().sellSearchList(reqPage, addr, type1, type2, searchWord,
				sortingTab);
		if (scp.getSellList().isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "검색어와 일치하는 글이 없습니다.");
			request.setAttribute("loc", "/sellSearchRegional");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellSearchRegional.jsp");
			request.setAttribute("sellList", scp.getSellList());
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("pageNavi", scp.getPageNavi());
			rd.forward(request, response);
		}
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
