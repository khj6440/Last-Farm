package buy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import buy.model.dao.BuyDao;
import buy.model.vo.Buy;
import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import sell.model.vo.Sell;
import sellComment.model.dao.SellCommentDao;
import sellComment.model.vo.SellComment;
import sellComment.model.vo.SellViewData;

public class BuyService {

	public int updateSell(int sellNo, int type, int sellCount, int type2, String memberId, int sellCount2, int sellMax,
			String r1, String r2, Member m) {

		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		// 구매중인 갯수update
		int result1 = new SellCommentDao().updateSellCount(conn, sellNo, type, sellCount);
		// 구매완료했을때 max개수
//		int result2 = new SellCommentDao().updateSellCount2(conn, sellNo, type, sellMax, sellCount);

		// 판매글 정보 불러옴
		Sell s = new SellCommentDao().selectOneSell(conn, sellNo);
		ArrayList<SellComment> list = new SellCommentDao().selectCommentList(conn, sellNo);
		SellViewData svd = new SellViewData(s, list);
		
		// buy를 불러옴
		Buy b = new Buy();
		b.setBuyAmount(Integer.parseInt(r2));
		b.setBuyId(memberId);
		b.setBuyPayCode(r1);
		b.setBuySellNo(sellNo);
		// buy에 구매완료 insert
		int result3 = new BuyDao().insertBuy(conn, b);
		System.out.println(" buy에 구매완료 insert : " +result3);
		int result8 = new MemberDao().updateOneMember(conn, m);
		System.out.println("회원 배달주소지 변경 완료 : " +result8);
		int result4 = 0;
		int result5 = 0;
		int result6 = 0;
		int result7 = 0;
		if (svd.getS().getSellCount() == svd.getS().getSellMax()) {
			// 판매글 정보를 판매글 마감테이블로 insert
			 result4 = new BuyDao().insertSellEnd(conn, svd);
			
			// buy테이블 정보를 List에 가져옴
			ArrayList<Buy> list2 = new BuyDao().selectBuy(conn, b);
			// 구매신청테이블에 있던 정보들을 구매완료 테이블로 옮겨주는 로직
			Buy b1 = new Buy();
			
			for (int i = 0; i < list2.size(); i++) {
				b1.setBuyAmount(list2.get(i).getBuyAmount());
				b1.setBuyId(list2.get(i).getBuyId());
				b1.setBuyPayCode(list2.get(i).getBuyPayCode());
				b1.setBuySellNo(list2.get(i).getBuySellNo());
				result5 = new BuyDao().selectAllBuy(conn, b1);
			}
			
			System.out.println("정보들을 구매완료 테이블로 옮겨주는 로직 : "+result5);
			// 넘겨주고 난 후 해당하는 sellNo의 구매이력을 buyList에서 지워줌
			 result6 = new BuyDao().deleteBuyList(conn, sellNo);
			
			System.out.println("넘겨주고 난 후 해당하는 sellNo의 구매이력을 buyList에서 지워줌 : "+result6);
			result7 = new BuyDao().deleteSellPage(conn,sellNo);
			if(result1>0 && result3>0&&  result8>0 && result4>0 &&  result5>0 &&  result6>0 &&  result7>0 ) {
				JDBCTemplate.commit(conn);
				result =1;
			}else {
				JDBCTemplate.rollback(conn);
			}
		}else {
			if(result1>0 && result3>0 && result8>0) {
				JDBCTemplate.commit(conn);
				result =1;
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		
		JDBCTemplate.close(conn);
		
		return result;
	}
}
