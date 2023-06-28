package kr.co.godtrip.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository

public class ReviewDAO {
	public ReviewDAO(){
		System.out.println("-----ReviewDAO()객체생성");
	}
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
	
    public void insert(Map<String, Object> map) {
    	sqlSession.insert("review.insert", map); 
    }//insert() end
    
    //후기 리스트 가져오기
    public List<Map<String, Object>> list(Map<String, Object> map){
 	    return sqlSession.selectList("review.list", map);
    }//list() end
     
    //후기 상세보기 가져오기
    public List<Map<String, Object>> reviewdetail(String reviewno){
    	return sqlSession.selectList("review.reviewdetail",reviewno);
    }
    //조회수 증가
    public void viewcount(String reviewno) {
    	sqlSession.update("review.viewcount",reviewno);
    }
    
    public void reviewdelete(String reviewno) {
    	sqlSession.delete("review.reviewdelete",reviewno);
    }
    //총 글갯수 가져오기
	 public int totalRowCount1(String search) {
	        return sqlSession.selectOne("review.totalRowCount1",search);
	    }
	 
	 public int totalRowCount2() {
		 return sqlSession.selectOne("review.totalRowCount2");
	 }
	 
	 public String contentname(String reviewno) {
	    	return sqlSession.selectOne("review.contentname",reviewno);
	    }
	 
}
