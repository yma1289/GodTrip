package kr.co.godtrip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import kr.co.godtrip.member.MemberCont;
import kr.co.godtrip.member.MemberDAO;
import kr.co.godtrip.member.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/service")
public class ServiceCont {

    private final ServiceDAO serviceDao;
    private final MemberCont memberCont;
    private final MemberDAO memberDAO;

    @Autowired
    public ServiceCont(ServiceDAO serviceDao, MemberCont memberCont, MemberDAO memberDAO) {
        this.serviceDao = serviceDao;
        this.memberCont = memberCont;
        this.memberDAO = memberDAO;
    }

    @RequestMapping("/serviceList")
    public ModelAndView list(HttpServletRequest req) {
        String title = req.getParameter("title");
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<>();
        map.put("title", title);

        int getTotalCount = serviceDao.getTotalCount(map);
        int numPerPage = 5;    // 한 페이지당 레코드 갯수
        int pagePerBlock = 5;  // 페이지 리스트

        String pageNum = req.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage;
        int endRow = numPerPage;

        double totcnt = (double) getTotalCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);

        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int) Math.ceil(d_page) - 1;
        int startPage = Pages * pagePerBlock;
        int endPage = startPage + pagePerBlock + 1;

        map.put("startRow", startRow);
        map.put("endRow", endRow);

        List<Map<String, Object>> list;
        if (getTotalCount > 0) {
            list = serviceDao.list(map);
        } else {
            list = Collections.emptyList();
        }

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", getTotalCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list", list);

        mav.setViewName("service/serviceList");
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

    @RequestMapping("/serviceForm")
    public ModelAndView serviceForm(HttpSession session) {
        ModelAndView mav = new ModelAndView("service/serviceForm");
        String id = (String) session.getAttribute("s_id");
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping(value = "/serviceInsert", method = RequestMethod.POST)
    public String serviceInsert(@ModelAttribute("service") ServiceDTO service, HttpSession session) {
        String id = (String) session.getAttribute("s_id");
        service.setId(id);

        // 작성자 정보 업데이트
        MemberDTO member = memberDAO.select(id);
        service.setId(member.getMname());
        service.setId("webmaster");
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
