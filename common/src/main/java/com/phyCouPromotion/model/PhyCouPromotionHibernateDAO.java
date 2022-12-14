package com.phyCouPromotion.model;

import org.hibernate.*;
import org.hibernate.query.Query;

import com.course.model.PhyCouVO;
import com.phyCouPromotionDetail.model.PhyCouPromotionDetailVO;
import hibernate.util.HibernateUtil;
import java.util.*;

public class PhyCouPromotionHibernateDAO implements PhyCouPromotionDAO_interface {

	private static final String GET_ALL_STMT = "from PhyCouPromotionVO order by project_no";

	@Override
	public Integer insert(PhyCouPromotionVO phyCouPromotionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(phyCouPromotionVO);
		    session.getTransaction().commit();
		    Integer project_no = phyCouPromotionVO.getProject_no();
		    return project_no;
		   
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(PhyCouPromotionVO phyCouPromotionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
//			session.saveOrUpdate(phyCouPromotionVO);
//			PhyCouPromotionVO fVO = null;
			PhyCouPromotionVO DBVO = session.get(PhyCouPromotionVO.class, phyCouPromotionVO.getProject_no());
			if (phyCouPromotionVO.getProject_name() !=  DBVO.getProject_name()) {
				DBVO.setProject_name(phyCouPromotionVO.getProject_name());
			}
			if (phyCouPromotionVO.getStart_date() !=  DBVO.getStart_date()) {
				DBVO.setStart_date(phyCouPromotionVO.getStart_date());
			}
			if (phyCouPromotionVO.getEnd_date() !=  DBVO.getEnd_date()) {
				DBVO.setEnd_date(phyCouPromotionVO.getEnd_date());
			}
			if (phyCouPromotionVO.getProm_description() !=  DBVO.getProm_description()) {
				DBVO.setProm_description(phyCouPromotionVO.getProm_description());
			}
			if (phyCouPromotionVO.getProm_status() !=  DBVO.getProm_status()) {
				DBVO.setProm_status(phyCouPromotionVO.getProm_status());
			}
					
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer project_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			PhyCouPromotionVO phyCouPromotionVO = new PhyCouPromotionVO();
			phyCouPromotionVO.setProject_no(project_no);
			session.delete(phyCouPromotionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public PhyCouPromotionVO findByPrimaryKey(Integer project_no) {
		PhyCouPromotionVO phyCouPromotionVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			phyCouPromotionVO = (PhyCouPromotionVO) session.get(PhyCouPromotionVO.class, project_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return phyCouPromotionVO;
	}

	@Override
	public List<PhyCouPromotionVO> getAll() {
		List<PhyCouPromotionVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query<PhyCouPromotionVO> query = session.createQuery(GET_ALL_STMT, PhyCouPromotionVO.class);
			list = query.getResultList();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public Set<PhyCouPromotionDetailVO> getCousByProject_no(Integer project_no) {		
		Set<PhyCouPromotionDetailVO> set = findByPrimaryKey(project_no).getPhyCouPromotionDetails();
		return set;
	}
//}
//	@Override
//	public List<PhyCouPromotionVO> getAll(Map<String, String[]> map) {
//		List<PhyCouPromotionVO> list = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			list = HibernateUtil_CompositeQuery_Emp2.getAllC(map);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		return list;
//	}

	public static void main(String[] args) {

		PhyCouPromotionHibernateDAO dao = new PhyCouPromotionHibernateDAO();

		//??? ??????-1(??????dept2.hbm.xml?????????cascade="save-update" ???cascade="all"?????????)(????????????,???????????????????????????)(???,???????????????????????????????????????????????????)
//		DeptVO deptVO = new DeptVO(); // ??????POJO
//		Set<EmpVO> set = new LinkedHashSet<EmpVO>();// ????????????????????????,??????cascade="save-update"?????????

		
		PhyCouPromotionVO phyCouPromotionVO = new PhyCouPromotionVO();
		Set<PhyCouPromotionDetailVO> set = new HashSet<PhyCouPromotionDetailVO>();
		PhyCouVO phyCouVO1 = new PhyCouVO();
		PhyCouVO phyCouVO2 = new PhyCouVO();
		
		PhyCouPromotionDetailVO phyCouPromotionDetailVO1 = new PhyCouPromotionDetailVO();
		phyCouPromotionDetailVO1.setPhyCouPromotionVO(phyCouPromotionVO);
		phyCouVO1.setCourse_no(1);
		phyCouPromotionDetailVO1.setPhyCouVO(phyCouVO1);
		phyCouPromotionDetailVO1.setProm_price(50);
		
		PhyCouPromotionDetailVO phyCouPromotionDetailVO2=  new PhyCouPromotionDetailVO();
		phyCouPromotionDetailVO2.setPhyCouPromotionVO(phyCouPromotionVO);
		phyCouVO2.setCourse_no(2);
		phyCouPromotionDetailVO2.setPhyCouVO(phyCouVO2);
		phyCouPromotionDetailVO2.setProm_price(40);
		
		set.add(phyCouPromotionDetailVO1);
		set.add(phyCouPromotionDetailVO2);
		
		phyCouPromotionVO.setProject_name("test");
		phyCouPromotionVO.setStart_date(java.sql.Date.valueOf("2001-01-16"));
		phyCouPromotionVO.setEnd_date(java.sql.Date.valueOf("2001-02-10"));
		phyCouPromotionVO.setProm_description ("test");
		phyCouPromotionVO.setProm_status(0);
	//	phyCouPromotionVO.setUpdate_time(java.sql.Date.valueOf("2022-01-16"));
		phyCouPromotionVO.setPhyCouPromotionDetails(set);
		
		dao.insert(phyCouPromotionVO);
		
		
		
		
	}
	}
		
//		EmpVO empXX = new EmpVO();   // ??????POJO1
//		empXX.setEname("???15");
//		empXX.setJob("MANAGER15");
//		empXX.setHiredate(java.sql.Date.valueOf("2001-01-15"));
//		empXX.setSal(new Double(15000));
//		empXX.setComm(new Double(150));
//		empXX.setDeptVO(deptVO);
//
//		EmpVO empYY = new EmpVO();   // ??????POJO2
//		empYY.setEname("???16");
//		empYY.setJob("MANAGER16");
//		empYY.setHiredate(java.sql.Date.valueOf("2001-01-16"));
//		empYY.setSal(new Double(16000));
//		empYY.setComm(new Double(160));
//		empYY.setDeptVO(deptVO);
//
//		set.add(empXX);
//		set.add(empYY);
//
//		deptVO.setDname("?????????");
//		deptVO.setLoc("????????????");
//		deptVO.setEmps(set);
//		dao.insert(deptVO);



		//??? ??????-1(??????dept2.hbm.xml?????????cascade="save-update" ??? cascade="all"?????????)(????????????,???????????????????????????)(???,?????????????????????)
//		DeptVO deptVO = new DeptVO(); // ??????POJO
//		Set<EmpVO> set = new LinkedHashSet<EmpVO>(); // ????????????????????????,??????cascade="save-update"?????????
//
//		EmpVO empXX = new EmpVO(); // ??????POJO1
//		empXX.setEmpno(7015); // ??????????????? empXX.setEmpno(7015); ?????????update???
//		empXX.setEname("??????15");
//		empXX.setJob("MANAGER15");
//		empXX.setHiredate(java.sql.Date.valueOf("2001-01-15"));
//		empXX.setSal(new Double(15555));
//		empXX.setComm(new Double(155));
//		empXX.setDeptVO(deptVO);
//
//		EmpVO empYY = new EmpVO(); // ??????POJO2
//		empYY.setEmpno(7016); // ??????????????? empXX.setEmpno(7016); ?????????update???
//		empYY.setEname("??????16");
//		empYY.setJob("MANAGER16");
//		empYY.setHiredate(java.sql.Date.valueOf("2001-01-16"));
//		empYY.setSal(new Double(16666));
//		empYY.setComm(new Double(166));
//		empYY.setDeptVO(deptVO);
//
//		set.add(empXX);
//		set.add(empYY);
//
//		deptVO.setDeptno(50); // ???????????????deptVO.setDeptno(50); ?????????update???
//		deptVO.setDname("?????????1");
//		deptVO.setLoc("????????????1");
//		deptVO.setEmps(set);
//		dao.update(deptVO);



		//??? ??????-2(????????????cascade="save-update" ??? cascade="all")(????????????????????????????????????)
//		DeptVO deptVO2 = new DeptVO(); // ??????POJO
//		deptVO2.setDeptno(50); // ???????????????deptVO.setDeptno(50); ?????????update???
//		deptVO2.setDname("?????????2");
//		deptVO2.setLoc("????????????2");
//		dao.update(deptVO2);



		//????????? (????????????!????????????!)(??????dept2.hbm.xml?????????cascade="delete" ??? cascade="all"?????????, ?????????inverse="true"??????)
//		dao.delete(50);



		//??? ??????-2(?????????cascade="save-update" ??? cascade="all"?????????)(????????????????????????????????????)
//		DeptVO deptVO = new DeptVO(); // ??????POJO
//		deptVO.setDname("?????????s");
//		deptVO.setLoc("????????????s");
//		dao.insert(deptVO);



		//??? ??????-findByPrimaryKey (??????!) (??????dept2.hbm.xml????????????lazy="false")
//		DeptVO deptVO3 = dao.findByPrimaryKey(30);
//		System.out.print(deptVO3.getDeptno() + ",");
//		System.out.print(deptVO3.getDname() + ",");
//		System.out.print(deptVO3.getLoc());
//		System.out.println("\n-----------------");
//		Set<EmpVO> set3 = deptVO3.getEmps();
//		for (EmpVO aEmp : set3) {
//			System.out.print(aEmp.getEmpno() + ",");
//			System.out.print(aEmp.getEname() + ",");
//			System.out.print(aEmp.getJob() + ",");
//			System.out.print(aEmp.getHiredate() + ",");
//			System.out.print(aEmp.getSal() + ",");
//			System.out.print(aEmp.getComm() + ",");
//			System.out.print(aEmp.getDeptVO().getDeptno() + ",");
//			System.out.print(aEmp.getDeptVO().getDname() + ",");
//			System.out.print(aEmp.getDeptVO().getLoc());
//			System.out.println();
//		}



//		??? ??????-getAll-1 (??????dept2.hbm.xml????????????lazy="false",??????????????????????????????)
//		List<PhyCouPromotionVO> list1 = dao.getAll();
//		for (PhyCouPromotionVO aPro : list1) {
//			System.out.print(aPro.getProject_no() + ",");
//			System.out.print(aPro.getProject_name() + ",");
//			System.out.print(aPro.getStart_date() + ",");
//			System.out.print(aPro.getEnd_date() + ",");
//			System.out.print(aPro.getProm_description() + ",");
//			System.out.print(aPro.getProm_status() + ",");
//			System.out.print(aPro.getUpdate_time());
//			System.out.println();
//		}



		//??? ??????-getAll-2 (??????!!!) (??????dept2.hbm.xml????????????lazy="false")
//		List<PhyCouPromotionVO> list2 = dao.getAll();
//		for (DeptVO aDept : list2) {
//			System.out.print(aDept.getDeptno() + ",");
//			System.out.print(aDept.getDname() + ",");
//			System.out.print(aDept.getLoc());
//			System.out.println("\n-----------------");
//			Set<EmpVO> set2 = aDept.getEmps();
//			for (EmpVO aEmp : set2) {
//				System.out.print(aEmp.getEmpno() + ",");
//				System.out.print(aEmp.getEname() + ",");
//				System.out.print(aEmp.getJob() + ",");
//				System.out.print(aEmp.getHiredate() + ",");
//				System.out.print(aEmp.getSal() + ",");
//				System.out.print(aEmp.getComm() + ",");
//				System.out.print(aEmp.getDeptVO().getDeptno() + ",");
//				System.out.print(aEmp.getDeptVO().getDname() + ",");
//				System.out.print(aEmp.getDeptVO().getLoc());
//				System.out.println();
//			}
//			System.out.println();
//		}

//}