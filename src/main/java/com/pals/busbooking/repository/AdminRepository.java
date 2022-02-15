package com.pals.busbooking.repository;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.pals.busbooking.entity.*;
import com.pals.busbooking.model.AdminLoginModel;
import com.pals.busbooking.model.BusDetailsModel;

@Repository
public class AdminRepository implements IAdminRepository{
	
	@Autowired
	private SessionFactory sessionFactory;
	private Session session;
	private BusDetailsEntity busEntityObj;
	private AdminLoginEntity adminEntityObj;
	private AdminLoginModel adminModelObj;
	
	@Override
	@Transactional
	public List<AdminLoginModel> adminLoginCheck(AdminLoginModel loginModelObj)
	{
		session=sessionFactory.getCurrentSession();
		Query query=session.createNativeQuery("select * from admin where id = ? and password = ?");
		query.setParameter(1, loginModelObj.getAdminId());
		query.setParameter(2, loginModelObj.getAdminPassword());
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public AdminLoginModel getAdminProfile(String adminId)
	{
		session=sessionFactory.getCurrentSession();
		adminEntityObj=session.get(AdminLoginEntity.class, adminId);
		adminModelObj=new AdminLoginModel();
		BeanUtils.copyProperties(adminEntityObj, adminModelObj);
		return adminModelObj;
	}
	
	@Override
	@Transactional
	public void updateProfile(AdminLoginModel loginModelObj)
	{
		session=sessionFactory.getCurrentSession();
		BeanUtils.copyProperties(loginModelObj, adminEntityObj,getNullPropertyNames(loginModelObj));
		session.update(adminEntityObj);
	}

	@Override
	@Transactional
	public void updateProfileImage(MultipartFile photo,String adminId) throws IOException
	{
		session=sessionFactory.getCurrentSession();
		byte[] photoBytes = photo.getBytes();
		Query query=session.createNativeQuery("update admin set photo = ? where id = ?");
		query.setParameter(1, photoBytes);
		query.setParameter(2, adminId);
		query.executeUpdate();
	}
	
	
	@Override
	@Transactional
	public boolean updatePassword(String adminId,String updatedPassword)
	{
		session=sessionFactory.getCurrentSession();
		adminEntityObj=session.get(AdminLoginEntity.class, adminId);
		adminEntityObj.setAdminPassword(updatedPassword);
		session.update(adminEntityObj);
		if(session.get(AdminLoginEntity.class, adminId).getAdminPassword().equals(updatedPassword))
			return true;
		return false;
	}
	
	@Override
	@Transactional
	public boolean busIdCheck(String busId)
	{
		session=sessionFactory.getCurrentSession();
		busEntityObj=session.get(BusDetailsEntity.class, busId);
		if(busEntityObj!=null)
			return true;
		return false;
	}
	
	@Override
	@Transactional
	public boolean checkBusDetails(BusDetailsEntity busEnityObj)
	{
		session=sessionFactory.getCurrentSession();
		Query query=session.createNativeQuery("select * from busdetails where busname = ? and boardingtime = ? and arrivaltime = ? and source = ? and destination = ? and id != ?");
		query.setParameter(1, busEnityObj.getBusName());
		query.setParameter(2, busEnityObj.getBoardingTime());
		query.setParameter(3, busEnityObj.getArrivalTime());
		query.setParameter(4, busEnityObj.getSource());
		query.setParameter(5, busEnityObj.getDestination());
		query.setParameter(6, busEnityObj.getBusId());
		if(query.getResultList().size()==0)
			return true;
		return false;
	}
	
	@Override
	@Transactional
	public String insertBus(BusDetailsModel busModelObj)
	{
		session=sessionFactory.getCurrentSession();
		busEntityObj=new BusDetailsEntity();
		BeanUtils.copyProperties(busModelObj, busEntityObj);
		if(checkBusDetails(busEntityObj))
			return (String)session.save(busEntityObj);
		return "";
	}
	
	@Override
	@Transactional
	public boolean updateBusDetails(BusDetailsModel updateBusDetais)
	{
		session=sessionFactory.getCurrentSession();
		BeanUtils.copyProperties(updateBusDetais, busEntityObj,getNullPropertyNames(updateBusDetais));
		if(checkBusDetails(busEntityObj)) {
			session.update(busEntityObj);
			return true;
		}
		return false;
	}
	
	@Override
	@Transactional
	public List<BusDetailsEntity> busDetails()
	{
		session=sessionFactory.getCurrentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<BusDetailsEntity> query = builder.createQuery(BusDetailsEntity.class);
        Root<BusDetailsEntity> root = query.from(BusDetailsEntity.class);
        query.select(root);
        return session.createQuery(query).getResultList();
	}
	
	@Override
	@Transactional
	public List<UserEntity> userDetails()
	{
		session=sessionFactory.getCurrentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<UserEntity> query = builder.createQuery(UserEntity.class);
        Root<UserEntity> root = query.from(UserEntity.class);
        query.select(root);
        return session.createQuery(query).getResultList();
	}
	
	@Override
	@Transactional
	public BusDetailsModel getBusbyId(String busId)
	{
		session=sessionFactory.getCurrentSession();
		busEntityObj=session.get(BusDetailsEntity.class, busId);
		BusDetailsModel busdetail=new BusDetailsModel();
		BeanUtils.copyProperties(busEntityObj,busdetail);
		return busdetail;
	}
	
	public static String[] getNullPropertyNames(AdminLoginModel source) {
	    final BeanWrapper src = new BeanWrapperImpl(source);
	    PropertyDescriptor[] pds = src.getPropertyDescriptors();

	    Set<String> emptyNames = new HashSet<String>();
	    for (PropertyDescriptor pd : pds) {
	        Object srcValue = src.getPropertyValue(pd.getName());
	        if (srcValue == null||srcValue.equals("")&&pd.getName()!="adminPassword")
	            emptyNames.add(pd.getName());
	    }
	    String[] result = new String[emptyNames.size()];
	    return emptyNames.toArray(result);
	}
	
	public static String[] getNullPropertyNames(BusDetailsModel source) {
	    final BeanWrapper src = new BeanWrapperImpl(source);
	    PropertyDescriptor[] pds = src.getPropertyDescriptors();

	    Set<String> emptyNames = new HashSet<String>();
	    for (PropertyDescriptor pd : pds) {
	        Object srcValue = src.getPropertyValue(pd.getName());
	        if (srcValue == null) {
	            emptyNames.add(pd.getName());}
	    }
	    String[] result = new String[emptyNames.size()];
	    return emptyNames.toArray(result);
	}
}
