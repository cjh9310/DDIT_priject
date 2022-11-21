package kr.or.ddit.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.parser.Entity;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ApplicantsVO;
import kr.or.ddit.dto.AuthReqVO;
import kr.or.ddit.dto.BookmarkVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.OpenRecVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.dto.SupplyRecVO;
import kr.or.ddit.service.ApplicantsService;
import kr.or.ddit.service.AuthReqService;
import kr.or.ddit.service.BookmarkService;
import kr.or.ddit.service.CareerService;
import kr.or.ddit.service.CertificateService;
import kr.or.ddit.service.CorporationService;
import kr.or.ddit.service.EducationService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.OpenRecService;
import kr.or.ddit.service.RecruitService;
import kr.or.ddit.service.SupplyRecService;

@Controller
@RequestMapping("/comember")
public class CoMemeberController {

	@Autowired
	private BookmarkService bookmarkService;

	@Autowired
	private OpenRecService openRecService;

	@Autowired
	private RecruitService recruitService;

	@Autowired
	private SupplyRecService supplyRecService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private EducationService educationService;

	@Autowired
	private CareerService careerService;

	@Autowired
	private CertificateService certificateService;

	@Autowired
	private CorporationService corporationService;
	@Autowired
	private AuthReqService authReqService;

	@GetMapping("/mypage/support")
	public String myPageSupport() throws Exception {
		String url = "comember/mypage/support/contest";
		return url;
	}

	@GetMapping("/mypage/supportContestRegistForm")
	public String supportContestRegistForm() throws Exception {
		String url = "comember/mypage/support/contestRegist";
		return url;
	}

	@GetMapping("mypage/lockedinfo")
	public String myPageLockedInfo(HttpServletRequest request) throws Exception {
		String url = "comember/mypage/lockedinfo";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();

		Map<String, Object> bookmarkMap = bookmarkService.getBookmarkListById(id);
		request.setAttribute("bookmarkMap", bookmarkMap);

		return url;
	}

	@GetMapping("/mypage/info")
	public String myPageInfo(HttpServletRequest request) throws Exception {
		String url = "comember/mypage/info";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String recWantedno = loginUser.getId();
		Map<String, Object> bookmarkMap = bookmarkService.getBookmarkListByRecno(recWantedno);
		request.setAttribute("bookmarkMap", bookmarkMap);
		return url;
	}

	@GetMapping("mypage/manage")
	public String myPageManage(String parameter, HttpServletRequest request) throws Exception {
		String url = "comember/mypage/manage/" + parameter;
		return url;
	}

