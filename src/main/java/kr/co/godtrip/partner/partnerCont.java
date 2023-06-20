package kr.co.godtrip.partner;

import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.godtrip.member.MemberDTO;
import net.utility.MyAuthenticator;

@Controller
@RequestMapping("/partner")
public class partnerCont {

	public partnerCont() {
		System.out.println("partnerController 생성");
	}

	@Autowired
	partnerDAO partnerDAO;

	// 로그인 페이지
	@RequestMapping("/partnerlogin")
	public String partnerlogin() {
		return "partner/partnerlogin";

	}
	
	@RequestMapping(value = "/partnerlogin.do")
	public ModelAndView login(@RequestParam("p_id") String p_id, @RequestParam("p_passwd") String p_passwd,
			HttpServletRequest request, HttpSession session) {
		
		// 회원 정보 조회하기 MemberDTO dto = memberDao.loginProc(id);
		
		partnerDTO dto = partnerDAO.loginProc(p_id, p_passwd);

		if (dto != null) {

			// id에 대한 설정이 필요하다 String id=dto.getId();
			
			// mlevel 값 가져오기
			String p_level = dto.getP_level();

			if (!(p_level.equals("F1"))) {
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

	//세션값 가져오기 HttpSession session = request.getSession(true);
	@RequestMapping("/partnerpage")
	public String partnerpage(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		return "partner/partnerpage";

	}
	
	// 약관동의
	@RequestMapping("/agreement")
	public String partneragreement() {
		return "partner/agreement";
	}
	
	//회원가입
	@RequestMapping("/partnerRegister")
	public String partnerRegister() {
		return "partner/partnerRegister";
	}
	//아이디 중복 확인
	@RequestMapping("/idCheckForm")
	public String idCheckForm() {
		return "partner/idCheckForm";
	}
	
	// 아이디 중복확인 페이지 이동
	@RequestMapping("/partneridCheckForm")
	public String partneridCheckForm() {
		return "partner/partneridCheckForm";
	}
	
	// 이메일 중복확인페이지 이동
	@RequestMapping("/partneremailCheckForm")
	public String partneremailCheckForm() {
		return "partner/partneremailCheckForm";
	}

	//회원가입
	@RequestMapping(value = "/pRegister", method = RequestMethod.POST)
	public String partnerRegister(partnerDTO dto) {
	partnerDAO.insert(dto);
		return "redirect:/partner/partnerlogin";
		}

	
	// 아이디 중복 확인 처리
	@RequestMapping("/partneridCheckProc")
	public ModelAndView duplicateId(@RequestParam("p_id") String p_id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("partner/partneridCheckProc");
		int cnt = partnerDAO.duplicateId(p_id);
		session.setAttribute("p_id", p_id);
		session.setAttribute("cnt", cnt);
		return mav;
	}

	// 이메일 중복처리
	@RequestMapping("/duplicateemail")
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
		@RequestMapping("partnerlogout.do")
		public String logout(HttpServletRequest request) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
			}
			return "redirect:/partner/partnerlogin";
		}
		
		
	//회원정보 수정-모든 정보 불러오기
	@RequestMapping("/partnerModify")
	public ModelAndView memberModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String p_id = (String) request.getSession().getAttribute("p_id");
		mav.setViewName("partner/partnerModify");
		mav.addObject("partner",partnerDAO.select(p_id));
		return mav;
	}
	
		//회원 정보 수정
		@RequestMapping("update.do")
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
		@RequestMapping("/partnerWithdraw")
		public String memberWithdraw() {
			return "/partner/partnerWithdraw";
		}
		
		//회원 탈퇴 처리
		@RequestMapping("/delete.do")
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
				@RequestMapping("pfindId.do")
				public String findid() {
					return "partner/partnerfindId";
				}

		 // 메일 보내기 기존 myweb 코드 참조
				@RequestMapping("/pfindidproc.do")
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
								mav.addObject("FindIdmessage", "이메일로 아이디와 임시 비밀번호가 전송되었습니다.");
								
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
				
		
		
}//end
