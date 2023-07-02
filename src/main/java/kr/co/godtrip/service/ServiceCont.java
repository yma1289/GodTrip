package kr.co.godtrip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import kr.co.godtrip.member.MemberDAO;
import kr.co.godtrip.member.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/service")
public class ServiceCont {

	private final ServiceDAO serviceDao;
    private final MemberDAO memberDAO;

    @Autowired
    public ServiceCont(ServiceDAO serviceDao, MemberDAO memberDAO) {
        this.serviceDao = serviceDao;
        this.memberDAO = memberDAO;
    }

    @RequestMapping("/serviceList")
    public ModelAndView serviceList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("service/serviceList");

        String categoryParam = request.getParameter("category");
        int category = 0;
        if (categoryParam != null && !categoryParam.isEmpty()) {
            category = Integer.parseInt(categoryParam);
        }

        String keyword = request.getParameter("keyword");

        int pageNum = 1;
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        int rowsPerPage = 10;
        int startRow = (pageNum - 1) * rowsPerPage;
        int endRow = pageNum * rowsPerPage;

        Map<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("keyword", keyword);
        map.put("startRow", startRow);
        map.put("endRow", endRow);

        int totalCount = serviceDao.getTotalCount(map);
        int totalPage = (totalCount - 1) / rowsPerPage + 1;

        List<Map<String, Object>> list = serviceDao.list(map);

        mav.addObject("list", list);
        mav.addObject("totalPage", totalPage);
        mav.addObject("pageNum", pageNum);
        mav.addObject("keyword", keyword);
        mav.addObject("category", category);

        return mav;
    }

    @RequestMapping("/serviceDetail/{cno}")
    public ModelAndView serviceDetail(@PathVariable int cno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("service/serviceDetail");

        ServiceDTO service = serviceDao.serviceDetail(cno);
        mav.addObject("service", service);

        return mav;
    }

    @PostMapping("/serviceDelete/{cno}")
    public ResponseEntity<String> serviceDelete(@PathVariable int cno) {
        serviceDao.serviceDelete(cno);
        return ResponseEntity.ok("게시글이 삭제되었습니다.");
    }

    @GetMapping("/serviceForm")
    public ModelAndView serviceForm(HttpSession session) {
        ModelAndView mav = new ModelAndView("service/serviceForm");
        String id = (String) session.getAttribute("s_id");
        mav.addObject("id", id);
        return mav;
    }

    @PostMapping("/serviceInsert")
    public String serviceInsert(@ModelAttribute("service") ServiceDTO service, HttpSession session) {
        String id = (String) session.getAttribute("s_id");
        service.setId(id);

        // 작성자 정보 업데이트
        MemberDTO member = memberDAO.select(id);
        service.setId(member.getMname());
        serviceDao.serviceInsert(service);

        return "redirect:/service/serviceList";
    }

    @RequestMapping("/serviceUpdate/{cno}")
    public ModelAndView serviceUpdateForm(@PathVariable int cno) {
        ModelAndView mav = new ModelAndView("service/serviceUpdate");
        ServiceDTO service = serviceDao.serviceDetail(cno);
        mav.addObject("service", service);
        return mav;
    }

    @PostMapping("/serviceUpdate")
    public String serviceUpdate(ServiceDTO service) {
        serviceDao.serviceUpdate(service);
        return "redirect:/service/serviceDetail/" + service.getCno();
    }
}
