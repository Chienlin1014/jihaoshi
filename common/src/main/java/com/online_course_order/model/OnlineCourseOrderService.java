package com.online_course_order.model;

import java.util.Base64;
import java.util.List;

import com.authority.model.AuthorityDAO_interface;
import com.authority.model.AuthorityJDBCDAO;
import com.authority.model.AuthorityVO;
import com.online_course_order_detail.model.OnlineCourseOrderDetailVO;

public class OnlineCourseOrderService {
	private OnlineCourseOrderDAO_interface dao;

	public OnlineCourseOrderService() {
		dao = new OnlineCourseOrderJDBCDAO();
	}

	public void updateOnlineCourseOrder(OnlineCourseOrderVO onlineCourseOrderVO) {
		dao.update(onlineCourseOrderVO);

	}

	public List<OnlineCourseOrderVO> getOneOnlineCourseOrderMem(Integer memberNo) {		
		return dao.findByMemNo(memberNo);
	}

	public List<OnlineCourseOrderVO> getAll() {
		return dao.getAll();
	}
	
	public OnlineCourseOrderVO getOrderDetail(Integer orderNo) {
		OnlineCourseOrderVO vo = dao.getOrderDetail(orderNo);
		if (vo != null && vo.getOrderDetailList() != null) {
			for (OnlineCourseOrderDetailVO detail : vo.getOrderDetailList()) {
				if (detail.getOrderPhoto() != null) {
					detail.setOrderPhotoBaseStr64(Base64.getEncoder().encodeToString(detail.getOrderPhoto()));
				}
			}
		}
		return vo;
	}

}
