package kr.co.godtrip.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CommentDAO {
	
	
	@Autowired
    SqlSession sqlSession;
	
	
	
	 public int commentInsert(CommentDTO comment){        
	        return sqlSession.insert("comment.insert", comment);
	    }//insert() end

	
	
	    public List<CommentDTO> commentlist(String tour_code){
	        return sqlSession.selectList("comment.list", tour_code);
	    }//list() end
	    
	    
	    public int commentDelete(int commentno) throws Exception{
	        return sqlSession.delete("comment.delete", commentno);
	    }//delete() end
	    
	    
	    public int commentUpdate(CommentDTO comment){
	        return sqlSession.update("comment.update", comment);
	    }//update() end

}//class end 
