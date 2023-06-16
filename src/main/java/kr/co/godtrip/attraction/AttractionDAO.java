package kr.co.godtrip.attraction;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.godtrip.member.MemberDTO;
import kr.co.godtrip.service.ServiceDTO;
//@Repository : CRUD로직 구현하겠다/클래스를 자동으로 객체화 시켜준다. 
@Repository
public class AttractionDAO {
	
	
	public AttractionDAO() {
		System.out.println("----AttractionDAO() end");
	}//AttractionDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	public void attractioninsert(Map<String, Object> map) {
		sqlSession.insert("attraction.attractioninsert",map);
	}//insert() end 
	//mapper에서 namespce="attraction"의 id="attractioninsert"에 가서 쿼리문을 map에 받아오는것
	
	

	//목록list
	public List<AttractionDTO> list(){
		return sqlSession.selectList("attraction.attractionList");
	}//list() end 
	
	
	
	//상세보기Detail
	public AttractionDTO attractionDetail(String tour_code){
		return sqlSession.selectOne("attraction.attractionDetail", tour_code);
	}//detail() end 
	

	
	//삭제
    public void attractionDelete(String tour_code) {
        sqlSession.delete("attraction.attractionDelete", tour_code);
    }//delete() end
    
    
    
    public String filename(String tour_code) {
        return sqlSession.selectOne("attraction.filename", tour_code);
    }//filename() end
    
/////////////////////////////////////////////////////	

  
	//수정update
    public void attractionUpdate(AttractionDTO attractionDTO) {
        sqlSession.update("attraction.attractionUpdate", attractionDTO);
    }//update() end

    /*
	
	//수정
    public void attractionUpdate(Map<String, Object> map) {
        sqlSession.update("attraction.attractionUpdate", map);
	
    }//update() end 
    
    	*/

	
	


}//class end 
