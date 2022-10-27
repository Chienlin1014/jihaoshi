package com.online_course.model;

import java.util.List;

import com.authority.model.AuthorityDAO_interface;
import com.authority.model.AuthorityJDBCDAO;
import com.authority.model.AuthorityVO;

public class OnlineCourseService {
	private OnlineCourseDAO_interface dao;

	public OnlineCourseService() {
		dao = new OnlineCourseJDBCDAO();
	}

	public void save(OnlineCourseVO onlineCourseVO) {
		dao.insert(onlineCourseVO);
	}

	public void updateOnlineCourse(OnlineCourseVO onlineCourseVO) {
		dao.update(onlineCourseVO);

	}

	public void deleteOnlineCourse(OnlineCourseVO onlineCourseVO) {
		dao.delete(onlineCourseVO);
	}

	public OnlineCourseVO getOneOnlineCourse(Integer courseNo) {
		return dao.findByPrimaryKey(courseNo);
	}

	public List<OnlineCourseVO> getAll() {
		return dao.getAll();
	}
}
