package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.BookmarkVO;
import kr.or.ddit.service.BookmarkService;

@Controller
@RequestMapping("/bookmark")
//@Slf4j
public class BookmarkController {

	@Autowired
	private BookmarkService bookmarkService;
	
	@PostMapping("regist")
	@ResponseBody
	public String recBookmarkRegist(BookmarkVO bookmark) throws Exception {
		bookmarkService.registRecBookmark(bookmark);
		System.out.println(bookmark.getTalId());
		return "BookmarkRegistSuccess";
	}
	
	@PostMapping("remove")
	@ResponseBody
	public String recBookmarkRemove(BookmarkVO bookmark) throws Exception {
		int bookNo = bookmarkService.getBookNoForRemove(bookmark);
		System.out.println(bookmark.getBookNo());
		bookmarkService.removeBookmark(bookNo);
		return "BookmarkRemoveSuccess";
	}

}
