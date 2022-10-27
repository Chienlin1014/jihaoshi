package com.online_course_order_detail.model;

import java.io.Serializable;

public class OnlineCourseOrderDetailVO implements Serializable {
	private Integer orderNo;
	private Integer courseNo;
	private Integer coursePrice;

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(Integer courseNo) {
		this.courseNo = courseNo;
	}

	public Integer getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(Integer coursePrice) {
		this.coursePrice = coursePrice;
	}

}
