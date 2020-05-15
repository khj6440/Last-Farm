package question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import question.model.service.QuestionService;
import question.model.vo.Question;
import question.model.vo.QuestionPageData;

/**
 * Servlet implementation class QuestionUpdateFrmServlet
 */
@WebServlet(name = "QuestionUpdateFrm", urlPatterns = { "/questionUpdateFrm" })
public class QuestionUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int questionNo = Integer.parseInt(request.getParameter("questionNo"));
		Question question = new QuestionService().QuestionSearch(questionNo);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/questionUpdate.jsp");
		System.out.println(question.getQuestionContent());
		request.setAttribute("question", question);
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
