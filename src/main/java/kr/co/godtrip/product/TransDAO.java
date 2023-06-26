package kr.co.godtrip.product;

import java.util.HashMap;
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
	
	public List<Map<String, Object>> transproList(String arrival_code, String departure_Date) {
		Map<String, String> params = new HashMap<>();
		params.put("arrival_code", arrival_code);
		params.put("departure_Date", departure_Date);
		
		return sqlSession.selectList("product.transproList", params);
	}//transproList() end
	
	
	public List<Map<String, Object>> depCodeSelect(String arrival_code, String departure_Date, String departure_code) {
		Map<String, String> params = new HashMap<>();
		params.put("arrival_code", arrival_code);
		params.put("departure_Date", departure_Date);
		params.put("departure_code", departure_code);		
		
		return sqlSession.selectList("product.depCodeSelect", params);
	}//depCodeSelect() end
	
	
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
	
	
	public void transinfoDelete(String trans_code) {
		sqlSession.delete("product.transinfoDelete", trans_code);
	}//transinfoDelete() end
	
	
	public int transRsvInsert(TransRsvDTO dto) {
		return sqlSession.insert("product.transRsvInsert", dto);
	}//transproChoice() end
	
	/*
	public void transRsvInsert(TransRsvDTO dto) {
		sqlSession.insert("product.transRsvInsert", dto);
	}//transproChoice() end
	*/
		
	public void SeatChange(String transpro_code) {
		sqlSession.update("product.SeatChange", transpro_code);
	}//SeatChange() end

	
}//class end
