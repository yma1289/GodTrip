package kr.co.godtrip.hotel;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/hotel")
public class HotelCont {

	public HotelCont() {
		System.out.println("------HotelCont() 객체 생성됨");
	}
	@Autowired
	HotelDAO hotelDao;
	
	@RequestMapping("/hotelForm")
		public String hotelForm() {
			return "hotel/hotelForm";
	}
	
	//hotelList에서 준 호텔코드
	@RequestMapping("/hoteldetailForm")
		public ModelAndView hoteldetailForm(HttpServletRequest req) {
			String hotel_code=req.getParameter("hotel_code");	
			ModelAndView mav=new ModelAndView();
			mav.setViewName("hotel/hoteldetailForm");
			mav.addObject("hotel_code" , hotel_code);
			System.out.println(hotel_code);
			return mav;
	}
	
	
	// @RequestMapping()
	 // 부모페이지 .jsp에서 <a href="/hotelList?area_code=여기에클릭한지역코드출력"></a>
	
	 //호텔정보 가져오기 + 지역정보
	 @GetMapping("/hotelList")
	 	public ModelAndView list(HttpServletRequest req) {
		 	//지역코드
		 	//String area_code=req.getParameter("area_code"); //나중에 이부분으로 고쳐야 함
		    String area_code="G0001"; //지금은 임시로 제주지역코드로 테스트
		    String area_name="";
		    String latitude="";
		    String longitude="";
		    if(area_code.equals("G0001")) {
		    	area_name="제주도";
		    	latitude="33.4994760876976";
		    	longitude="126.531170862545";
		    }else if(area_code.equals("G0002")) {
		    	area_name="부산광역시";
		    	latitude="35.1795460235899";
		    	longitude="129.075065707252";
		    }else if(area_code.equals("G0003")) {
		    	area_name="대구광역시";
		    	latitude="35.8712907516546";
		    	longitude="128.601996888524";
		    }else if(area_code.equals("G0007")) {
		    	area_name="서울";
		    	latitude="37.5665719706213";
		    	longitude="126.97891266823";
		    }//if end 
		    
	        ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");

	        int totalRowCount=hotelDao.totalRowCount(); //총 글갯수
	        
	        //페이징
	        int numPerPage   = 5;    // 한 페이지당 레코드 갯수
	        int pagePerBlock = 10;   // 페이지 리스트
	        
	        String pageNum=req.getParameter("pageNum");
	        if(pageNum==null){
	              pageNum="1";
	        }
	        
	        int currentPage=Integer.parseInt(pageNum);
	        int startRow   =(currentPage-1)*numPerPage+1;
	        int endRow     =currentPage*numPerPage;
	        
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
	        map.put("area_code", area_code);
	        
	       
	        List list=null;      
	        if(totalRowCount>0){            
	              //list=hotelDao.list(startRow, endRow, area_code);           
	        	list=hotelDao.list(map);
	        } else {            
	            list=Collections.EMPTY_LIST;            
	        }//if end
	          
	        //int number=0;
	        //number=totalRowCount-(currentPage-1)*numPerPage;
	          
	        //mav.addObject("number",    number);
	        mav.addObject("pageNum",   currentPage);
	        //mav.addObject("startRow",  startRow);
	        //mav.addObject("endRow",    endRow);
	        mav.addObject("count",     totalRowCount);
	        //mav.addObject("pageSize",  pagePerBlock);
	        mav.addObject("totalPage", totalPage);
	        mav.addObject("startPage", startPage);
	        mav.addObject("endPage",   endPage);
	        mav.addObject("list", list);
	         
	        mav.addObject("area_code",area_code);
	        mav.addObject("area_name",area_name);
	        mav.addObject("latitude",latitude);
	        mav.addObject("longitude",longitude);
	        
	        return mav;
	 }//list() end
	 
	 
	 @GetMapping("/hoteldetail")
	    public ModelAndView list2(HttpServletRequest req) {
	 		String hotel_code=req.getParameter("hotel_code");
	        ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hoteldetail");
	        mav.addObject("list",hotelDao.list2(hotel_code));//DB에서 where 칼럼명  
	        return mav;
	 }//list() end
	 

	
	 
	 //호텔 검색
	 @GetMapping("/search")
	    public ModelAndView search(@RequestParam(defaultValue = "") String hotel_Name) {
	    	ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");
	        mav.addObject("hotel_Name",hotel_Name);//검색어
	        mav.addObject("list", hotelDao.search(hotel_Name));
	        return mav;
	 }//search() end
	 
	 //호텔 타입 분류
	 @GetMapping("/search2")
	    public ModelAndView search2(String hotel_Type) {
	    	ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");
	        mav.addObject("hotel_Type",hotel_Type);		//호텔타입
	        mav.addObject("list", hotelDao.search2(hotel_Type)); //검색 결과 리스트도 함께 전달
	        return mav;
	    }//search() end
	 
	 //호텔입력
	@PostMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile img
    		          ,HttpServletRequest req) {
		
			//숙박코드 생성
            int d = (int)(Math.random() * 10000 + 1);
            String hotel_code="H" + d;
			
            String filename="-";
            long filesize=0;
            if(img != null && !img.isEmpty()) { //파일이 존재한다면
    		
            filename=img.getOriginalFilename();
    		filesize=img.getSize();
    		try {
    			
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			img.transferTo(new File(path + "\\" + filename)); //파일저장
    			
    		}catch (Exception e) {
    			e.printStackTrace(); //System.out.println(e);
			}//try end    		
    	}//if end
    	
    	map.put("hotel_filename", filename);
    	map.put("hotel_filesize", filesize);
    	map.put("hotel_code", hotel_code);
    	//System.out.println(filename);
    	//System.out.println(filesize);
    	hotelDao.insert(map);

    	return "redirect:/hotel/hotelList";
    	
    }//insert() end
	
	@PostMapping("/detailinsert")
	public String detailinsert(@RequestParam Map<String, Object> map
	          				  ,@RequestParam MultipartFile img
	          				  ,HttpServletRequest req) 
	{
			   //String p_ID=req.getParameter("p_ID"); //나중에 이부분으로 고쳐야 함
			   String p_ID="bnb56"; //판매자아이디 임시
						
			   int d = (int)(Math.random() * 10000 + 1);
			   String room_code="R" + d;

			   String filename="-";
			   long filesize=0;
			   
         if(img != null && !img.isEmpty()) { //파일이 존재한다면
        	   filename=img.getOriginalFilename();
        	   filesize=img.getSize();
      
         try {
        	   ServletContext application=req.getSession().getServletContext();
        	   String path=application.getRealPath("/storagedetail");  //실제 물리적인 경로
        	   img.transferTo(new File(path + "\\" + filename)); //파일저장
		
        	}catch (Exception e) {
        	   e.printStackTrace(); //System.out.println(e);
		    
		   }//try end    		
		}//if end

		map.put("room_filename", filename);
		map.put("room_filesize", filesize);
		map.put("room_code", room_code);
		map.put("p_ID", p_ID);

		System.out.println(filename);
		System.out.println(filesize);
		System.out.println(room_code);
		System.out.println(p_ID);
		hotelDao.detailinsert(map);
		
		return "redirect:/hotel/hotelList";

	}//insert() end
	
		
	
}//class() end
