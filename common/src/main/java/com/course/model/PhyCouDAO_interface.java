package com.course.model;

import java.util.*;


public interface PhyCouDAO_interface {
	
    public void insert(PhyCouVO phyCouVO);
    public void update(PhyCouVO phyCouVO);
    public void delete(Integer course_no);
    public PhyCouVO findByPrimaryKey(Integer course_no);
    public List<PhyCouVO> getAll();
<<<<<<< HEAD
    public List<PhyCouVO> getCanSignUp();
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
=======
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
//  public List<EmpVO> getAll(Map<String, String[]> map); 
	public List<PhyCouVO> getAll(Map<String, String[]> map);

}
