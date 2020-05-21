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
 * Servlet implementation class MessageInsert2Servlet
 */
@WebServlet(name = "MessageInsert2", urlPatterns = { "/messageInsert2" })
public class MessageInsert2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageInsert2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msgSendId = request.getParameter("msgSendId");
		String msgReceiveId = request.getParameter("msgReceiveId");
		String msgTitle = request.getParameter("msgTitle");
		String msgContent = request.getParameter("msgContent");
		
		Message m = new Message();
		m.setMsgContent(msgContent);
		m.setMsgReceiveId(msgReceiveId);
		m.setMsgSendId(msgSendId);
		m.setMsgTitle(msgTitle);
		
		int result = new MessageService().addMsg(m);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/close.jsp");
		if(result>0) {
			request.setAttribute("msg", "쪽지 보내기 성공");
		}else {
			request.setAttribute("msg", "쪽지 보내기 실패");
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
