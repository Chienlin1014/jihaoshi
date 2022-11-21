package com.online_course_order.model;

import java.util.List;

public interface OnlineCourseOrderDAO_interface {

	public void update(OnlineCourseOrderVO onlineCourseOrderVO);

	public List<OnlineCourseOrderVO> findByMemNo(Integer memberNo);

	public OnlineCourseOrderVO getOrderDetail(Integer orderNo);

	public List<OnlineCourseOrderVO> getAll();

}
