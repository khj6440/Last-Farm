package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;
import mypage.model.service.MypageService;
import sell.model.vo.Sell;

/**
 * Servlet implementation class PresentMoreServlet
 */
@WebServlet(name = "PresentMore", urlPatterns = { "/presentMore" })
public class PresentMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PresentMoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int start = Integer.parseInt(request.getParameter("start"));
		String memberId = request.getParameter("writer");
		Member m = new MypageService().selectOneMember(memberId);
		ArrayList<Sell> list=null;	
		if(m.getMemberType()==2) {
			list = new MypageService().presentMore(start,memberId);
		}else if(m.getMemberType()==1){
			list = new MypageService().presentMore2(start, memberId);
			System.out.println("소비자 중리스트사이즈 : "+list.size());
		}else {
			System.out.println("둘다아님");
		}
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
