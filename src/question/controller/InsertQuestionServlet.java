package question.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet(name = "InsertQuestion", urlPatterns = { "/insertQuestion" })
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "자주묻는 질문 타입오류[enctype]");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
//			return;
//		}
		Question q = new Question();
		q.setQuestionTitle(request.getParameter("questionTitle"));
		q.setQuestionContent(request.getParameter("questionContent"));
		
		
		int result = new QuestionService().insertQuestion(q);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "등록 성공");
		}else {
			request.setAttribute("msg", "등록 실패");
		}
		request.setAttribute("loc", "/questionList?reqPage=1");
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
