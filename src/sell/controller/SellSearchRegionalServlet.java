package sell.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sell.model.service.SellCategoryService;
import sell.model.service.SellSearchService;
import sell.model.vo.SearchTab;
import sell.model.vo.Sell;
import sell.model.vo.SellCategoryPage;

/**
 * Servlet implementation class SellSearchRegionalServlet
 */
@WebServlet(name = "SellSearchRegional", urlPatterns = { "/sellSearchRegional" })
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
		int reqPage = 1;
		if( request.getParameter("reqPage")!=null) {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}
		SearchTab st = new SearchTab();
		if (request.getParameter("sido").equals("시/도 선택")) {
			st.setSido("서울");
			st.setGugun("강남구");
		} else {
			st.setSido(request.getParameter("sido"));
			st.setGugun(request.getParameter("gugun"));
		}
		st.setType1(request.getParameter("type1"));
		if (!request.getParameter("type1").equals("null")) {
			st.setType2(request.getParameter("type2"));
		}else {
			st.setType2(null);
		}
		if (request.getParameter("keyword").isEmpty()) {
			st.setKeyword(null);
		} else {
			st.setKeyword(request.getParameter("keyword"));
		}
		st.setSortingTab("마감시간순");
		if(request.getParameter("sortingTab")!=null) {
			if(!request.getParameter("sortingTab").equals("마감시간순")) {
				st.setSortingTab(request.getParameter("sortingTab"));
			}else {
				st.setSortingTab("마감시간순");
			}
		}
		System.out.println(reqPage);
		System.out.println("구군:"+st.getGugun());
		System.out.println("시도:"+st.getSido());
		System.out.println("타입1:"+st.getType1());
		System.out.println("타입2:"+st.getType2());
		System.out.println("키워드: "+st.getKeyword());
		System.out.println("탭:"+st.getSortingTab());

		SellCategoryPage scp = new SellCategoryService().search(reqPage,st);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellSearchRegional.jsp");
		request.setAttribute("list", scp.getSellList());
		System.out.println(scp.getSellList().size());
		request.setAttribute("pageNavi", scp.getPageNavi());
		request.setAttribute("st", st);
		request.setAttribute("reqPage", reqPage);
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
