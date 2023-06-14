package kr.co.godtrip.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TransDAO {
	public TransDAO() {
		System.out.println("-----TransDAO()객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> transproList() {
		return sqlSession.selectList("product.transproList");
	}//list() end
	
	
	
}//class end
