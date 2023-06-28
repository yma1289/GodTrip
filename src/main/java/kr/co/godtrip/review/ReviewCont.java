package kr.co.godtrip.review;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.google.gson.JsonObject;

@Controller
@RequestMapping("/review")
public class ReviewCont {

	public ReviewCont() {
		System.out.println("------ReviewCont 객체 생성됨");
	}
	
		@Autowired
		ReviewDAO reviewDao;
	
		@RequestMapping("/reviewForm")
		public String reviewForm() {
		return "review/reviewForm";
	 }
		
		@RequestMapping("/reviewdetail")
		public ModelAndView reviewdetail(HttpServletRequest req,HttpSession session){
			String reviewno=req.getParameter("reviewno");
			String s_id=(String) session.getAttribute("s_id");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("review/reviewdetail");
			List list=null;  
			reviewDao.viewcount(reviewno); //조회수 증가
			list=reviewDao.reviewdetail(reviewno);
			mav.addObject("list",list);
			 //로그인 정보 넘기기
	        mav.addObject("s_id",s_id);
			return mav;
		}
		
		
			@RequestMapping("/reviewList")
			public ModelAndView reviewList(HttpServletRequest req, HttpSession session) {
				int totalRowCount=0;
				String search=""; //검색문자열
			    if (req.getParameter("word") != null) { //검색어가 존재하는지?
					String word     =req.getParameter("word");
					String col      =req.getParameter("col");
					String area_name=req.getParameter("area_name");
				 	//쿼리문에 사용할 검색어 넘기기
					if(col.equals("title_content")) {
						search +=" WHERE title LIKE '%" + word + "%'";
						search +=" OR content LIKE '%" + word + "%'";
					}else if(col.equals("title")) {
						search +=" WHERE title LIKE '%" + word + "%' ";
					}else if(col.equals("content")) {
						search +=" WHERE content LIKE '%" + word + "%' ";
					}else if(col.equals("id")) {
						search +=" WHERE id LIKE '%" + word + "%' ";
					}//else end
				
					if(!area_name.equals("all")) {
						search +=" AND area_name = '" + area_name + "'";
					}//end if
					
					
				totalRowCount=reviewDao.totalRowCount1(search);
			    } else {
			    totalRowCount=reviewDao.totalRowCount2();
			    }//if end
			
			    
			    //페이징
		        int numPerPage   = 5;    // 한 페이지당 레코드 갯수
		        int pagePerBlock = 5;   // 페이지 리스트
		        
		        String pageNum=req.getParameter("pageNum");
		        if(pageNum==null){
		              pageNum="1";
		        }
		        
		        int currentPage=Integer.parseInt(pageNum);
		        //페이지에 출력할 수
		        int startRow   =(currentPage-1)*numPerPage;  //가져올 데이터의 초기 위치값		
		        int endRow     =numPerPage;					 //가져올 데이터 양
		        
		        //페이지 수
		        double totcnt = (double)totalRowCount/numPerPage;
		        int totalPage = (int)Math.ceil(totcnt);
		        
		        double d_page = (double)currentPage/pagePerBlock;
		        int Pages     = (int)Math.ceil(d_page)-1;
		        int startPage = Pages*pagePerBlock;
		        int endPage   = startPage+pagePerBlock+1;
			
		        Map<String, Object> map=new HashMap<>();
		        map.put("startRow", startRow);
		        map.put("endRow", endRow);
		        map.put("search", search);
		        
		        List list=null;      
		        if(totalRowCount>0){            
		        	list=reviewDao.list(map);
		        } else {            
		            list=Collections.EMPTY_LIST;            
		        }//if end
		        ModelAndView mav=new ModelAndView();
		        mav.setViewName("review/reviewList");
		        mav.addObject(pageNum, mav);
		        //페이징 정보 넘기기
		        mav.addObject("pageNum", currentPage);
		        mav.addObject("count", totalRowCount);
		        mav.addObject("totalPage", totalPage);
		        mav.addObject("startPage", startPage);
		        mav.addObject("endPage", endPage);
		        
		        
		        //후기 정보 넘기기
		        mav.addObject("list", list);
		        
		       
		        return mav;
		 }
		
			//리뷰 생성
			@PostMapping("/reviewcreate")
			public String reviewcreate(HttpServletRequest req,@RequestParam Map<String, Object> map,HttpSession session) {
				String id=(String) session.getAttribute("s_id");
				String content=req.getParameter("content");
				System.out.println(content);
			    map.put("id", id);
			    reviewDao.insert(map);
			    return "redirect:/review/reviewList";
			}
			
			
			@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
			@ResponseBody
			public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req )  {
				JsonObject jsonObject = new JsonObject();
				
		        /*
				 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
				 */
				
				// 내부경로로 저장
				ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("summernote_image/"); 

				String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				File targetFile = new File(path + savedFileName);
				try {
					InputStream fileStream = multipartFile.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
					jsonObject.addProperty("url", "/summernote_image/"+savedFileName); //파일이 있는 위치
					jsonObject.addProperty("responseCode", "success");
						
				} catch (IOException e) {
					FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
					jsonObject.addProperty("responseCode", "error");
					e.printStackTrace();
				}
				String a = jsonObject.toString();
				return a;
			}
			
			
			//여행후기 삭제
			@RequestMapping("/reviewdelete")
			public String reviewdelete(HttpServletRequest req) {
				String reviewno=req.getParameter("reviewno");
				String code = reviewDao.contentname(reviewno);
				String srcString = "src=\"/summernote_image/";
		        int startIndex = 0;

		        while (startIndex != -1) {
		            startIndex = code.indexOf(srcString, startIndex);

		            if (startIndex != -1) {
		                startIndex += srcString.length(); // 파일명 시작 인덱스 설정

		                int endIndex = code.indexOf("\"", startIndex); // 파일명이 끝나는 인덱스를 찾음

		                if (endIndex != -1) {
		                    String fileName = code.substring(startIndex, endIndex);

		                    if (fileName != null && !fileName.equals("-")) {  // 파일이 존재한다면~
		                        ServletContext application = req.getSession().getServletContext();
		                        String path = application.getRealPath("summernote_image/"); // 실제 물리적인 경로
		                        File file = new File(path + "\\" + fileName);
		                        if (file.exists()) { // 파일에 다 모아놓고 -> 파일이 존재한다면
		                            file.delete(); // 그 파일 다 삭제해라~
					                        
			    }//if end
             }//if end 	
	      }//if end
       }//if end
	}//while end 
			
						        reviewDao.reviewdelete(reviewno);
				                return "redirect:/review/reviewList";
}//reviewdelete end
			
			
			
			
			
			
			
			

}//class end


			    
		
	
	

