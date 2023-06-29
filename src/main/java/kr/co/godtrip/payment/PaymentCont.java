package kr.co.godtrip.payment;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.godtrip.member.MemberDAO;
import kr.co.godtrip.member.MemberDTO;
import netscape.javascript.JSObject;

@Controller
@RequestMapping("/payment")
public class PaymentCont {
	public PaymentCont() {
		System.out.println("-----PaymentCont() 객체생성됨");
	}
	
	@Autowired
	PaymentDAO paymentDao;
	
	@Autowired
	MemberDAO memberDao;
		
	@RequestMapping("/paymentForm")
		   public String paymentForm(HttpServletRequest req,HttpSession session) {
		      String id=(String)session.getAttribute("s_id");
		      paymentDao.roomDelete(id);
		      paymentDao.transDelete(id);
		      return "payment/paymentForm";
		   }//paymentForm() end
		   
	
	
    //현재 발생하는 오류? -> 결제 취소를 하면 로그인이 풀림	
	//syso 찍으면 id값이 나와야함. productDetail페이지에서 id값이 안나옴-> 세션 유지가 안됨
	@GetMapping("/productDetail")
	@ResponseBody
	public Map<String, Object> payinfo(HttpServletRequest request,HttpSession session) {
	System.out.println("11111111111111");
		
		String id= (String) session.getAttribute("s_id");
		System.out.println(id);
		
		//데이터를 담을 Map 생성
		Map<String,Object> map = new HashMap<>();
		
		
		map = memberDao.findById(id);
		
		//System.out.println(map.toString());
		
		
//		 MemberDTO dto = memberDao.findById(id);
	
		/*
		 * if (dto != null) { request.setAttribute("buyer_name", dto.getMname());
		 * request.setAttribute("buyer_tel", dto.getTel());
		 * request.setAttribute("buyer_email", dto.getEmail());
		 * request.setAttribute("buyer_addr", dto.getAddress1() + dto.getAddress2());
		 * request.setAttribute("buyer_postcode", dto.getZipcode()); }
		 */
						
		return map;
		//end시 걸어줄 웹페이지
	}
	
	///payload-> 클라이언트에서 서버로 전달되는 데이터
	//일반적으로 요청 본문에 포함되어 있으며, 클라이언트와 서버 간에 상호 작용하는 데 필요한 핵심 데이터
	//사용된 코드에서,자바스크립트에서 서버로 데이터를 전송하려고 JSON.stringify() 메소드를 사용하여 JSON 객체를 문자열로 변환하고 있다.
	/*
	@GetMapping("/payfetch")
	public String paytest() {
		return "payment/payfetch";
	}
	*/
	
	 @RequestMapping(value = "/payfetch", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	    public String payfetch(HttpServletRequest req, @RequestBody Map<String, Object> payload) {
	        //ModelAndView modelAndView = new ModelAndView();
	        Map<String, Object> resultMap = new HashMap<>();

	        // 본문에서 받은 JSON 데이터 처리
	        String id= (String) payload.get("id");
	        String merchant_uid = (String) payload.get("merchantUid");
	        String pg = (String) payload.get("pg");
	        String payMethod = (String) payload.get("payMethod");
	        String productName = (String) payload.get("productName");
	        
	        Integer amount = (Integer) payload.get("amount");
	   
	        String orderdate = (String) payload.get("orderdate");
	        
			Integer Price = (Integer) payload.get("Price");
			Integer Total = (Integer) payload.get("Total");
	        
	        String room_code = (String) payload.get("room_code");
	        String transpro_code = (String) payload.get("transpro_code");
	        String departureDate = (String) payload.get("departureDate");
	        String arrivalDate = (String) payload.get("arrivalDate");
	           
	            
//	            // 문자열을 Timestamp로 변환합니다. 포멧팅 오류 throws Exception 추가 필요하다면?
//	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	            java.util.Date parsedDepartureDate = dateFormat.parse(departureDate);
//	            Timestamp departureTimestamp = new Timestamp(parsedDepartureDate.getTime());
//
//	            java.util.Date parsedArrivalDate = dateFormat.parse(arrivalDate);
//	            Timestamp arrivalTimestamp = new Timestamp(parsedArrivalDate.getTime());
//	            	           	            
//	            java.util.Date parsedOrderDate = dateFormat.parse(orderdate);
//	            Timestamp orderTimestamp = new Timestamp(parsedOrderDate.getTime());
	            
	            // 수정: 생성된 값을 dto에 추가 또는 데이터베이스에 저장

	            PaymentDTO paymentDTO = new PaymentDTO();
	            paymentDTO.setId(id);
	            paymentDTO.setMerchant_uid(merchant_uid);
	            paymentDTO.setPg(pg);
	            paymentDTO.setPayMethod(payMethod);
	            paymentDTO.setProductName(productName);
	            paymentDTO.setAmount(amount);
	            paymentDTO.setOrderDate(orderdate);
				paymentDTO.setPrice(Price);
				paymentDTO.setTotal(Total);
	            paymentDTO.setRoom_code(room_code);
	            paymentDTO.setTranspro_code(transpro_code);
	            paymentDTO.setDepartureDate(departureDate);
	            paymentDTO.setArrivalDate(arrivalDate);
	           
	            paymentDao.roomDelete(id);
			    paymentDao.transDelete(id);
	            
	            System.out.println(paymentDTO);
	            
	            // DAO를 사용하여 데이터베이스에 데이터 저장
	            int success = paymentDao.insert(paymentDTO);
	            String result="";
	            if (success > 0) {
	            	result="success";
	                //resultMap.put("result", "success");
	                //modelAndView.addObject("result", resultMap);
	                //modelAndView.setViewName("/payment/finalreserveForm");
	            } else {
	            	result="fail";
	                //resultMap.put("result", "error");
	                //modelAndView.addObject("result", resultMap);
	                //modelAndView.setViewName("errorPage"); // 적절한 오류 페이지로 변경
	            }

	            //return modelAndView;
	            JSONObject json=new JSONObject();
	            json.put("result", result);
	            return json.toString();
	        }
	   
	 	/*
	    @RequestMapping("/finalreserveForm")
		public String finalreserveForm() {
			return "/payment/finalreserveForm";
		}
		*/
	
	
}
