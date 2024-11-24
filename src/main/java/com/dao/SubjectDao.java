package com.dao;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.dto.Student;
import com.dto.Subject;

public class SubjectDao {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");

	public Subject findSubjectByID(int subid) {
		EntityManager em = emf.createEntityManager();
		
		Subject subject = em.find(Subject.class, subid);
		
		return subject;
	}

	public void deleteSubject(Subject subject) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		Student student = subject.getStudent();
		List<Subject> listofsubjects = student.getSubjects();
		
		// i am using iterator in order to remove the particular subject from the student
		Iterator<Subject> iterator = listofsubjects.iterator();

		// Loop through the list using the iterator
		while (iterator.hasNext()) {
			// Get the next subject from the list
			Subject s = iterator.next();

			// Check if this is the student you want to remove
			if (s.getId() == subject.getId()) {
				// Remove the student using the iterator's remove method
				iterator.remove();
			}
		}
		subject.setStudent(null);

		et.begin();
		// Updating the student  entity after modifying the list
		em.merge(student);

		// Remove the subject after merging student
		em.remove(em.merge(subject)); // first Merge then remove
		et.commit();

		
	}


}
