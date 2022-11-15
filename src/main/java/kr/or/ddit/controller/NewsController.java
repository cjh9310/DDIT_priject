/*
 * package kr.or.ddit.controller;
 * 
 * import java.util.List; import java.util.Map;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes;
 * 
 * import kr.or.ddit.command.Criteria; import kr.or.ddit.dto.NewsVO; import
 * kr.or.ddit.service.NewsService;
 * 
 * @Controller
 * 
 * @RequestMapping("/admember") public class NewsController {
 * 
 * @Autowired private NewsService newsService;
 * 
 * @GetMapping("/mypage/news") public String news(Criteria cri,
 * HttpServletRequest request) throws Exception { String url =
 * "admember/mypage/news";
 * 
 * Map<String, Object> dataMap = null; dataMap = newsService.getNewsList(cri);
 * 
 * request.setAttribute("dataMap", dataMap);
 * 
 * return url; }
 * 
 * 
 * 
 * @PostMapping("/mypage/newsregist")
 * 
 * @ResponseBody public String registNews(NewsVO news, RedirectAttributes rttr)
 * throws Exception { String url = "redirect:/mypage/news";
 * 
 * newsService.regist(news);
 * 
 * rttr.addFlashAttribute("from","regist");
 * 
 * return url;
 * 
 * }
 * 
 * @RequestMapping(value="/mypage/newsmodify", method = RequestMethod.POST)
 * public String modifyNews(NewsVO news, HttpServletRequest request,
 * RedirectAttributes rttr) throws Exception { String url =
 * "redirect:/admember/mypage/news";
 * 
 * newsService.modify(news);
 * 
 * rttr.addAttribute("from","news");
 * 
 * return url;
 * 
 * }
 * 
 * @PostMapping("/mypage/newsRemove")
 * 
 * @ResponseBody public String removeNews(int newsNo, RedirectAttributes rttr)
 * throws Exception { String url = "redirect:/mypage/news";
 * 
 * newsService.remove(newsNo);
 * 
 * rttr.addAttribute("from","community");
 * 
 * return url; }
 * 
 * 
 * 
 * }
 */