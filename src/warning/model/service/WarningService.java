package warning.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import reviewComment.model.dao.reviewCommentDao;
import warning.model.dao.WarningDao;
import warning.model.vo.Warning;

public class WarningService {

	public int WarningInsert(int PageNo, int warningType, String warningWriter) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new WarningDao().WarningInsert(conn,PageNo, warningType,warningWriter);
		int result2 = 0;
		int result3 = 0;
		if(result>0) {
		
			result2 = new WarningDao().warningCnt(conn,PageNo, warningType);
			if(warningType==1) {
			result3 = new ReviewDao().reviewWarning(conn, PageNo, result2);
			}else if(warningType==2){
			result3 = new reviewCommentDao().commentWarning(conn, PageNo, result2);
			}
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result3;
	}

	public ArrayList<Warning> SearchWarning(int review) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Warning> list = new WarningDao().SearchWarning(conn,review);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Warning> Search2Warning(int comment) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Warning> list = new WarningDao().Search2Warning(conn,comment);
		JDBCTemplate.close(conn);
		return list;
	}

}
