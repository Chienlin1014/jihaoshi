package com.mem.model;

import java.util.List;

import com.phyCourseComment.model.phyCourseCommentVO;
import com.phyCourseCommentReport.model.phyCourseCommentReportVO;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);

	public void update(MemberVO memberVO);

	public void delete(Integer memberNo);

	public MemberVO findByPrimaryKey(Integer memberNo);

	public List<MemberVO> getAll();

	public MemberVO selectForLogin(String mamberAccount, String mamberPassword);

	public MemberVO findByAccount(String memberAccount);
	
	public MemberVO findByEmail(String memberEmail);

	public List<phyCourseCommentVO> getPhyCourseCommentsByMemberNo(Integer memberNo);

	public List<phyCourseCommentReportVO> getPhyCourseCommentReportsByMemberNo(Integer memberNo);

}
