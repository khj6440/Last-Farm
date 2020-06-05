package common;

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

/**
 * Servlet implementation class MainServlet
 */
@WebServlet(name = "Main", urlPatterns = { "/main" })
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인에 보여질 전체 9개 지역 9개의 판매 list 가져오기
		
		
		/*ArrayList<Sell> listNation = new SellSearchService().selectList(1);
		ArrayList<Sell> listRegion = new SellSearchService().selectList(2);*/
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/main.jsp");
		/*request.setAttribute("listNation", listNation);
		request.setAttribute("listRegion", listRegion);*/
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
