package sell.controller;

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

import sell.model.service.SellFormService;
import sell.model.vo.Sell;


/**
 * Servlet implementation class SellFormInsertServlet
 */
@WebServlet(name = "SellFormInsert", urlPatterns = { "/sellFormInsert" })
public class SellFormInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellFormInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "Check [enctype]");
			request.setAttribute("loc", "/photoList");
			rd.forward(request, response);
			return;
		}
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root+"/imgs";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		Sell s = new Sell();
		
		//시소
		//System.out.println(mRequest.getParameter("sellPrice"));
		//System.out.println(mRequest.getParameter("sellCategory1"));
		//System.out.println(mRequest.getParameter("sellCategory2"));
		//System.out.println(mRequest.getParameter("sellEndDate"));
		//System.out.println(Integer.parseInt(mRequest.getParameter("sellDeliveryFee")));
		//System.out.println(mRequest.getFilesystemName("thumbnail"));
		//System.out.println(mRequest.getParameter("sellType"));
		//객체에 입력
		s.setSellTitle(mRequest.getParameter("sellTitle"));
		s.setSellName(mRequest.getParameter("sellName"));
		s.setSellWriter(mRequest.getParameter("sellWriter"));
		s.setSellContent(mRequest.getParameter("sellContent"));
		s.setSellEndDate(java.sql.Date.valueOf(mRequest.getParameter("sellEndDate")));
		s.setSellMax(Integer.parseInt(mRequest.getParameter("sellMax")));
		s.setSellMin(Integer.parseInt(mRequest.getParameter("sellMin")));
		s.setSellPrice(Integer.parseInt(mRequest.getParameter("sellPrice")));
		s.setSellType(Integer.parseInt(mRequest.getParameter("sellType")));
		s.setSellCategory1(mRequest.getParameter("sellCategory1"));
		s.setSellCategory2(mRequest.getParameter("sellCategory2"));
		s.setSellDeliveryFee(Integer.parseInt(mRequest.getParameter("sellDeliveryFee")));
		s.setSellItemOrigin(mRequest.getParameter("sellItemOrigin"));
		s.setSellItemExpireDate(mRequest.getParameter("sellItemExpireDate"));
		s.setSellItemQuantity(mRequest.getParameter("sellItemQuantity"));
		s.setSellItemMaterial(mRequest.getParameter("sellItemMaterial"));
		s.setSellItemRule(mRequest.getParameter("sellItemRule"));
		s.setThumbnail(mRequest.getFilesystemName("thumbnail"));
		if(mRequest.getParameter("sellType")=="1"){
			s.setSellRegionalAddr(null);
		}else {
			s.setSellRegionalAddr(mRequest.getParameter("sellRegionalAddr"));
		}
		int result = new SellFormService().sellFormInsert(s);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "판매글 등록이 완료되었습니다.");
		}else {
			request.setAttribute("msg", "판매글 등록이 실패하였습니다. \n 처음부터 다시 등록해주세요.");
		}
		request.setAttribute("loc", "/sellSearchNationalFrm?reqPage=1&sortingTab=마감시간 순");
		rd.forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
