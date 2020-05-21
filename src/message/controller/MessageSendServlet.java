package message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.model.service.MessageService;
import message.model.vo.Message;

/**
 * Servlet implementation class MessageSendServlet
 */
@WebServlet(name = "MessageSend", urlPatterns = { "/messageSend" })
public class MessageSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Message msg = new Message();
		msg.setMsgContent(request.getParameter("msgContent"));
		msg.setMsgReceiveId(request.getParameter("msgReceiveId"));
		msg.setMsgSendId(request.getParameter("msgSendId"));
		msg.setMsgTitle(request.getParameter("msgTitle"));
		int result = new MessageService().messageSend(msg);
		RequestDispatcher rd = null;
		if( result != 0) {
			rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "쪽지 보내기 성공");
			request.setAttribute("loc", "/");
			
		}else {
			rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "쪽지 보내기 실패");
			request.setAttribute("loc", "/");
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
