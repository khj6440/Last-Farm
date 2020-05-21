package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.model.service.ReviewService;
import review.model.vo.Review;
import sell.model.service.SellSearchService;
import sell.model.vo.Sell;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet(name = "ReviewInsert", urlPatterns = { "/reviewInsert" })
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "[enctype]확인");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
			return;
		}
		
		request.setCharacterEncoding("utf-8");
		//2. 변수에 값 저장
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"imgs";
		System.out.println(saveDirectory);
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	
		
		int sellEndNo = Integer.parseInt(mRequest.getParameter("sellEndNo"));
		String sellEndWriter = mRequest.getParameter("sellEndWriter");
		
		
		Review r = new Review();	
		r.setReviewTitle(mRequest.getParameter("reviewTitle"));
		r.setReviewWriter(mRequest.getParameter("reviewWriter"));
		r.setReviewContent(mRequest.getParameter("reviewContent"));
		r.setReviewScore(Integer.parseInt(mRequest.getParameter("reviewScore")));
		r.setReviewFilepath(mRequest.getFilesystemName("reviewFilepath"));
		
		System.out.println("title : "+r.getReviewTitle());
		System.out.println("Writer : "+r.getReviewWriter());
		System.out.println("content : "+r.getReviewContent());
		System.out.println("score : "+r.getReviewScore());
		System.out.println("fimepath :"+r.getReviewFilepath());
		
		int result = new ReviewService().insertReview(r, sellEndNo, sellEndWriter);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/close.jsp");
		if(result>0) {
			request.setAttribute("msg", "리뷰 등록 성공");
		}else {
			request.setAttribute("msg", "리뷰 등록 실패");
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
