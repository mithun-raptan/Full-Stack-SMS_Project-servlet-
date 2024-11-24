package com.dao;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.dto.Admin;
import com.dto.Student;

public class StudentDao {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");

	public void saveStudent(Student student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		try {
			et.begin();
			em.persist(student);
			et.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Student findStudentById(int sid) {

		EntityManager em = emf.createEntityManager();
		Student student = em.find(Student.class, sid);

		return student;
	}

	public void updateStudent(Student student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(student);
		et.commit();

	}

	public void deleteStudentById(Student student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		// Get the associated Admin
		Admin admin = student.getAdmin();
		if (admin != null) {
			List<Student> listOfStudents = admin.getStudents();

			// i am using iterator in order to remove the particular student from the
			// listofstudents
			Iterator<Student> iterator = listOfStudents.iterator();

			// Loop through the list using the iterator
			while (iterator.hasNext()) {
				// Get the next student from the list
				Student s = iterator.next();

				// Check if this is the student you want to remove
				if (s.getId() == student.getId()) {
					// Remove the student using the iterator's remove method
					iterator.remove();
				}
			}

			// Breaking the relationship
			student.setAdmin(null);

			et.begin();
			// Updating the Admin entity after modifying the list
			em.merge(admin);

			// Remove the student after merging admin
			em.remove(em.merge(student)); // first Merge then remove
			et.commit();
		}
	}
	
	//////

	public void addSubject(Student student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(student);
		et.commit();
		
	}
}
