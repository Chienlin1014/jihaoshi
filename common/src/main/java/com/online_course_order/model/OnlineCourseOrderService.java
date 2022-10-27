package com.online_course_order.model;

import java.util.List;

import com.authority.model.AuthorityDAO_interface;
import com.authority.model.AuthorityJDBCDAO;
import com.authority.model.AuthorityVO;

public class OnlineCourseOrderService {
	private OnlineCourseOrderDAO_interface dao;

	public OnlineCourseOrderService() {
		dao = new OnlineCourseOrderJDBCDAO();
	}

	public void save(OnlineCourseOrderVO onlineCourseOrderVO) {
		dao.insert(onlineCourseOrderVO);
	}

	public void updateAuthorityDetail(OnlineCourseOrderVO onlineCourseOrderVO) {
		dao.update(onlineCourseOrderVO);

	}

	public void deleteAuthorityDetail(OnlineCourseOrderVO onlineCourseOrderVO) {
		dao.delete(onlineCourseOrderVO);
	}

	public OnlineCourseOrderVO getOneAuthorityDetail(Integer orderNo) {
		return dao.findByPrimaryKey(orderNo);
	}

	public List<OnlineCourseOrderVO> getAll() {
		return dao.getAll();
	}

}
