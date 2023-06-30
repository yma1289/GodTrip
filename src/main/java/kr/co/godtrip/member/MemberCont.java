package kr.co.godtrip.member;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.MemberResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.godtrip.payment.PaymentDAO;
import net.utility.MyAuthenticator;

@Controller
@RequestMapping("/member")
public class MemberCont {
	public MemberCont() {
		System.out.println("----MemberCont() 객체생성됨");
	}

	@Autowired
	MemberDAO memberDao;

	// 기존 코드 충돌 -> mapping 연결시도시 에러가 다수 발생

	// 로그인 페이지
	@RequestMapping("/memberlogin")
	public String memberlogin() {
		return "member/memberlogin";

	}
	//로그인
	@RequestMapping(value = "/login.do")
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("passwd") String passwd,
			HttpServletRequest request, HttpSession session) {
		
		// 회원 정보 조회하기 MemberDTO dto = memberDao.loginProc(id);
		
		MemberDTO dto = memberDao.loginProc(id, passwd);

		if (dto != null) {

			// id에 대한 설정이 필요하다 String id=dto.getId();
			
			// mlevel 값 가져오기
			String mlevel = dto.getMlevel();

			if (!(mlevel.equals("F1"))) {
				ModelAndView mav = new ModelAndView("redirect:/home");
				// 로그인 성공시 이동 페이지
				// 로그인 성공한 경우 세션 부여하기

				session.setAttribute("s_id", dto.getId());
				session.setAttribute("s_passwd", dto.getPasswd());
				session.setAttribute("mname", dto.getMname());
				session.setAttribute("s_mlevel", dto.getMlevel());
				
				return mav;
			} else {
				ModelAndView mav = new ModelAndView("/member/memberlogin");
				mav.addObject("Loginmessage", "회원이 아닙니다. 로그인을 해주세요");
				return mav;
			}
		} else {
			ModelAndView mav = new ModelAndView("/member/memberlogin");
			mav.addObject("Loginmessage", "회원이 아닙니다. 로그인을 해주세요");
			return mav;
		}
	}

	// 약관동의
	@RequestMapping("/agreement")
	public String memberregister() {
		return "member/agreement";
	}

	// 약관 동의시 회원가입 페이지 이동
	@RequestMapping("/memRegister")
	public String memRegister() {
		return "member/memRegister";
	}

	// 회원가입, post방식으로 데이터를 받은경우 insert
	@RequestMapping(value = "/Register", method = RequestMethod.POST)
	public String memRegister(MemberDTO dto,RedirectAttributes redirectAttributes) {
		memberDao.insert(dto);
		 redirectAttributes.addFlashAttribute("registerSuccessMessage", "회원 가입이 성공적으로 완료되었습니다.");		
		return "redirect:/member/memberlogin";
	}

	
	// 아이디 중복확인 페이지 이동
	@RequestMapping("/idCheckForm")
	public String idCheckForm() {
		return "member/idCheckForm";
	} 

	// 아이디 중복 확인 처리
	@RequestMapping("/idCheckProc")
	public ModelAndView duplicateId(@RequestParam("id") String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/idCheckProc");
		int cnt = memberDao.duplicateId(id);
		session.setAttribute("id", id);
		session.setAttribute("cnt", cnt);
		return mav;
	}

	// 이메일 중복확인페이지 이동
	@RequestMapping("/emailCheckForm")
	public String emailCheckForm() {
		return "member/emailCheckForm";
	}

	@RequestMapping("/duplicateemail")
	public ModelAndView emailduplicate(@RequestParam("email") String email, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/duplicateemail");
		int cnt = memberDao.duplicateemail(email);
		session.setAttribute("email", email);
		session.setAttribute("cnt", cnt);
		return mav;
	}

	// 로그아웃 처리
	// session.invalidate() 모든 세션을 제거시킴
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/member/memberlogin";
	}

	// 회원 정보 수정
	// 회원정보 수정처리
	// 보통 2가지 방식 	   - 1.로그인 할 당시에 사용자에 대한 모든 정보를 세션에 불러와서 ${} 방식으로 넣기.
	//						->아이디와 세션값이 자주바뀌는 환경이면, 오류 발생할 가능성 다수
	//				   - 2.아이디로 조회해서 db에서 조회한 뒤 모든 내용을 넣어버리기
	
	//db에서 id를 조회에서 모든 값을 불러오기
	@RequestMapping("/memberModify")
	public ModelAndView memberModify(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		
	String s_id= (String) request.getSession().getAttribute("s_id");
	mav.setViewName("member/memberModify");
	mav.addObject("member",memberDao.select(s_id));
	return mav;
	}

