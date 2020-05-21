package notice.controller;

import java.io.File;
import java.io.IOException;
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
 * Servlet implementation class NoticeModyInsertServlet
 */
@WebServlet(name = "NoticeModyInsert", urlPatterns = { "/noticeModyInsert" })
public class NoticeModyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("meg", "[enctype]확인");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return;
		}
		//파일저장 준비
		//1) 업로드 경로
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"imgs";
		//2)파일크기 저장
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest= new MultipartRequest(request, saveDirectory,maxSize,"utf-8",new DefaultFileRenamePolicy());
		Notice n = new Notice();
		n.setNoticeNo(Integer.parseInt(mRequest.getParameter("noticeNo")));
		n.setNoticeTitle(mRequest.getParameter("noticeTitle"));
		n.setNoticeContent(mRequest.getParameter("content"));
		n.setNoticeFilename(mRequest.getOriginalFileName("filename"));
		n.setNoticeFilepath(mRequest.getFilesystemName("filename"));
		//기존 파일관리를 위한 값 정하기
		String status = mRequest.getParameter("status");
		String oldFilename = mRequest.getParameter("oldFilename");
		String oldFilepath = mRequest.getParameter("oldFilepath");
		//기존파일값을 유지하기 위한 설정
		if(n.getNoticeFilename() == null) {
			if(status.equals("stay")) {
				n.setNoticeFilename(oldFilename);
				n.setNoticeFilepath(oldFilepath);
			}
			
		}
		int result = new NoticeService().noticeUpdate(n);
		
		if(result>0) {
			
			if(status.equals("delete" )) {
				File delFile = new File(saveDirectory + oldFilepath);
				delFile.delete();
			}
			request.setAttribute("msg", "수정성공!");
			
		} else {
			
			request.setAttribute("msg", "수정실패!");
		}
		request.setAttribute("loc", "/noticeView?noticeNo="+n.getNoticeNo());
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
