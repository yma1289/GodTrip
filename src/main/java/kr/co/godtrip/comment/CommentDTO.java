package kr.co.godtrip.comment;

public class CommentDTO {

	
		private int commentno;   //댓글번호(cno)
		private String tour_code;  //관광지코드(product_code)
		private String content;		 //내용
		private String id;			//아이디(wname)
		private String regdate;	  //작성일	
		
	
	    public CommentDTO() {}


		public int getCommentno() {
			return commentno;
		}


		public void setCommentno(int commentno) {
			this.commentno = commentno;
		}


		

		public String getTour_code() {
			return tour_code;
		}


		public void setTour_code(String tour_code) {
			this.tour_code = tour_code;
		}


		public String getId() {
			return id;
		}


		public void setId(String id) {
			this.id = id;
		}


		public String getContent() {
			return content;
		}


		public void setContent(String content) {
			this.content = content;
		}


		public String getRegdate() {
			return regdate;
		}


		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

		
		


		@Override
		public String toString() {
			return "CommentDTO [commentno=" + commentno + ", tour_code=" + tour_code + ", id=" + id + ", content="
					+ content + ", regdate=" + regdate + "]";
		}
	
	    
	
	
	
	
}
