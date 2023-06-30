package kr.co.godtrip.hotel;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/hotel")
public class HotelCont {

	public HotelCont() {
		System.out.println("------HotelCont() 객체 생성됨");
	}
	@Autowired
	HotelDAO hotelDao;
	

	
 

	 @GetMapping("/hoteldetail")
	    public ModelAndView list2(HttpServletRequest req) {
	 		String hotel_code=req.getParameter("hotel_code");
	 		String departure_Date=req.getParameter("departure_Date");
	 		String arrival_Date=req.getParameter("arrival_Date");
	 		
	 		Map<String, Object> map = new HashMap<>();
 		    map.put("hotel_code", hotel_code);
 		    map.put("departure_Date", departure_Date);
 		    map.put("arrival_Date", arrival_Date);

	 		List<Map<String, Object>> list = hotelDao.list2(map);
	 		System.out.println(list);
	 		ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hoteldetail");
	        mav.addObject("list",list);//DB에서 where 칼럼명  
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
		 String arrival_code=req.getParameter("arrival_code");
		 String area_name="";
		 	if(arrival_code.equals("G0001")) {
		    	area_name="제주도";
		    }else if(arrival_code.equals("G0002")) {
		    	area_name="서울";
		    }else if(arrival_code.equals("G0003")) {
		    	area_name="인천";
		    }else if(arrival_code.equals("G0004")) {
		    	area_name="수원";
		    }else if(arrival_code.equals("G0005")) {
		    	area_name="가평";
		    }else if(arrival_code.equals("G0006")) {
		    	area_name="강릉";
		    }else if(arrival_code.equals("G0007")) {
		    	area_name="춘천";
		    }else if(arrival_code.equals("G0008")) {
		    	area_name="제천";
		    }else if(arrival_code.equals("G0009")) {
		    	area_name="대전";
		    }else if(arrival_code.equals("G0010")) {
		    	area_name="남원";
		    }else if(arrival_code.equals("G0011")) {
		    	area_name="군산";
		    }else if(arrival_code.equals("G0012")) {
		    	area_name="영월";
		    }else if(arrival_code.equals("G0013")) {
		    	area_name="부산";
		    }else if(arrival_code.equals("G0014")) {
		    	area_name="경주";
		    }else if(arrival_code.equals("G0015")) {
		    	area_name="포항";
		    }else if(arrival_code.equals("G0016")) {
		    	area_name="통영거제";
		    }else if(arrival_code.equals("G0017")) {
		    	area_name="목포";
		    }else if(arrival_code.equals("G0018")) {
		    	area_name="여수";
		    }else if(arrival_code.equals("G0019")) {
		    	area_name="전주";
		    }
	        ModelAndView mav=new ModelAndView();
	        mav.setViewName("hotel/hotelList");

	        Map<String, Object> map=new HashMap<>();
	        map.put("arrival_code", arrival_code);
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
	        map.put("arrival_code", arrival_code);
	        map.put("hotel_Name", hotel_Name);
	        map.put("hotel_Type", hotel_Type);
	        List list=null;      
	        if(totalRowCount>0){            
	        	list=hotelDao.list(map);
	        } else {            
	            list=Collections.EMPTY_LIST;            
	        }//if end
	        
	       System.out.println(list);
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
	        mav.addObject("arrival_code", arrival_code);
	        mav.addObject("area_name",area_name);
	        return mav;
	 }//list() end
	 
}//class() end
