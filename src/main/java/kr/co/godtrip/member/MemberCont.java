package kr.co.godtrip.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping(value = "/login.do")
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("passwd") String passwd,
			HttpServletRequest request, HttpSession session) { // 회원 정보 조회하기 MemberDTO dto = memberDao.loginProc(id);
		MemberDTO dto = memberDao.loginProc(id, passwd);

		if (dto != null) {

			// id에 대한 설정이 필요하다 String id=dto.getId(); // mlevel 값 가져오기
			String mlevel = dto.getMlevel();

			if (!(mlevel.equals("F1"))) {
				ModelAndView mav = new ModelAndView("redirect:/home.do");
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
			ModelAndView mav = new ModelAndView("/member/memberloginfail");
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
	public String memRegister(MemberDTO dto) {
		memberDao.insert(dto);
		return "redirect:/member/memberlogin";
	}

	// 아이디 찾기 이동

	@RequestMapping("/findId")
	public String findid() {
		return "member/findId";
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
	
	
}// controller
