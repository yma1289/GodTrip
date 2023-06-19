package kr.co.godtrip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/service")
public class ServiceCont {
    public ServiceCont() {
        System.out.println("-----ServiceCont() 객체생성됨");
    }

    @Autowired
    ServiceDAO serviceDao;

    @RequestMapping("/serviceList")
    public ModelAndView serviceList() {
        return serviceList(1); // 페이지 번호를 1로 지정하여 호출
    }

    @RequestMapping("/serviceList/{page}")
    public ModelAndView serviceList(@PathVariable int page) {
        int limit = 5;
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service/serviceList");
        mav.addObject("list", serviceDao.serviceList(page, limit));
        int totalCount = serviceDao.getTotalCount();
        mav.addObject("totalPages", (totalCount + limit - 1) / limit);
        mav.addObject("currentPage", page);
        return mav;
    }

    @RequestMapping("/serviceDetail/{c_code}")
    public ModelAndView serviceDetail(@PathVariable int c_code) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service/serviceDetail");
        mav.addObject("service", serviceDao.serviceDetail(c_code));
        mav.addObject("updateUrl", "/service/serviceUpdate");
        return mav;
    }

    @PostMapping("/serviceDelete/{cno}")
    public ResponseEntity<String> serviceDelete(@PathVariable int cno) {
        serviceDao.serviceDelete(cno);
        return ResponseEntity.ok("게시글이 삭제되었습니다.");
    }

 

    @RequestMapping("/serviceForm")
    public String serviceForm() {
        return "service/serviceForm";
    }

    @PostMapping("/serviceInsert")
    public ModelAndView serviceInsert(ServiceDTO dto) {
        serviceDao.serviceInsert(dto);
        return new ModelAndView("redirect:/service/serviceList");
    }

    @RequestMapping("/serviceUpdate/{cno}")
    public ModelAndView serviceUpdate(@PathVariable int cno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service/serviceUpdate");
        mav.addObject("service", serviceDao.serviceDetail(cno));
        return mav;
    }

    @PostMapping("/serviceUpdate")
    @ResponseBody
    public ResponseEntity<String> serviceUpdate(ServiceDTO dto) {
        serviceDao.serviceUpdate(dto);
        return ResponseEntity.ok("게시글이 수정되었습니다.");
    }
}
