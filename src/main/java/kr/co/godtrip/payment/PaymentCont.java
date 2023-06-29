package kr.co.godtrip.payment;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@GetMapping("/productDetail")
	@ResponseBody
	public String payinfo(HttpServletRequest request,HttpSession session) {
	System.out.println("11111111111111");
		
		String id= (String) session.getAttribute("s_id");
		System.out.println(id); 
		 MemberDTO dto = memberDao.findById(id);
	
			if (dto != null) {
			  request.setAttribute("buyer_name", dto.getMname());
               request.setAttribute("buyer_tel", dto.getTel());
               request.setAttribute("buyer_email", dto.getEmail());
               request.setAttribute("buyer_addr", dto.getAddress1() + dto.getAddress2());
               request.setAttribute("buyer_postcode", dto.getZipcode());
            }
		
						
		return "/payment/productdetail";
		//end시 걸어줄 웹페이지
	}
	
	///payload-> 클라이언트에서 서버로 전달되는 데이터
	//일반적으로 요청 본문에 포함되어 있으며, 클라이언트와 서버 간에 상호 작용하는 데 필요한 핵심 데이터
	//사용된 코드에서,자바스크립트에서 서버로 데이터를 전송하려고 JSON.stringify() 메소드를 사용하여 JSON 객체를 문자열로 변환하고 있다.
	
	
	 @RequestMapping(value = "/payfetch", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	    public ModelAndView payfetch(HttpServletRequest req, @RequestBody Map<String, Object> payload)throws Exception {
	        ModelAndView modelAndView = new ModelAndView();
	        Map<String, Object> resultMap = new HashMap<>();

	        // 본문에서 받은 JSON 데이터 처리
	        String merchant_uid = (String) payload.get("merchant_uid");
	        String pg = (String) payload.get("pg");
	        String payMethod = (String) payload.get("pay_method");
	        String productName = (String) payload.get("product_name");
	        Integer amount = (Integer) payload.get("amount");
	        String orderdate = (String) payload.get("orderdate");
	        Integer totalpay = (Integer) payload.get("totalpay");
	        Integer totalpay1 = (Integer) payload.get("totalpay1");
	        String room_code = (String) payload.get("room_code");
	        String transpro_code = (String) payload.get("transpro_code");
	        String departureDate = (String) payload.get("departure_date");
	        String arrivalDate = (String) payload.get("arrival_date");
	        String id= (String) payload.get("s_id");
	           
	            
//	            // 문자열을 Timestamp로 변환합니다. 포멧팅 오류
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
	            paymentDTO.setMerchant_uid(merchant_uid);
	            paymentDTO.setPg(pg);
	            paymentDTO.setPayMethod(payMethod);
	            paymentDTO.setProductName(productName);
	            paymentDTO.setAmount(amount);
	            paymentDTO.setOrderDate(orderdate);
	            paymentDTO.setTotalpay(totalpay);
	            paymentDTO.setTotalpay1(totalpay1);
	            paymentDTO.setRoom_code(room_code);
	            paymentDTO.setTranspro_code(transpro_code);
	            paymentDTO.setDepartureDate(departureDate);
	            paymentDTO.setArrivalDate(arrivalDate);
	            paymentDTO.setId(id);
	            
	            // DAO를 사용하여 데이터베이스에 데이터 저장
	            int success = paymentDao.insert(paymentDTO);

	            if (success > 0) {
	                resultMap.put("result", "success");
	                modelAndView.addObject("result", resultMap);
	                modelAndView.setViewName("finalreserveForm");
	            } else {
	                resultMap.put("result", "error");
	                modelAndView.addObject("result", resultMap);
	                modelAndView.setViewName("errorPage"); // 적절한 오류 페이지로 변경
	            }

	            return modelAndView;
	        }
	   
	
	
	
	
	
}
