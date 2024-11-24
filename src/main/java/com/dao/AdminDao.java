//package com.dao;
//
//import java.util.List;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.EntityTransaction;
//import javax.persistence.Persistence;
//import javax.persistence.Query;
//
//import com.dto.Admin;
//
//public class AdminDao {
//	
//	private EntityManagerFactory emf=Persistence.createEntityManagerFactory("dev");
//	private EntityManager em=emf.createEntityManager();
//	private EntityTransaction et=em.getTransaction();
//	
//	
//	
//	public void saveAdminObject(Admin admin) {
//		et.begin();
//		em.persist(admin);
//		et.commit();
//		
//	}
//
//
//
//	public Admin findAdminBYEmail(String email) {
//		
//		Query q=em.createQuery("select a from Admin a where a.email =?1");
//		q.setParameter(1, email);
//		List<Admin> list=q.getResultList();
//		
//		if(!list.isEmpty()) {
//			return list.get(0);
//		}
//		return null;
//		
//		
//	}
//
//
//
//	public void mergeAdminObject(Admin admin1) {
//		et.begin();
//		em.merge(admin1);
//		et.commit();
//		
//	}
//	
//
//	
//	
//	
//	
//
//}

package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.dto.Admin;

public class AdminDao {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");

    public void saveAdminObject(Admin admin) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(admin);
            et.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }

    public Admin findAdminBYEmail(String email) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");
        EntityManager em = emf.createEntityManager();
        Admin admin = null;
        try {
            em.getTransaction().begin();
            admin = (Admin) em.createQuery("SELECT a FROM Admin a WHERE a.email = :email")
                              .setParameter("email", email)
                              .getSingleResult();
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return admin;
    }


    public void mergeAdminObject(Admin admin1) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(admin1);
            et.commit();
        } catch (Exception e) {
           e.printStackTrace();
        } 
    }
}

