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
	
	
	
}
