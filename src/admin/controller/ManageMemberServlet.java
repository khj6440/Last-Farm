package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.MemberPageData;

/**
 * Servlet implementation class ManageMemberServlet
 */
@WebServlet(name = "ManageMember", urlPatterns = { "/manageMember" })
public class ManageMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		MemberPageData pd = new AdminService().selectMemberList(reqPage);

		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/manageMember.jsp");
		
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