// --MESSAGE를 보내지 않아서 , CMD로 직접 확인 필수!!	
//	@RequestMapping("update")
//	public String update(@RequestParam Map<String, Object> map, HttpServletRequest req) {
//	    String s_id = (String) req.getSession().getAttribute("s_id");
//
//	    if(s_id!=null){
//	        MemberDTO dto = memberDao.select(s_id);
//	        if (s_id.equals(dto.getId())) {
//	            map.put("id", s_id); // 회원 ID를 Map에 추가
//	            memberDao.update(map);
//	        }
//	    }
//	    req.setAttribute("updateMessage", "회원정보가 성공적으로 수정되었습니다.");
//	    return "redirect:/member/memberlogin";
//	}


	@RequestMapping("update")
	public ModelAndView update(@RequestParam Map<String, Object> map, HttpServletRequest req) {
	    ModelAndView mav = new ModelAndView();
	    String s_id = (String) req.getSession().getAttribute("s_id");

	    if(s_id!=null){
	        MemberDTO dto = memberDao.select(s_id);
	        if (s_id.equals(dto.getId())) {
	            map.put("id", s_id); // 회원 ID를 Map에 추가
	            memberDao.update(map);
	            mav.addObject("updateMessage", "회원정보가 성공적으로 수정되었습니다.");
	            mav.setViewName("/member/memberModify");
	        } else {
	            mav.setViewName("redirect:/member/memberlogin");
	        }
	    }
	    return mav;
	}
	
	//회원탈퇴
	//delete가 아닌 update로 회원 등급만 바꿔서 저장하도록 한다.
	@RequestMapping("/memberWithdraw")
	public String memberWithdraw() {
		return "/member/memberWithdraw";
	}
	
	//회원 탈퇴 처리
	@RequestMapping("/delete.do")
	public ModelAndView delete(HttpServletRequest request,@RequestParam("passwd") String passwd) {
		ModelAndView mav=new ModelAndView();
		String s_id = (String) request.getSession().getAttribute("s_id");
		
		//비밀번호 아이디가 일치한다면삭제하도록한다
		int memDelete = memberDao.delete(s_id, passwd);
		
		//int로 값을 받아오도록 하고 성공하면 1의 값을 return 시킨다.
		if (memDelete > 0) {
			 
		//삭제시 메시지 전달	 
		mav.addObject("deleteMessage","정상적으로 탈퇴되었습니다");
		mav.setViewName("/member/memberWithdraw");
		
		//회원탈퇴시 로그인하지 않은상태가 되어야 한다 -> session.invalidate로
		//세션에 저장된 모든 정보를 지워버림
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		}else {
			mav.addObject("errorMessage","비밀번호가 일치하지 않습니다");
			mav.setViewName("/member/memberWithdraw");
		}
				
		return mav;
	}
	
		// 아이디 찾기 페이지 이동 
		@RequestMapping("findId.do")
		public String findid() {
			return "member/findId";
		}

//////		메일 보내기 기존 myweb 코드 참조
		@RequestMapping("/findidproc.do")
		public ModelAndView find(MemberDTO dto) throws Exception {
			ModelAndView mav = new ModelAndView();
			String mname=dto.getMname();
			String email=dto.getEmail();
			//System.out.println(dto.toString()); mname=메일테스트, email=jqrkp7077@naver.com,

			if (memberDao.findID(email, mname) != null) {
				//null이 아니라면
				// 임시 비밀번호 생성
				//System.out.println(memberDao.findID(email, mname));  id=123456
				char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E',
						'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
						'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
						'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
				String id=dto.getId();
				String passwd="";
				int idx = 0;
				for (int i = 0; i < 10; i++) {
					idx = (int) (charSet.length * Math.random());
					passwd +=charSet[idx];
				}

				int cnt=memberDao.renewPW(mname, email, passwd);
				System.out.println(mname);
				System.out.println(email);
				System.out.println(passwd);
				System.out.println("-----------"+cnt);
				
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
						InternetAddress[] address = { new InternetAddress(dto.getEmail()) };
						Message message = new MimeMessage(session);
						message.setRecipients(Message.RecipientType.TO, address);
						message.setFrom(new InternetAddress(dto.getEmail()));
						message.setSubject("요청하신 아이디와 임시 비밀번호입니다");
						message.setContent("아이디: " + id + "<br>임시 비밀번호: " + passwd,
								"text/html; charset=UTF-8");
						message.setSentDate(new Date());

						Transport.send(message);
						mav.addObject("FindIdmessage", "이메일로 아이디와 임시 비밀번호가 전송되었습니다.");
						
					} catch (MessagingException e) {
						e.printStackTrace();
						mav.addObject("FindIdfailmessage", "이메일 전송 중 오류가 발생하였습니다."+e);
						mav.setViewName("/member/findId");
					}
					
				} else {
					mav.addObject("FindIdmessage", "비밀번호 업데이트에 실패하였습니다.");
					mav.setViewName("/member/findId");
				}

				mav.setViewName("/member/memberlogin");

			} else {
				mav.addObject("FindIdfailmessage", "존재하지 않는 회원입니다.");
				mav.setViewName("/member/findId");
			}

			return mav;
		}
		
		//세션 값이 넘어오지 않아서 
		//request.getsession으로 세션 변수값들을 가져옴

		@RequestMapping("/memberpage")
		public ModelAndView partnerpage(HttpServletRequest request) {
			
			HttpSession session = request.getSession(true);			
			String id = (String)session.getAttribute("s_id");
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/member/memberpage");
			
			//payment 테이블에 있는 내용 list에 담아서 불러오기
			List<Map<String, Object>> paymentList = memberDao.paymentList(id);
			mav.addObject("paymentList", paymentList);
			mav.addObject("id", id);			
			
			
			
			
			return mav;
		}
		
		
				
