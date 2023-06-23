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
import javax.servlet.http.HttpSession;

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
			return mav;
	}
	
	 
	 @GetMapping("/hoteldetail")
	    public ModelAndView list2(HttpServletRequest req) {
	 		String hotel_code=req.getParameter("hotel_code");
	 		String departure_Date=req.getParameter("departure_Date");
	 		String arrival_Date=req.getParameter("arrival_Date");
	        ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hoteldetail");
	        mav.addObject("list",hotelDao.list2(hotel_code));//DB에서 where 칼럼명  
	        mav.addObject("departure_Date",departure_Date);
	        mav.addObject("arrival_Date",arrival_Date);
	        return mav;
	 }//list() end
	
	
	
	// @RequestMapping()
	 // 부모페이지 .jsp에서 <a href="/hotelList?area_code=여기에클릭한지역코드출력"></a>
	
	 	//호텔정보 가져오기 + 지역정보(사용자 기준)
	 	@GetMapping("/hotelList")
	 	public ModelAndView list(HttpServletRequest req) {
		 //사용자가 검색한 검색어(hotleList에서 넘어옴)
		 String hotel_Name = req.getParameter("hotel_Name");
		 //사용자가 선택한 타입 (hotleList에서 넘어옴)
		 String hotel_Type = req.getParameter("hotel_Type");
		 //사용자가 선택한 출발일 (transRsvInsert에서 넘어옴)
		 String departure_Date=req.getParameter("departure_Date");
		 //사용자가 선택한 도착일 (transRsvInsert에서 넘어옴)
		 String arrival_Date=req.getParameter("arrival_Date");
		 //사용자가 선택한 지역    (transRsvInsert에서 넘어옴)
		 String area_code=req.getParameter("area_code");
		 String area_name="";
		 	if(area_code.equals("G0001")) {
		    	area_name="제주도";
		    }else if(area_code.equals("G0002")) {
		    	area_name="서울";
		    }else if(area_code.equals("G0003")) {
		    	area_name="인천";
		    }else if(area_code.equals("G0004")) {
		    	area_name="수원";
		    }else if(area_code.equals("G0005")) {
		    	area_name="가평";
		    }else if(area_code.equals("G0006")) {
		    	area_name="강릉";
		    }else if(area_code.equals("G0007")) {
		    	area_name="춘천";
		    }
	        ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");

	        Map<String, Object> map=new HashMap<>();
	        map.put("area_code", area_code);
	        map.put("hotel_Name", hotel_Name);
	        map.put("hotel_Type", hotel_Type);

	        int totalRowCount=hotelDao.totalRowCount(map); //총 글갯수
	        
	        
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
	      
	        
	       
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("area_code", area_code);
	        map.put("hotel_Name", hotel_Name);
	        map.put("hotel_Type", hotel_Type);
	        List list=null;      
	        if(totalRowCount>0){            
	        	list=hotelDao.list(map);
	        } else {            
	            list=Collections.EMPTY_LIST;            
	        }//if end
	        
	       
	        //페이징 정보 넘기기
	        mav.addObject("pageNum", currentPage);
	        mav.addObject("count", totalRowCount);
	        mav.addObject("totalPage", totalPage);
	        mav.addObject("startPage", startPage);
	        mav.addObject("endPage", endPage);
	        
	        
	        //숙박 정보 넘기기
	        mav.addObject("departure_Date",departure_Date);
	        mav.addObject("arrival_Date",arrival_Date);
	        mav.addObject("list", list);
            mav.addObject("hotel_Name", hotel_Name);
            mav.addObject("hotel_Type", hotel_Type);
	        mav.addObject("area_code", area_code);
	        mav.addObject("area_name",area_name);
	        return mav;
	 }//list() end
	 
	
	 

	
	 

	//판매자 페이지에서 숙박입력
	@PostMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile img
    		          ,HttpServletRequest req
    		          ,HttpSession session) {
		    String p_id=(String) session.getAttribute("p_id");
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
    	map.put("p_id", p_id);
    	//System.out.println(filename);
    	//System.out.println(filesize);
    	hotelDao.insert(map);
    	//판매자 페이지로 이동
    	return "redirect:/hotel/partnerhotelList"; 
    	
    }//insert() end
	
	//판매자 판매현황 보여주기
	@GetMapping("/partnerhotelList")
	public ModelAndView partnerlist(HttpServletRequest req,HttpSession session) {
		ModelAndView mav = new ModelAndView();
			
		mav.setViewName("/partner/partnerpage");
		return mav;
	}
	
	
	@PostMapping("/detailinsert")
	public String detailinsert(@RequestParam Map<String, Object> map
	          				  ,@RequestParam MultipartFile img
	          				  ,HttpServletRequest req) 
	{
			   //String p_ID=req.getParameter("p_ID"); //나중에 이부분으로 고쳐야 함
			   String p_id="test1"; //판매자아이디 임시
						
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
		map.put("p_id", p_id);

		hotelDao.detailinsert(map);
		
		return "redirect:/hotel/hotelList";

	}//insert() end
	
	@RequestMapping("/hoteldelete")
	public String hoteldelete(HttpServletRequest req) {
		String hotel_code=req.getParameter("hotel_code");
		hotelDao.delete(hotel_code);	
		return "redirect:/hotel/hotelList";
	}
		
	
}//class() end
