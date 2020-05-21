package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.NoticePageData;

/**
 * Servlet implementation class SearchNoticeServlet
 */
@WebServlet(name = "SearchNotice", urlPatterns = { "/searchNotice" })
public class SearchNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value= request.getParameter("type");
		NoticePageData npd = new NoticePageData();
		int reqPage = 1;
		if( request.getParameter("reqPage") != null) {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}
		if( value.equals("noticeNo")) {
			int noticeNo = Integer.parseInt(request.getParameter("keyword"));
			npd = new NoticeService().searchNo(noticeNo,reqPage);
			
		} else if( value.equals("noticeTitle")){
			String noticeTitle = request.getParameter("keyword");
			npd = new NoticeService().searchTitle(noticeTitle, reqPage);
			
		} else {
			
		}
		RequestDispatcher rd = null;
		
		if(reqPage == 0) {
			rd = request.getRequestDispatcher("WEB-INF/views/notice/noticeList.jsp?reqPage=1");
			
		}else {
			rd = request.getRequestDispatcher("WEB-INF/views/notice/noticeList.jsp?reqPage="+reqPage);
			
		}
		request.setAttribute("list", npd.getList());
		request.setAttribute("pageNavi", npd.getPageNavi());
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
