package warning.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.model.service.ReviewService;
import warning.model.service.WarningService;
import warning.model.vo.Warning;

/**
 * Servlet implementation class WarningServlet
 */
@WebServlet(name = "Warning", urlPatterns = { "/warning" })
public class WarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WarningServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int PageNo = Integer.parseInt(request.getParameter("PageNo"));
		int warningType = Integer.parseInt(request.getParameter("warningType"));
		String warningWriter = request.getParameter("memberId");
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		System.out.println("sellNo : "+sellNo);
		
		System.out.println("리뷰넘버 :"+PageNo);
		System.out.println("리뷰타입 :"+warningType);
		System.out.println("신고자 :"+warningWriter);
		System.out.println("글번호(신고된 글 번호) : "+sellNo);
		
		int result = new WarningService().WarningInsert(PageNo, warningType, warningWriter, sellNo);
		
	
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "신고 성공");
		}else {
			request.setAttribute("msg", "신고 실패");
		}
		if(warningType==1) {
		request.setAttribute("loc", "/reviewList?reqPage=1");
		}else if(warningType ==2) {
		request.setAttribute("loc", "/reviewList?reqPage=1");
		}else if(warningType==3) {
			request.setAttribute("loc", "/sellView?sell_no="+sellNo+"&sell_writer="+warningWriter);
		}else if(warningType ==4) {
			request.setAttribute("loc", "/sellView?sell_no="+sellNo+"&sell_writer="+warningWriter);
		}
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
