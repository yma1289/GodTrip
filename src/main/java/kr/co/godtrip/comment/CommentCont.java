package kr.co.godtrip.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;




@Controller   
@RequestMapping("/comment")
public class CommentCont {

	
	 public CommentCont() {
	        System.out.println("-----CommentCont()객체생성됨");
	    }//end
	 
	 
	 @Autowired     
	  CommentDAO commentDao;
	 
	 /*
	   @RequestMapping("/insert")
	    @ResponseBody    //ajax응답을 처리할때는 @ResponseBody어노테이션 써줘야한다. 
	    public int mCommentServiceInsert(@RequestParam String tour_code
	    								, @RequestParam String content
	    								,CommentDTO comment) throws Exception {
	    	System.out.println(tour_code);
	    	System.out.println(content);
	        //CommentDTO comment=new CommentDTO();   //dto에 담기위해 객체생성
	        comment.setTour_code(tour_code);
	        comment.setContent(content);
	        
	        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다.
	        //->session.getAttribute() 활용
	        //여기서는 따로 폼을 구현하지 않았기 때문에 임시로 "test"
	        comment.setId("id");
	    	
	    	return commentDao.commentInsert(comment);
	    }//mCommentServiceInsert() end
	    */
	    
	
	 @RequestMapping("/insert")
	    @ResponseBody    //ajax응답을 처리할때는 @ResponseBody어노테이션 써줘야한다. 
	    public int commentInsertForm(@RequestParam String tour_code
	    								, @RequestParam String content
	    								,HttpSession session
	    								,CommentDTO comment) throws Exception {
		//HttpSession session=req.getSession();  //세션 객체 가져오기
		 
		 
	        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다.
	        //->session.getAttribute() 활용
			String id=(String)session.getAttribute("s_id"); //세션에서 id속성 가져오기	
			//실수한부분) memberCont에서 setAttribute는 session.setAttribute("s_id", dto.getId());-> s_id로 보냈는데 받는걸 id로 가져와서 계속 null이라고에러났던것 
			
			
			System.out.println(tour_code);
	    	System.out.println(content);
	    	System.out.println(id);
	        //CommentDTO comment=new CommentDTO();   //dto에 담기위해 객체생성
	        comment.setTour_code(tour_code);
	        comment.setContent(content);
	        comment.setId(id);   
	        
	   
	    	
	    	return commentDao.commentInsert(comment);
	    }//mCommentServiceInsert() end
	   
	
	    
	    @RequestMapping("/list")
	    @ResponseBody
	    public List<CommentDTO> mCommentServiceList(@RequestParam String tour_code) throws Exception {
	    	
	        return commentDao.commentlist(tour_code);
	        
	    }//mCommentServiceList() end
	    
	    
	   /*이거최종
	    @RequestMapping("/delete/{commentno}")
	    @ResponseBody
	    public int mCommentServiceDelete(@PathVariable int commentno) throws Exception {
	    	return commentDao.commentDelete(commentno);
	    }//mCommentServiceDelete() end
	    
	    
	    
	    @RequestMapping("/update")
	    @ResponseBody
	    private int mCommentServiceUpdateProc(@RequestParam int commentno, @RequestParam String content) throws Exception {
	        CommentDTO comment=new CommentDTO();
	        comment.setCommentno(commentno);
	        comment.setContent(content);
	        return commentDao.commentUpdate(comment);
	    }//update() end
	    
	    
	*/
	    
	    @RequestMapping("/delete/{commentno}")
	    @ResponseBody
	    public int mCommentServiceDelete(@PathVariable int commentno,HttpSession session,CommentDTO comment) throws Exception {
	    	
	    	String id=(String)session.getAttribute("s_id"); //세션에서 id속성 가져오기	
	    	 comment.setId(id);  
	    	return commentDao.commentDelete(commentno);
	    }//mCommentServiceDelete() end
	    
	    
	    
	    @RequestMapping("/update")
	    @ResponseBody
	    private int mCommentServiceUpdateProc(@RequestParam int commentno, @RequestParam String content,HttpSession session) throws Exception {
	       
	    	
	    	String id=(String)session.getAttribute("s_id"); //세션에서 id속성 가져오기	
	    	 
	    	CommentDTO comment=new CommentDTO();
	        comment.setCommentno(commentno);
	        comment.setContent(content);
	        comment.setId(id); 
	        return commentDao.commentUpdate(comment);
	    }//update() end
	    
	    
	 
	 
	 
	 
}//class end 
