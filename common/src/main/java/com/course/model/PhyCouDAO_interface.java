package com.course.model;

import java.util.*;


public interface PhyCouDAO_interface {
	
    public void insert(PhyCouVO phyCouVO);
    public void update(PhyCouVO phyCouVO);
    public void delete(Integer course_no);
    public PhyCouVO findByPrimaryKey(Integer course_no);
    public List<PhyCouVO> getAll();
    public List<PhyCouVO> getCanSignUp();
    //ï¿½Uï¿½Î½Æ¦Xï¿½dï¿½ï¿½(ï¿½Ç¤Jï¿½Ñ¼Æ«ï¿½ï¿½AMap)(ï¿½^ï¿½ï¿½ List)
    //¸U¥Î½Æ¦X¬d¸ß(¶Ç¤J°Ñ¼Æ«¬ºAMap)(¦^¶Ç List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 
	public List<PhyCouVO> getAll(Map<String, String[]> map);

}
