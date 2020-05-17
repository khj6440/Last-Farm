package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.ReviewPageData;
import admin.model.vo.SellPageData;

/**
 * Servlet implementation class ManageReviewServlet
 */
@WebServlet(name = "ManageReview", urlPatterns = { "/manageReview" })
public class ManageReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		int reqCount= 10;
		if(request.getParameter("reqCount")!=null) {
			reqCount=Integer.parseInt(request.getParameter("reqCount"));
		}
		request.setAttribute("reqCount", reqCount);
		
		
		ReviewPageData pd = new AdminService().selectReviewList(reqPage,reqCount);
		
		RequestDispatcher rd =null;
		if(pd.getList().isEmpty() && pd.getTotalCount()!=0) {
			System.out.println("전페이지 요청");
			rd =request.getRequestDispatcher("/manageReview?reqCount="+reqCount+"&reqPage="+(reqPage-1));
		}else {
			rd = request.getRequestDispatcher("/WEB-INF/views/admin/manageReview.jsp");
		}
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
