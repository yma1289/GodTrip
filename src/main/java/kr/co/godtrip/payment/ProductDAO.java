package kr.co.godtrip.payment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductDAO {
	
	@Autowired
    SqlSession sqlSession;
	
   

}