	@RequestMapping(value = "/mypage/recruit", produces = "application/text; charset=UTF-8", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String myPageRecruit(String open_conm, Criteria cri, HttpServletRequest request) throws Exception {
		String url = "comember/mypage/recruit/recruit";

		HttpSession session = request.getSession();
		MemberVO loginUser = null;
		try {
			loginUser = (MemberVO) session.getAttribute("loginUser");
		} catch (Exception e) {
			url = "redirect:/index.do";// TODO: handle exception
		}

		Map<String, Object> dataMap = null;
		Map<String, Object> dataMap2 = null;
		Map<String, Object> dataMap3 = null;

		open_conm = loginUser.getCoNm();

		dataMap = openRecService.getOpenRecListByConm(open_conm);
		dataMap2 = recruitService.getRecruitListByConm(open_conm);
		dataMap3 = corporationService.getCoInfo(open_conm);

		request.setAttribute("dataMap", dataMap);
		request.setAttribute("dataMap2", dataMap2);
		request.setAttribute("dataMap3", dataMap3);

		return url;
	}

	@GetMapping("/mypage/authority")
	public String authority(AuthReqVO authReq, MemberVO member, HttpServletRequest request) throws Exception {

		String url = "성공";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		member.setId(id);
		authReqService.regist(authReq);
		return url;
	}

	@GetMapping("/mypage/talent")
	public String myPageTalent() throws Exception {
		String url = "comember/mypage/talent";
		return url;
	}

	@RequestMapping(value = "/mypage/regist", produces = "application/text; charset=UTF-8", method = {
			RequestMethod.POST })
	@ResponseBody
	public void insertPatient(RecruitVO re) throws Exception {
		recruitService.regist(re);
	}

	@RequestMapping(value = "/mypage/opendetail", method = RequestMethod.POST)
	public @ResponseBody OpenRecVO openDetail(@RequestParam("openSeqno") String param) throws SQLException {
		OpenRecVO detail = null;

		int openSeqno = Integer.parseInt(param);
		detail = openRecService.getOpenRecListByNo(openSeqno);

		return detail;
	}

	@RequestMapping(value = "/mypage/recdetail", method = RequestMethod.POST)
	public @ResponseBody RecruitVO recDetail(@RequestParam("recNo") String param) throws SQLException {
		RecruitVO detail = null;

		detail = recruitService.getRecruit(param);

		return detail;
	}

	@RequestMapping(value = "/mypage/openApplicant", method = RequestMethod.POST)
	public @ResponseBody ApplicantsVO openApplicant(@RequestParam("openSeqno") String param) throws SQLException {
		return null;
	}

	@RequestMapping(value = "/mypage/supplyRec", method = RequestMethod.POST)
	public @ResponseBody List<SupplyRecVO> supplyRec(@RequestParam("openSeqno") int openSeqno) throws Exception {
		List<SupplyRecVO> supplyRecList = null;

		supplyRecList = supplyRecService.getSupplyRecList(openSeqno);

		return supplyRecList;
	}

	@RequestMapping("/mypage/resume")
	public String appliedPerson(String id, HttpServletRequest request) throws Exception {
		String url = "comember/mypage/recruit/resume";

		MemberVO member = memberService.getMember(id);
		Map<String, Object> eduMap = educationService.getEducationListById(id);
		Map<String, Object> crrMap = careerService.getCareerListById(id);
		Map<String, Object> cerMap = certificateService.getCertificateListById(id);
		request.setAttribute("eduMap", eduMap);
		request.setAttribute("crrMap", crrMap);
		request.setAttribute("cerMap", cerMap);
		request.setAttribute("member", member);

		return url;
	}

	// 공개채용 입력
	@RequestMapping(value = "/mypage/openRecRegist", method = RequestMethod.POST)
	@ResponseBody
	public String openRecRegist(OpenRecVO openRec, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/mypage/recruit";

		openRecService.regist(openRec);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	// 공개채용 수정
	@RequestMapping(value = "/mypage/openRecModify", method = RequestMethod.POST)
	@ResponseBody
	public String openRecModify(OpenRecVO openRec, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/mypage/recruit";

		openRecService.modify(openRec);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	// 공개채용 삭제
	@RequestMapping(value = "/mypage/openRecDelete", method = RequestMethod.POST)
	@ResponseBody
	public String openRecDelete(@RequestParam("openSeqno") int openSeqno) throws Exception {
		String url = "redirect:/mypage/recruit";

		openRecService.delete(openSeqno);

		return url;
	}

	// 일반채용 정보 입력
	@RequestMapping(value = "/mypage/recruitRegist", method = RequestMethod.POST)
	@ResponseBody
	public String recruitRegist(RecruitVO recruit) throws SQLException, Exception {
		String url = "redirect:/mypage/recruit";

		recruitService.regist(recruit);

		return url;
	}

	// 일반채용 삭제
	@RequestMapping(value = "/mypage/recruitDelete", method = RequestMethod.POST)
	@ResponseBody
	public void recruitDelete(@RequestParam("recno") String recWantedno) throws SQLException, Exception {
		List<Integer> bookno = bookmarkService.getBookNoByRecNo(recWantedno);
		if (bookno == null) {
			recruitService.remove(recWantedno);
		} else if (bookno != null) {
			for (int i = 0; i < bookno.size(); i++) {
				bookmarkService.removeBookmark(bookno.get(i));
			}
			recruitService.remove(recWantedno);
		}
	}

	// 기업정보
	// 수정-----------------------------------------------------------------------------------------------

	@RequestMapping(value = "/mypage/comembermodify", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String comembermodify(MemberVO member, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/mypage/info";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		member.setId(id);
		memberService.modify(member);

		rttr.addFlashAttribute("from", "modify");

		return url;
	}

	@GetMapping("/mypage/licence")
	public ResponseEntity<Resource> getIdenPicture(@Param("folder") String folder, @Param("filename") String filename) {

		String path = "D:\\team1\\src\\uploadImage\\BusinessLicense\\";

		folder = folder + "\\";

		Resource resource = new FileSystemResource(path + folder + filename);

		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}

		HttpHeaders header = new HttpHeaders();
		Path filePath = null;

		try {
			filePath = Paths.get(path + folder + filename);
			header.add("Content-Type", Files.probeContentType(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}

}