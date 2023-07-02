package kr.co.godtrip.partner;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import net.utility.MyAuthenticator;

@Controller
@RequestMapping()
public class partnerCont {

	public partnerCont() {
		System.out.println("-----partnerController 생성");
	}

	@Autowired
	partnerDAO partnerDAO;

	// 로그인 페이지
	@RequestMapping("/partner/partnerlogin")
	public String partnerlogin() {
		return "partner/partnerlogin";

	}
	
	//숙박 입력폼
	@RequestMapping("/partner/hotelForm")
	public String hotelForm() {
		return "hotel/hotelForm";
	}
	
	//hotelList에서 준 호텔코드
	@RequestMapping("/partner/hoteldetailForm")
	public ModelAndView hoteldetailForm(HttpServletRequest req) {
	String hotel_code=req.getParameter("hotel_code");	
	ModelAndView mav=new ModelAndView();
	mav.setViewName("hotel/hoteldetailForm");
	mav.addObject("hotel_code" , hotel_code);
	return mav;
    }
	
	//예약된 객실 일정 보기
	@RequestMapping("/partner/roomcheck")
	public ModelAndView roomcheck(HttpServletRequest req) {
	 String room_code=req.getParameter("room_code");
	 List list=null;
	 list=partnerDAO.roomcheck(room_code);
	 ModelAndView mav=new ModelAndView();
	 mav.setViewName("hotel/roomcheck");
	 mav.addObject("list",list);
	 return mav;
	}
	
	//객실 등록
	@PostMapping("/partner/detailinsert")
	public String detailinsert(@RequestParam Map<String, Object> map
	          				  ,@RequestParam MultipartFile img
	          				  ,HttpServletRequest req
	          				  ,HttpSession session) 
	{
			   //String p_ID=req.getParameter("p_ID"); //나중에 이부분으로 고쳐야 함
		 		String p_id=(String) session.getAttribute("p_id");
						
			   int d = (int)(Math.random() * 9000 + 1000); 
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

		partnerDAO.detailinsert(map);
		
		return "redirect:/partner/partnerpage";

	}//insert() end
		
