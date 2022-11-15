package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.MemberDAO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.OpenRecVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public Map<String, Object> getMemberList(Criteria cri) throws SQLException {

		Map<String, Object> dataMap = null;

		// 처리.......
		List<MemberVO> memberList = memberDAO.selectMemberList(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(cri));

		dataMap = new HashMap<String, Object>();
		dataMap.put("memberList", memberList);
		dataMap.put("pageMaker", pageMaker);
		System.out.println("data"+ dataMap.size());
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getTalentListByScroll(int startNum, int endNum) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<MemberVO> talentList = memberDAO.selectTalentListByScroll(startNum, endNum);
		dataMap.put("talentList", talentList);
		return dataMap;
	}

	@Override
	public MemberVO getMember(String id) throws SQLException {
		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}

	@Override
	public void regist(MemberVO member) throws Exception {
		memberDAO.insertMember(member);

	}

	@Override
	public void modify(MemberVO member) throws Exception {
		memberDAO.updateMember(member);
	}

	@Override
	public void remove(String id) throws Exception {
		memberDAO.deleteMember(id);
	}

	@Override
	public void login(String id, String pwd) throws NotFoundIdException, InvalidPasswordException, SQLException {

		MemberVO member = memberDAO.selectMemberById(id);
		if (member == null)
			throw new NotFoundIdException();
		if (!pwd.equals(member.getPwd()))
			throw new InvalidPasswordException();
	}

}






