package notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;


/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet(name = "NoticeDelete", urlPatterns = { "/noticeDelete" })
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2.변수에 값저장
				int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
				// 3.비지니스로직
				Notice n = new Notice();
				n.setNoticeFilename(request.getParameter("oldFilename"));
				n.setNoticeFilepath(request.getParameter("oldFilepath"));
				n.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
				int result = new NoticeService().deleteNotice(noticeNo);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				if (result > 0) {
					if(n.getNoticeFilepath() != null) {
						String saveDirectory = getServletContext().getRealPath("/imgs");
						File delFile = new File(saveDirectory+n.getNoticeFilepath());
						boolean bool = delFile.delete();
					}
					request.setAttribute("msg", "해당 게시물이 삭제되었습니다.");
					request.setAttribute("loc", "/noticeList?reqPage=1");
				} else {
					request.setAttribute("msg", "게시물 삭제 실패!");
					request.setAttribute("loc", "/noticeView?noticeNo="+noticeNo);
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
