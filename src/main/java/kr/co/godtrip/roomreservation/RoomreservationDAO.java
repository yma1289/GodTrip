package kr.co.godtrip.roomreservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository

public class RoomreservationDAO {

	@Autowired
    SqlSession sqlSession;
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("roomreservation.insert", map); 
	}//insert() end
	
	public List<Map<String, Object>> list(String room_code){
		return sqlSession.selectList("roomreservation.list", room_code);
	}//list() end
	
	public List<Map<String, Object>> transList(Object transpro_code, Object id){
		
		Map<Object, Object> params = new HashMap<>();
		params.put("transpro_code", transpro_code);
		params.put("id", id);
		
		return sqlSession.selectList("roomreservation.transList", params);
	}//transList() end
}
