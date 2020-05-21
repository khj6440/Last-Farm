package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet(name = "NoticeInsert", urlPatterns = { "/noticeInsert" })
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// multipart인지 확인
		if (!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "[enctype]확인");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
			return;
		}
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "imgs";
		// 파일 최대 크기 설정
		int maxSize = 10 * 1024 * 1024;
		// request -> MultipartRequest 파일 업로드 진행
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		String writer = mRequest.getParameter("writer");
		System.out.println("writer"+writer);
		String content = mRequest.getParameter("content");
		String title = mRequest.getParameter("title");
		String filename = mRequest.getOriginalFileName("filename");
		String filepath = mRequest.getOriginalFileName("filename");
		Notice n = new Notice();
		n.setNoticeContent(content);
		n.setNoticeTitle(title);
		//임시로 넣을 작성자
		n.setNoticeWriter(writer);
		n.setNoticeFilename(filename);
		n.setNoticeFilepath(filepath);
		// 비지니스로직 처리
		int result = new NoticeService().insertNotice(n);
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/noticeList?reqPage=1");
		if (result > 0) {
			request.setAttribute("msg", "등록 성공");

		} else {
			request.setAttribute("msg", "등록 실패");
		}
		
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
