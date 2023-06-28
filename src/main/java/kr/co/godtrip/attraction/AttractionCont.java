package kr.co.godtrip.attraction;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import kr.co.godtrip.member.MemberDAO;
import kr.co.godtrip.member.MemberDTO;
import kr.co.godtrip.partner.partnerDAO;
import kr.co.godtrip.partner.partnerDTO;

@Controller
@RequestMapping
public class AttractionCont {

	public AttractionCont() {
		System.out.println("----AttractionCont() 객체생성됨");
	}
	

	@Autowired
	AttractionDAO attractionDao;
	

	

      //mlevel이 A1인 사람만 등록폼볼수있음
	@RequestMapping("/attraction/attractionForm")
	public String attractionForm(HttpSession session){
	    String s_id= (String) session.getAttribute("s_id"); // 세션에서 s_id 속성 가져오기
	    String s_mlevel= (String) session.getAttribute("s_mlevel"); // 세션에서 mlevel 속성 가져오기
	    System.out.println(s_mlevel);
	    if (s_id!= null && s_mlevel!= null && s_mlevel.equals("A1")) {
	        // s_id가 세션에 저장되어 있고, mlevel이 'A1'인 경우, Attraction 등록 폼을 보여줌
	        // 필요한 로직 작성
	        return "attraction/attractionForm";
	    } else {
	        // s_id가 없거나, mlevel이 'A1'이 아닌 경우, 로그인 페이지로 이동
	        // 필요한 로직 작성
	        return "redirect:/member/memberlogin";  // 다른 컨트롤러로 리다이렉트
	    }
	}
	
	
	// 삭제(회원등급A1인사람만 삭제가능)
	@RequestMapping("/attraction/attractionDelete")
	public String attractionDelete(@RequestParam String tour_code, HttpServletRequest req, HttpSession session) {
	    String s_id = (String) session.getAttribute("s_id");
	    String s_mlevel = (String) session.getAttribute("s_mlevel");
	    
	    if (s_id != null && s_mlevel != null && s_mlevel.equals("A1")) {
	        String code = attractionDao.contentname(tour_code);
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
	                        }
	                    }
	                }

	            }
	        }

	        // 첨부된 파일 삭제하기

	        // 첨부된 파일 삭제하기

	        attractionDao.attractionDelete(tour_code); // 테이블 행 삭제

	        return "redirect:/attraction/attractionList";
	    } else {
	        // 권한이 없는 경우에 대한 처리
	        return "redirect:/member/memberlogin"; // 또는 다른 경로로 리다이렉트하거나 에러 메시지를 표시할 수 있습니다.
	    }
	}
	
	
	
	
	/*

	//삭제
	@RequestMapping("/attraction/attractionDelete")
	public String attractionDelete(@RequestParam String tour_code, HttpServletRequest req) {
		String code=attractionDao.contentname(tour_code);  
		String srcString = "src=\"/summernote_image/";        
		int startIndex = 0;

		while (startIndex != -1) {
		
		    startIndex = code.indexOf(srcString, startIndex);

		    if (startIndex != -1) {
		        startIndex += srcString.length(); // 파일명 시작 인덱스 설정

		        int endIndex = code.indexOf("\"", startIndex); // 파일명이 끝나는 인덱스를 찾음

		        if (endIndex != -1) {
		            String fileName = code.substring(startIndex, endIndex);
		            
		            if(fileName != null && !fileName.equals("-")){  //파일이 존재한다면~
		    			ServletContext application=req.getSession().getServletContext();
		    			String path=application.getRealPath("summernote_image/");//실제 물리적인 경로
		    			File file=new File(path + "\\" + fileName);
		    			if(file.exists()) {        //파일에 다 모아놓고 -> 파일이존재한다면
		    				file.delete();			//그 파일 다 삭제해라~
		    			}//if end 
		    		}//if end }
		        } 
		        
		    }
		}		
		
		
		//첨부된 파일 삭제하기
		
		//첨부된 파일 삭제하기
		
		
		attractionDao.attractionDelete(tour_code);  //테이블 행 삭제
		
		return "redirect:/attraction/attractionList";
		
	}//delete() end 
	
	*/
	
	
	

	
	


	@RequestMapping("/attraction/attractioninsert")
	public String insert(
						 @RequestParam Map<String, Object> map //map이 text정보 받는다(form.jsp에서 만든 text)
						,HttpServletRequest req){
		//AttractionDTO 객체에 입력된 값들이 자동으로 바인딩됨
		// tour_code 생성하기
		// T + 4자리 숫자
		// 1)tour_code 접두사
		String tour_codePrefix = "T"; 

		//2) 랜덤 번호 생성
		int d = (int) (Math.random() * 10000); // 4자리 숫자를 생성하기 위해 10000을 곱합니다

		//3) 4자리 숫자로 만들기 위해 형식을 지정합니다
		String formattedNumber = String.format("%04d", d);

		//4) 접두사 T와 4자리 숫자를 결합하여 tour_code 생성
		String tour_code = tour_codePrefix + formattedNumber;
		
		//tour_Code값을 map에 추가(실수->이걸안해서 mapping오류 뜬것)
		map.put("tour_code", tour_code);
		
		//String p_ID="bnb56";
		//int d=(int)(Math.random()) *1000 + 1;
		//String tour_code="T" +d;
		
		attractionDao.attractioninsert(map);
		return "redirect:/attraction/attractionList";  //행추가 완료 후 목록이동
	}//insert() end 
	

		

	//목록list 뷰단 보여주기
	@RequestMapping("/attraction/attractionList")
	public ModelAndView list(HttpServletRequest req) {	
		String tour_name = req.getParameter("tour_name");
		
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map = new HashMap<>();    //map사용하려고 객체선언
		map.put("tour_name", tour_name);
		//System.out.println(tour_name);
		
		//전체행갯수//전체행갯수와 검색했을때 나오는 행갯수 나눠서 쿼리문작성해준다. (검색하면 나오는 행이랑 전체행이랑 다르기때문에) 
		int totalRowCount=attractionDao.totalRowCount(map);
		
		
		  //페이징
        int numPerPage   = 5;    // 한 페이지당 레코드 갯수
        int pagePerBlock = 5;   // 페이지 리스트
        
        String pageNum=req.getParameter("pageNum");
        //아무것도 없으면 1페이지 보여주는것 
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
       // System.out.println(map);
        
        
        List list=null;      
        if(totalRowCount>0){            
        	list=attractionDao.list(map);
        	//System.out.println(list);
        } else {            
            list=Collections.EMPTY_LIST;            
        }//if end

       
        //페이징 정보 넘기기
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list", list);
		mav.setViewName("attraction/attractionList");
		return mav;
		
		
	}//list() end 

	
	
	
	

	
	
	//상세보기+조회수
	@RequestMapping("/attraction/attractionDetail")
	public ModelAndView attractionDetail(String tour_code) {
		 
		//조회수증가
		try {
			attractionDao.viewcount(tour_code);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionDetail");
		mav.addObject("attraction", attractionDao.attractionDetail(tour_code));
		return mav;
	}//attractionDetail() end 
	
	
	
	
	//에디터
			@RequestMapping(value="/uploadSummernoteImageFile2", produces = "application/json; charset=utf8")
			@ResponseBody
			public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req)  {
				JsonObject jsonObject = new JsonObject();
				
		        /*
				 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
				 */
				
				// 내부경로로 저장
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("summernote_image/"); 
				System.out.println(path);

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
			
	
	
	

	
	
	

		
	///////////////////////////
	

	/*
	
	@RequestMapping("/attraction/attractionList")
	public ModelAndView list() {	
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionList");
		mav.addObject("attractionList", attractionDao.list());
		return mav;
	}
	*/



	/*
	 //상세보기 map사용
	//참조 attractionList.jsp
	//<a href="<c:url value='/attraction/attractionDetail?tour_code=${dto.tour_code}' />">
	@RequestMapping("/attraction/attractionDetail")
	public ModelAndView attractionDetail(String tour_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionDetail");
		mav.addObject("attraction", attractionDao.attractionDetail(tour_code));
		return mav;
	}//attractionDetail() end 
		*/
	
	/*
	
	//수정폼뷰단보여주기	(이걸로)
		@GetMapping("/attraction/attractionUpdate")
		public String attractionUpdate(@RequestParam String tour_code
									, HttpServletRequest req
									,Model model
									) throws Exception{
			//상세내용조회
			AttractionDTO attraction=attractionDao.attractionDetail(tour_code);
			//상세내용을 수정페이지에 전달
			model.addAttribute("attraction", attraction);
			//String test = tour_code;
			//System.out.println("test ===============" + test);
			
			return "attraction/attractionUpdate";
		}
	
	
	*/
	
	
	
	/*
	//수정 dto	
		@RequestMapping("/attraction/attractionUpdate")
		public String attractionUpdate(@ModelAttribute AttractionDTO attractionDTO
		                     , @RequestParam MultipartFile img
		                     , HttpServletRequest req) {

		    String filename = "-";
		    long filesize = 0;
		    if (img != null && !img.isEmpty()) {
		        filename = img.getOriginalFilename();
		        filesize = img.getSize();
		        try {
		            ServletContext application = req.getSession().getServletContext();
		            String path = application.getRealPath("/storage");
		            img.transferTo(new File(path + "\\" + filename));
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    } else {
		        String tour_code = attractionDTO.getTour_code();
		        AttractionDTO attraction = attractionDao.attractionDetail(tour_code);
		        filename = attraction.getFilename();
		        filesize = attraction.getFilesize();
		    }

		    attractionDTO.setFilename(filename);
		    attractionDTO.setFilesize((int) filesize);
		    attractionDao.attractionUpdate(attractionDTO);
		    return "redirect:/attraction/attractionList";
		}
		*/
	
	
	
	
		
	
	/*
	//수정 Map사용 (gtp수정코드)
	//수정된폼넘긴거(질문할것-> 수정 한 뒤 수정버튼누르면 수정안되고 그냥 list페이지로 넘어감)
	@PostMapping("/attraction/attractionUpdate")
	public String update(@RequestParam Map<String, Object> map,
	                     @RequestParam MultipartFile img,
	                     HttpServletRequest req) {

	    String filename = "-";
	    long filesize = 0;
	    if (img != null && !img.isEmpty()) { //파일이 존재한다면~
	        filename = img.getOriginalFilename();
	        filesize = img.getSize();
	        try {
	            ServletContext application = req.getSession().getServletContext();
	            String path = application.getRealPath("/storage");//실제물리적인경로
	            img.transferTo(new File(path + "\\" + filename));//파일저장
	        } catch (Exception e) {
	            e.printStackTrace();//system.out.println;과 같은것
	        }//try end
	    } else {
	        if (map.containsKey("tour_code")) {
	            String tour_code = map.get("tour_code").toString();
	            Map<String, Object> attraction = attractionDao.attractionDetail(tour_code);
	            filename = attraction.get("FILENAME").toString();
	            filesize = Long.parseLong(attraction.get("FILESIZE").toString());
	        }
	    }
	    
	    map.put("filename", filename);
	    map.put("filesize", filesize);
	    attractionDao.attractionUpdate(map);
	    return "redirect:/attraction/attractionList";
	}
	*/
	

	/*
	
	//수정 Map사용 (gtp수정코드)
	@PostMapping("/attraction/attractionUpdate")

	public String update(@RequestParam Map<String, Object> map
						, @RequestParam MultipartFile img
						,HttpServletRequest req) {

		String filename="-";
		long filesize=0;
		if(img !=null && !img.isEmpty()) {//파일이 존재한다면
			filename=img.getOriginalFilename();
			filesize=img.getSize();
			try {
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("/storage");   //실제 물리적인 경로
				img.transferTo(new File(path+ "\\" + filename));   //파일저장
				
				
			}catch (Exception e) {
				e.printStackTrace();   //System.out.println(e);과 같은 명령어
			}//try end 
		}else{
			String tour_code=map.get("tour_code").toString();
			Map<String, Object>attraction=attractionDao.attractionDetail(tour_code);
			filename=attraction.get("FILENAME").toString();
			filesize=Long.parseLong(attraction.get("FILESIZE").toString());

			
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		attractionDao.attractionUpdate(map);
		return "redirect:/attraction/attractionList";
	}//update()end
	
	*/
	
	
	

	/*
	//검색 search
	@RequestMapping("/attraction/search")
	public ModelAndView search(@RequestParam(defaultValue = "")String tour_name) {//name="tour_name"의 값이 없으면 defaultValue 를 공백으로 줌
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionList");
		mav.addObject("attractionList", attractionDao.search(tour_name));
		//1.DAO에가서 controller에 있는 search부른다
		//2.DAO search()는 attraction.search반환(mapper에 있는)
		//3.mapper에 파라미터타입 String
		mav.addObject("tour_name", tour_name);
		//mav에 받아온 검색어를 저장해놨다가(검색전) 다시 list페이지를 불러올 때 넘겨받은 값을 준다(검색후) 
		return mav;
	}
	*/
	
	
	
	/*

	//상세보기dto(이걸로)

	@RequestMapping("/attraction/attractionDetail")
	public ModelAndView attractionDetail(String tour_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionDetail");
		mav.addObject("attraction", attractionDao.attractionDetail(tour_code));
		return mav;
	}//attractionDetail() end 
	
*/
	


	/*기존 실행되는것 
	@RequestMapping("/attraction/attractionForm")
	public String attractionForm(){
		return "attraction/attractionForm";
	}
	*/
	
	/*판매자만 상품등록할 수 있음
	@RequestMapping("/attraction/attractionForm")
	public String attractionForm(HttpSession session){
		
		//HttpSession session=req.getSession();  //세션 객체 가져오기
		String p_id=(String)session.getAttribute("p_id"); //세션에서 partner 속성 가져오기
		
		 if (p_id != null) {
	            // 판매자 아이디가 세션에 저장되어 있을 경우, Attraction 등록 폼을 보여줌
	            // 필요한 로직 작성
	            return "attraction/attractionForm";
	        } else {
	            // 세션에 판매자 아이디가 없을 경우, 로그인 페이지로 이동
	            // 필요한 로직 작성
	            return "redirect:/partner/partnerlogin";  // 다른 컨트롤러로 리다이렉트
	        }
	    }
		
		*/
	
	
	
	
}//class end 
