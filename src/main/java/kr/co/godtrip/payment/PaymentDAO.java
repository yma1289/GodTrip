package kr.co.godtrip.payment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	public PaymentDAO() {
		System.out.println("-----PaymentDAO() 객체생성됨");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
	
    //장바구니 삭제
	public void delete(String room_no) {
		sqlSession.delete("payment.delete",room_no);
	}
	
	public void roomDelete(String id) {
	      sqlSession.delete("payment.roomDelete", id);
	   }//roomDelete() end
	   
	   //교통장바구니 삭제
	   public void transDelete(String id) {
	      sqlSession.delete("payment.transDelete", id);
	   }//transDelete() end
	
	////////////
	//결제 정보
	
	public int insert(PaymentDTO dto) {
        return sqlSession.insert("payment.Infoinsert", dto);
    }
}
