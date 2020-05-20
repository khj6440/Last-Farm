package sell.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SellSearchRegionalServlet
 */
@WebServlet(name = "sellSearchRegionalFrm", urlPatterns = { "/sellSearchRegionalFrm" })
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String addr = request.getParameter("sido")+request.getParameter("gugun");
		String type1 = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		String searchWord = request.getParameter("searchTypingBox");
		String sortingTab = request.getParameter("sortingTab");
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/sell/sellSearchRegional.jsp");
		
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
