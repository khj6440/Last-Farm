package sell.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sell.model.service.SellSearchService;
import sell.model.vo.Sell;

/**
 * Servlet implementation class SellSearchNationalServlet
 */
@WebServlet(name = "SellSearchNational", urlPatterns = { "/sellSearchNational" })
public class SellSearchNationalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellSearchNationalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		ArrayList<Sell> sellList = new ArrayList<Sell>();
		sellList = new SellSearchService().selectSellNationalList();
		if(sellList.isEmpty()) {
			System.out.println("실패");
		}
		System.out.println(sellList.get(0).getSellTitle());
		new Gson().toJson(sellList,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