//		//네이버 smtp 서버를 통한 메일 보내기 
//				//현재 null 오류 발생 - 보류
//				@RequestMapping("/findidproc.do")
//				public ModelAndView find(MemberDTO dto) throws Exception {
//					//System.out.println("111111111");
//					//System.out.println(dto.toString());
//					
//					
//				    ModelAndView mav = new ModelAndView();
//
//				    String email=dto.getEmail();
//				    String mname=dto.getMname();
//				    		
//				    
//				    // 프로퍼티 파일 로드
//				    Properties properties = new Properties();
//				    properties.load(getClass().getClassLoader().getResourceAsStream("application.properties"));
//
//				   // 프로퍼티 값 가져오기 & null 체크
//				    String host = properties.getProperty("mail.host");
//				    String mailPort = properties.getProperty("mail.port");
//				    int port = (mailPort != null && !mailPort.isEmpty()) ? Integer.parseInt(mailPort) : 0;
//				    String smtpUser = properties.getProperty("mail.smtpUser");
//				    String smtpPassword = properties.getProperty("mail.smtpPassword");
//				    String smtpAuth = properties.getProperty("mail.smtpAuth");
//
//				    String starttlsEnableKey = properties.getProperty("mail.smtp.starttls.enable");
//				    boolean starttlsEnable = starttlsEnableKey != null ? Boolean.parseBoolean(starttlsEnableKey) : false;
//
//				    String sslTrust = properties.getProperty("maQil.smtp.ssl.trust");
//
//				    if (memberDao.findID(email, mname) != null) {
//				        char[] charSet = new char[]{
//				                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
//				                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
//				                'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
//				                'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
//				                'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
//				                'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
//				        };
//
//				        StringBuilder str = new StringBuilder();
//				        int idx;
//				        for (int i = 0; i < 10; i++) {
//				            idx = (int) (charSet.length * Math.random());
//				            str.append(charSet[idx]);
//				        }
//				        String passwd = str.toString();
//				        //update query-> 실행이 완료되면 행의 갯수를 반환 해줌
//				        //보통 cnt 사용
//				        
//				        
//				        
//				        String content = "임시 비밀번호를 보내드립니다. ";
//				        content += "추후 로그인하여 바꾸시길 바랍니다. ";
//				        content += "<hr>";
//				        content += "임시 발급된 비밀번호:" + str.toString();
//
//				        Properties mailProperties = new Properties();
//				        mailProperties.put("mail.smtp.host",host);
//				        mailProperties.put("mail.smtp.port",port);
//				        mailProperties.put("mail.smtp.auth",smtpAuth);
//				        mailProperties.put("mail.smtp.starttls.enable",starttlsEnable);
//				        mailProperties.put("mail.smtp.ssl.trust",sslTrust);
//
//				        Authenticator myAuth = new Authenticator() {
//				            protected PasswordAuthentication getPasswordAuthentication() {
//				                return new PasswordAuthentication(smtpUser, smtpPassword);
//				            }
//				        };
//
//				        Session session = Session.getDefaultInstance(mailProperties, myAuth);
//
//				        InternetAddress[] to = { new InternetAddress(dto.getEmail()) };
//				        Message message = new MimeMessage(session);
//				        message.setFrom(new InternetAddress(smtpUser));
//				        message.setRecipients(Message.RecipientType.TO, to);
//				        message.setSentDate(new Date());
//				        message.setSubject("요청하신 아이디와 비밀번호");
//				        message.setContent(content, "text/html; charset=UTF-8");
//
//				        Transport.send(message); // 이메일 전송
//
//				        int cnt = memberDao.renewPW(passwd,mname, email);
//				        if (cnt == 1) {
//				            mav.addObject("result", cnt);
//				            mav.setViewName("/member/memberlogin");
//				            mav.addObject("FindIdmessage", "이메일 전송 완료");
//				            return mav;
//				        }
//				    }
//
//				    mav.setViewName("/member/findId");
//				    mav.addObject("FindIdfailmessage", "이름과 이메일 주소를 다시 확인해 주세요");
//				    return mav;
//				}

			
		
		
		
}// controller