	//숙박 생성
	@PostMapping("/partner/hotelinsert")
    public String insert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile img
    		          ,HttpServletRequest req
    		          ,HttpSession session) {
		    String p_id=(String) session.getAttribute("p_id");
			//숙박코드 생성
		    int d = (int)(Math.random() * 9000 + 1000);            
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
    	partnerDAO.hotelinsert(map);
    	//판매자 페이지로 이동
    	return "redirect:/partner/partnerpage"; 
    	
    }//insert() end
	
	//세션값 가져오기 HttpSession session = request.getSession(true);
	//판매 현황 보여주기
	@RequestMapping("/partner/partnerpage")
	public ModelAndView partnerpage(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		//로그인중인 판매자 아이디 가져오기
		String p_id=(String) session.getAttribute("p_id");
		ModelAndView mav = new ModelAndView();
		
		//숙박 판매현황
		List list=null;
		list=partnerDAO.hotellist(p_id);
		
		//기차 판매현황
		List T_proList = null;
		T_proList = partnerDAO.T_proList(p_id);
		
		//항공 판매현황
		List F_proList = null;
		F_proList = partnerDAO.F_proList(p_id);
		
		mav.addObject("list",list);
		mav.addObject("T_proList", T_proList);
		mav.addObject("F_proList", F_proList);
		mav.setViewName("/partner/partnerpage");
		return mav;
	}

	//숙박 삭제
	@RequestMapping("/partner/hoteldelete")
	public String hoteldelete(HttpServletRequest req) {
		String hotel_code=req.getParameter("hotel_code");
		System.out.println(hotel_code);
		partnerDAO.hoteldelete(hotel_code);	
		return "redirect:/partner/partnerpage";
	}
	
	//객실 정보 보여주기
	@RequestMapping("/partner/roompartner")
	public ModelAndView roompartner(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String hotel_code=req.getParameter("hotel_code");
		List list=null;
		list=partnerDAO.hoteldetailList(hotel_code);
		mav.addObject("list",list);
		mav.setViewName("/hotel/roompartner");
		return mav;
	}
	//객실 삭제
	@RequestMapping("/partner/roomdelete")
	public String roomdelete(HttpServletRequest req) {
		String room_code=req.getParameter("room_code");
		System.out.println(room_code);
		partnerDAO.roomdelete(room_code);
		return "redirect:/partner/partnerpage";
	}
		
	
	
	@RequestMapping(value = "/partner/partnerlogin.do")
	public ModelAndView login(@RequestParam("p_id") String p_id, @RequestParam("p_passwd") String p_passwd,
			HttpServletRequest request, HttpSession session) {
		
		// 회원 정보 조회하기 
		
		partnerDTO dto = partnerDAO.loginProc(p_id, p_passwd);

		if (dto != null) {

			// id에 대한 설정이 필요하다 String id=dto.getId();
			
			// mlevel 값 가져오기
			String p_level = dto.getP_level();

			if (p_level != null) {
				ModelAndView mav = new ModelAndView("redirect:/partner/partnerpage");
				session.setAttribute("p_id", dto.getP_id());
				session.setAttribute("p_passwd", dto.getP_passwd());
				session.setAttribute("p_name", dto.getP_name());
				session.setAttribute("p_level", dto.getP_level());
				
				
				return mav;
				
			} else {
				ModelAndView mav = new ModelAndView("/partner/partnerlogin");
				mav.addObject("Loginmessage", "회원이 아닙니다. 로그인을 해주세요");
				return mav;
			}
		} else {
			ModelAndView mav = new ModelAndView("/partner/partnerlogin");
			mav.addObject("Loginmessage", "회원이 아닙니다. 로그인을 해주세요");
			return mav;
		}
	}

		
	// 약관동의
	@RequestMapping("/partner/agreement")
	public String partneragreement() {
		return "partner/agreement";
	}
	
	//회원가입
	@RequestMapping("/partner/partnerRegister")
	public String partnerRegister() {
		return "partner/partnerRegister";
	}
	//아이디 중복 확인
	@RequestMapping("/partner/idCheckForm")
	public String idCheckForm() {
		return "partner/idCheckForm";
	}
	
	// 아이디 중복확인 페이지 이동
	@RequestMapping("/partner/partneridCheckForm")
	public String partneridCheckForm() {
		return "partner/partneridCheckForm";
	}
	
	// 이메일 중복확인페이지 이동
	@RequestMapping("/partner/partneremailCheckForm")
	public String partneremailCheckForm() {
		return "partner/partneremailCheckForm";
	}

	//회원가입
	@RequestMapping(value = "/partner/pRegister", method = RequestMethod.POST)
	public String partnerRegister(partnerDTO dto,RedirectAttributes redirectAttributes) {
	partnerDAO.insert(dto);
	redirectAttributes.addFlashAttribute("registerSuccessMessage", "회원 가입이 성공적으로 완료되었습니다.");
		return "redirect:/partner/partnerlogin";
		}

	
	// 아이디 중복 확인 처리
	@RequestMapping("/partner/partneridCheckProc")
	public ModelAndView duplicateId(@RequestParam("p_id") String p_id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("partner/partneridCheckProc");
		int cnt = partnerDAO.duplicateId(p_id);
		session.setAttribute("p_id", p_id);
		session.setAttribute("cnt", cnt);
		return mav;
	}

	// 이메일 중복처리
	@RequestMapping("/partner/duplicateemail")
	public ModelAndView emailduplicate(@RequestParam("p_email") String p_email, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("partner/duplicateemail");
		int cnt = partnerDAO.duplicateemail(p_email);
		session.setAttribute("p_email", p_email);
		session.setAttribute("cnt", cnt);
		return mav;
	}
	
		 //로그아웃 처리
		// session.invalidate() 모든 세션을 제거시킴 ->회원이나 판매자나 거기서 거기임
		@RequestMapping("/partner/partnerlogout.do")
		public String logout(HttpServletRequest request) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
			}
			return "redirect:/partner/partnerlogin";
		}
		
		
	//회원정보 수정-모든 정보 불러오기
	@RequestMapping("/partner/partnerModify")
	public ModelAndView partnerModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String p_id = (String) request.getSession().getAttribute("p_id");
		mav.setViewName("/partner/partnerModify");
		mav.addObject("partner",partnerDAO.select(p_id));
		return mav;
	}
	
		//회원 정보 수정
		@RequestMapping("/partner/update.do")
		public ModelAndView update(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		    ModelAndView mav = new ModelAndView();
		    String p_id = (String) req.getSession().getAttribute("p_id");

		    if(p_id!=null){
		       partnerDTO dto = partnerDAO.select(p_id);
		        if (p_id.equals(dto.getP_id())) {
		            map.put("id", p_id); // 회원 ID를 Map에 추가
		            partnerDAO.update(map);
		            mav.addObject("updateMessage", "회원정보가 성공적으로 수정되었습니다.");
		            mav.setViewName("/partner/partnerModify");
		        } else {
		            mav.setViewName("redirect:/partner/partnerlogin");
		        }
		    }
		    return mav;
		}
		
		//회원탈퇴
		//delete가 아닌 update로 회원 등급만 바꿔서 저장하도록 한다.
		@RequestMapping("/partner/partnerWithdraw")
		public String partnerWithdraw() {
			return "/partner/partnerWithdraw";
		}
		
		//회원 탈퇴 처리
		@RequestMapping("/partner/delete.do")
		public ModelAndView delete(HttpServletRequest request,@RequestParam("p_passwd") String p_passwd) {
			ModelAndView mav=new ModelAndView();
			String p_id = (String) request.getSession().getAttribute("p_id");
			
			//비밀번호 아이디가 일치한다면삭제하도록한다
			int partnerDelete = partnerDAO.delete(p_id,p_passwd);
			
			//int로 값을 받아오도록 하고 성공하면 1의 값을 return 시킨다.
			if (partnerDelete > 0) {
				 
			//삭제시 메시지 전달	 
			mav.addObject("deleteMessage","정상적으로 탈퇴되었습니다");
			mav.setViewName("/partner/partnerWithdraw");
			
			//회원탈퇴시 로그인하지 않은상태가 되어야 한다 -> session.invalidate로
			//세션에 저장된 모든 정보를 지워버림
			HttpSession session = request.getSession(false);
			session.invalidate();
			
			}else {
				mav.addObject("errorMessage","비밀번호가 일치하지 않습니다");
				mav.setViewName("/partner/partnerWithdraw");
			}				
			return mav;
		}
		
		// 아이디 찾기 페이지 이동 
				@RequestMapping("/partner/pfindId.do")
				public String findid() {
					return "partner/partnerfindId";
				}

		 // 메일 보내기 기존 myweb 코드 참조
				@RequestMapping("/partner/pfindidproc.do")
				public ModelAndView find(partnerDTO dto) throws Exception {
					ModelAndView mav = new ModelAndView();
					String p_name=dto.getP_name();
					String p_email=dto.getP_email();
					

					if (partnerDAO.findID(p_email, p_name) != null) {
						//null이 아니라면
						// 임시 비밀번호 생성
						
						char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E',
								'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
								'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
								'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
						String p_id=dto.getP_id();
						String p_passwd="";
						int idx = 0;
						for (int i = 0; i < 10; i++) {
							idx = (int) (charSet.length * Math.random());
							p_passwd +=charSet[idx];
							
						}

						int cnt=partnerDAO.renewPW(p_name,p_email, p_passwd);

						if (cnt == 1) {
							//메일 서버관련 설정
							String mailServer = "mw-002.cafe24.com";
							Properties props = new Properties();
							props.put("mail.smtp.host", mailServer);
							props.put("mail.smtp.auth", "true");

							Authenticator myAuth = new MyAuthenticator();
							Session session = Session.getInstance(props, myAuth);

							try {
								//try catch로 오류 메세지 check
								InternetAddress[] address = { new InternetAddress(dto.getP_email()) };
								Message message = new MimeMessage(session);
								message.setRecipients(Message.RecipientType.TO, address);
								message.setFrom(new InternetAddress(dto.getP_email()));
								message.setSubject("요청하신 아이디와 임시 비밀번호입니다");
								message.setContent("아이디: " + p_id + "<br>임시 비밀번호: " + p_passwd,
										"text/html; charset=UTF-8");
								message.setSentDate(new Date());

								Transport.send(message);
								mav.addObject("PFindIdmessage", "이메일로 아이디와 임시 비밀번호가 전송되었습니다.");
								
							} catch (MessagingException e) {
								e.printStackTrace();
								mav.addObject("FindIdfailmessage", "이메일 전송 중 오류가 발생하였습니다."+e);
								mav.setViewName("/partner/partnerfindId");
							}
							
						} else {
							mav.addObject("FindIdmessage", "비밀번호 업데이트에 실패하였습니다.");
							mav.setViewName("/partner/partnerfindId");
						}

						mav.setViewName("/partner/partnerlogin");

					} else {
						mav.addObject("FindIdfailmessage", "존재하지 않는 회원입니다.");
						mav.setViewName("/partner/partnerfindId");
					}

					return mav;
				}
				
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
	//F_infoList 출력
	@RequestMapping("/partner/F_infoList")
	public ModelAndView F_infoList(HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		String p_id = (String) session.getAttribute("p_id");

		ModelAndView mav = new ModelAndView();
		mav.addObject("p_id", p_id);
		mav.setViewName("/product/F_infoList");
		mav.addObject("F_infoList", partnerDAO.F_infoList(p_id));
		return mav;
	}//F_infoList() end
	
	
	//T_infoList 출력
	@RequestMapping("/partner/T_infoList")
	public ModelAndView T_infoList(HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		String p_id = (String) session.getAttribute("p_id");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("p_id", p_id);
		mav.setViewName("/product/T_infoList");
		mav.addObject("T_infoList", partnerDAO.T_infoList(p_id));
		return mav;
	}//T_infoList() end
	
	
	//F_infoForm
	@RequestMapping("/partner/F_infoForm")
	public ModelAndView F_infoForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/F_infoForm");
		return mav;
	}//F_infoForm() end
	
	
	//T_infoForm
	@RequestMapping("/partner/T_infoForm")
	public ModelAndView T_infoForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/T_infoForm");
		return mav;
	}//transinfoForm() end
	
	
	//F_infoInsert
	@RequestMapping("/partner/F_infoInsert")
	public String F_infoInsert(@RequestParam Map<String, Object> map
								 ,@RequestParam MultipartFile img
								 ,HttpServletRequest req
								 ,HttpSession session) {
		String filename = "-";
		long filesize = 0;
		if(img != null && !img.isEmpty()) {
			filename = img.getOriginalFilename();
			filesize = img.getSize();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); //실제 물리적인 경로
				img.transferTo(new File(path + "\\" + filename));  //파일저장
			} catch (Exception e) {
				e.printStackTrace(); //System.out.println(e);
			}//try end
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		//파트너 id 추가
		String p_id = (String) session.getAttribute("p_id");
		map.put("p_id", p_id);
		
		partnerDAO.F_infoInsert(map);
		
		return "redirect:/partner/F_infoList";
		
	}//F_infoInsert() end
	
	
	//T_infoInsert
	@RequestMapping("/partner/T_infoInsert")
	public String T_infoInsert(@RequestParam Map<String, Object> map
								 ,@RequestParam MultipartFile img
								 ,HttpServletRequest req
								 ,HttpSession session) {
		String filename = "-";
		long filesize = 0;
		if(img != null && !img.isEmpty()) {
			filename = img.getOriginalFilename();
			filesize = img.getSize();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); //실제 물리적인 경로
				img.transferTo(new File(path + "\\" + filename));  //파일저장
			} catch (Exception e) {
				e.printStackTrace(); //System.out.println(e);
			}//try end
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		//파트너 id 추가
		String p_id = (String) session.getAttribute("p_id");
		map.put("p_id", p_id);
		
		partnerDAO.T_infoInsert(map);
		
		return "redirect:/partner/T_infoList";
		
	}//T_infoInsert() end
	
	
	//F_proForm
		@RequestMapping("/partner/F_proForm")
		public ModelAndView F_proForm(HttpServletRequest req) {
			String trans_code = req.getParameter("trans_code");
			String FT_code = req.getParameter("FT_code");
			String p_id = req.getParameter("p_id");
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("trans_code", trans_code);
			mav.addObject("FT_code", FT_code);
			mav.addObject("p_id", p_id);
			mav.setViewName("product/F_proForm");
			return mav;
		}//F_proForm() end
		
	
	//T_proForm
	@RequestMapping("/partner/T_proForm")
	public ModelAndView T_proForm(HttpServletRequest req) {
		String trans_code = req.getParameter("trans_code");
		String FT_code = req.getParameter("FT_code");
		String p_id = req.getParameter("p_id");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("trans_code", trans_code);
		mav.addObject("FT_code", FT_code);
		mav.addObject("p_id", p_id);
		mav.setViewName("product/T_proForm");
		return mav;
	}//T_proForm() end
	
	
	//F_proInsert
	@RequestMapping("/partner/F_proInsert")
	public String F_proInsert(@RequestParam Map<String, Object> map
								 ,HttpServletRequest req
								 ,HttpSession session) {
		
		//transpro_code 생성하기
		//1) 비행기상품인 경우 FP, 기차상품인 경우 TP로 시작
		String transproCodePrefix = ""; //transpro_code 접두사
		String FT_code = req.getParameter("FT_code");
		
		if("F".equals(FT_code)) {
			transproCodePrefix = "FP";
		}else if("T".equals(FT_code)) {
			transproCodePrefix = "TP";
		}//if end
		
		//2) 4자리의 랜덤번호 생성
		int n = (int)(Math.random()*10000+1);
		
		//3) 구분코드 + 랜덤번호 하여 transpro_code 생성		
		/*
		1) 첫번째 방법 : 숫자가 1자리수부터 4자리수까지 랜덤으로 생성, 4자리가 아닌 경우 0이 붙지 않음 
		String transpro_code = transproCodePrefix + n;
		*/
		
		/*
		2) 두번째 방법 : 숫자는 4자리수로 나오나 문자가 맨앞 한글자씩만 나옴
		char transproCodePrefixChar1 = transproCodePrefix.charAt(0);
		String transpro_code = String.format("%c%04d", transproCodePrefixChar, n);
		*/
		
		//3) 세번째 방법
		String transpro_code = transproCodePrefix + String.format("%04d", n); 
		
		
		///////////////////////////////////////////////////////////////
		
		map.put("transpro_code", transpro_code);
		
		//p_id 추가
		//String p_id = "partner_id_01";
		String p_id = (String) session.getAttribute("p_id");
		map.put("p_id", p_id);
		
		
		partnerDAO.F_proInsert(map);
		
		return "redirect:/partner/F_proList";
		
	}//F_proInsert() end
	
	
	//T_proInsert
	@RequestMapping("/partner/T_proInsert")
	public String T_proInsert(@RequestParam Map<String, Object> map
								 ,HttpServletRequest req
								 ,HttpSession session) {
		
		//transpro_code 생성하기
		//1) 비행기상품인 경우 FP, 기차상품인 경우 TP로 시작
		String transproCodePrefix = ""; //transpro_code 접두사
		String FT_code = req.getParameter("FT_code");
		
		if("F".equals(FT_code)) {
			transproCodePrefix = "FP";
		}else if("T".equals(FT_code)) {
			transproCodePrefix = "TP";
		}//if end
		
		//2) 4자리의 랜덤번호 생성
		int n = (int)(Math.random()*10000+1);
		
		//3) 구분코드 + 랜덤번호 하여 transpro_code 생성		
		/*
		1) 첫번째 방법 : 숫자가 1자리수부터 4자리수까지 랜덤으로 생성, 4자리가 아닌 경우 0이 붙지 않음 
		String transpro_code = transproCodePrefix + n;
		*/
		
		/*
		2) 두번째 방법 : 숫자는 4자리수로 나오나 문자가 맨앞 한글자씩만 나옴
		char transproCodePrefixChar1 = transproCodePrefix.charAt(0);
		String transpro_code = String.format("%c%04d", transproCodePrefixChar, n);
		*/
		
		//3) 세번째 방법
		String transpro_code = transproCodePrefix + String.format("%04d", n); 
		
		
		///////////////////////////////////////////////////////////////
		
		map.put("transpro_code", transpro_code);
		
		//p_id 추가
		//String p_id = "partner_id_01";
		String p_id = (String) session.getAttribute("p_id");
		System.out.println(p_id);
		map.put("p_id", p_id);
		
		
		partnerDAO.T_proInsert(map);
		
		return "redirect:/partner/T_proList";
		
	}//F_proInsert() end
	
	
	//F_proList
		@RequestMapping("/partner/F_proList")
		public ModelAndView F_proList(HttpServletRequest request) {
			
			HttpSession session = request.getSession(true);
			String p_id = (String) session.getAttribute("p_id");
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("p_id", p_id);
			mav.setViewName("product/F_proList");
			mav.addObject("F_proList", partnerDAO.F_proList(p_id));
			return mav;
		}//F_proList() end
	
	
	//T_proList
	@RequestMapping("/partner/T_proList")
	public ModelAndView T_proList(HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		String p_id = (String) session.getAttribute("p_id");
		
		ModelAndView mav = new ModelAndView();		
		mav.addObject("p_id", p_id);
		mav.setViewName("product/T_proList");
		mav.addObject("T_proList", partnerDAO.T_proList(p_id));
		return mav;
	}//T_proList() end
	
	
	@RequestMapping("/partner/F_infoDelete")
	public String F_infoDelete(HttpServletRequest req) {
		String trans_code = req.getParameter("trans_code");
		partnerDAO.F_infoDelete(trans_code);
		
		return "redirect:/partner/F_infoList";
	}//F_infoDelete() end
	
	
	@RequestMapping("/partner/T_infoDelete")
	public String T_infoDelete(HttpServletRequest req) {
		String trans_code = req.getParameter("trans_code");
		partnerDAO.T_infoDelete(trans_code);
		
		return "redirect:/partner/T_infoList";
	}//T_infoDelete() end
	
	
	@RequestMapping("/partner/F_proDelete")
	public String F_proDelete(HttpServletRequest req) {
		String transpro_code = req.getParameter("transpro_code");		
		partnerDAO.F_proDelete(transpro_code);
		
		return "redirect:/partner/F_proList";		
	}//F_proDelete() end
	
	
	@RequestMapping("/partner/T_proDelete")
	public String T_proDelete(HttpServletRequest req) {
		String transpro_code = req.getParameter("transpro_code");		
		partnerDAO.T_proDelete(transpro_code);
		
		return "redirect:/partner/T_proList";		
	}//T_proDelete() end
	
		
}//end
