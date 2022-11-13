package com.manager.model;

import java.util.List;

public interface ManagerDAO_interface {
	public void insert(ManagerVO ManagerVO);

	public void update(ManagerVO ManagerVO);

	public void delete(Integer managerNo);

	public ManagerVO findByPrimaryKey(Integer managerNo);

	public List<ManagerVO> getAll();

	public ManagerVO selectForLogin(String managerAccount, String managerPassword);


}
