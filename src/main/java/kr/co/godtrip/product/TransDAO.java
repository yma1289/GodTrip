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
	}//transproList() end
	
	
	public List<Map<String, Object>> transinfoList() {
		return sqlSession.selectList("product.transinfoList");
	}//transinfoList() end
	
	
	public void transinfoInsert(Map<String, Object> map) {
		sqlSession.insert("product.transinfoInsert", map);
	}//transinfoInsert() end
	
	
	public void transproInsert(Map<String, Object> map) {
		sqlSession.insert("product.transproInsert", map);
	}//transproInsert() end
	
	
	public void transproDelete(String transpro_code) {
		sqlSession.delete("product.transproDelete", transpro_code);
	}//transproDelete() end
	
	
	public void transRsvInsert(TransRsvDTO dto) {
		sqlSession.insert("product.transRsvInsert", dto);
	}//transproChoice() end
	
	
}//class end
