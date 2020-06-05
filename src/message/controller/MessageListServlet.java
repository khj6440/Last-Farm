package message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.model.service.MessageService;
import message.model.vo.MessagePageData;

/**
 * Servlet implementation class MessageListServlet
 */
@WebServlet(name = "MessageList", urlPatterns = { "/messageList" })
public class MessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String check = request.getParameter("check");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String memberId = request.getParameter("memberId");
		System.out.println("servlet:"+memberId);
		MessagePageData mpd = new MessagePageData();
		if( check != null) {
			mpd = new MessageService().selectSendMsg(memberId,reqPage);
		} else {
			mpd = new MessageService().selectReceiveMsg(memberId,reqPage);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/message/messageList.jsp");
		request.setAttribute("list", mpd.getList());
		request.setAttribute("pageNavi", mpd.getPageNavi());
		request.setAttribute("check", check);
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
