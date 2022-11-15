package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.CareerVO;

public interface CareerDAO {
	
	List<CareerVO> selectCareerListById(String id) throws SQLException;
	
	CareerVO selectCareerByCrrNo(String crrNo) throws SQLException;
	
	void insertCareer(Map<String, Object> career) throws SQLException;
	
	void updateCareer(Map<String, Object> career) throws SQLException;
	
	void deleteCareer(String crrNo) throws SQLException;

}
