package com.online_course.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class OnlineCourseVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer courseNo;
	private String courseName;
	private String courseHr;
	private String courseTeacher;
	private String courseInfo;
	private Integer coursePrice;
	private Integer courseStatus;
	private Timestamp updateDate;
	private Integer commentPeople;
	private Integer commentScore;
	
	 public OnlineCourseVO() {
	    }

     public OnlineCourseVO(String courseName, String courseHr, String courseTeacher, String courseInfo, Integer coursePrice ,Integer courseStatus) {
     this.courseName = courseName;
     this.courseHr = courseHr;
     this.courseTeacher = courseTeacher;
     this.courseInfo = courseInfo;
     this.coursePrice = coursePrice;
     this.courseStatus = courseStatus;
   
    
 }
	public Integer getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(Integer courseNo) {
		this.courseNo = courseNo;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseHr() {
		return courseHr;
	}
	public void setCourseHr(String courseHr) {
		this.courseHr = courseHr;
	}
	public String getCourseTeacher() {
		return courseTeacher;
	}
	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}
	public String getCourseInfo() {
		return courseInfo;
	}
	public void setCourseInfo(String courseInfo) {
		this.courseInfo = courseInfo;
	}
	public Integer getCoursePrice() {
		return coursePrice;
	}
	public void setCoursePrice(Integer coursePrice) {
		this.coursePrice = coursePrice;
	}
	public Integer getCourseStatus() {
		return courseStatus;
	}
	public void setCourseStatus(Integer courseStatus) {
		this.courseStatus = courseStatus;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getCommentPeople() {
		return commentPeople;
	}
	public void setCommentPeople(Integer commentPeople) {
		this.commentPeople = commentPeople;
	}
	public Integer getCommentScore() {
		return commentScore;
	}
	public void setCommentScore(Integer commentScore) {
		this.commentScore = commentScore;
	}
	
	
	


	
}
