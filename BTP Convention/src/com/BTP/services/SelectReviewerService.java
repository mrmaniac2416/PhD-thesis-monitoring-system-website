package com.BTP.services;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.BTP.JPA.student;
import com.BTP.JPA.thesis;
import com.BTP.JPA.thesisreviewer;
import com.BTP.JPA.thesisreviewerPK;
import com.BTP.JPA.users;

public class SelectReviewerService {
	
	
	public List<Object[]> selectReviewerDashboard(String userId)
	{
		Configuration con = new Configuration().configure().addAnnotatedClass(users.class).addAnnotatedClass(student.class).addAnnotatedClass(thesis.class);

		SessionFactory sf = con.buildSessionFactory();

		Session session = sf.openSession();

		Transaction tx = session.beginTransaction();
		String accepted="accepted";
		Query q = session.createQuery("select t.thesis_id,t.thesis_name,u.user_name,t.submitted_date from student s inner join users u on u.user_id=s.student_id inner join thesis t on t.thesis_id=s.thesis_id where t.status=:accepted and s.supervisor_id=:userId order by t.submitted_date desc");
		q.setParameter("userId", userId);
		q.setParameter("accepted", accepted);
		List<Object[]> acceptedThesis = (List<Object[]>) q.list();
		tx.commit();
		session.close();
		sf.close();
		return acceptedThesis;
	}
	
//	public void submitIndianReviewers(int thesis_id,String []reviewersEmail)
//	{
//
//		Configuration con = new Configuration().configure().addAnnotatedClass(thesis.class);
//
//		SessionFactory sf = con.buildSessionFactory();
//
//		Session session = sf.openSession();
//		
//		Transaction tx = session.beginTransaction();
//		String status="reviewersSelected";
//	    Query q = session.createQuery("update thesis set indian_reviewer_email_id=:reviewersEmail, status=:status where thesis_id=:thesis_id");
//        q.setParameter("reviewersEmail", reviewersEmail);
//        q.setParameter("status", status);
//        q.setParameter("thesis_id", thesis_id);
//        
//        
//        q.executeUpdate();
//        
//        tx.commit();
//        session.close();
//        sf.close();
//				
//		
//		
//	}
//	
//	public void submitAbroadReviewers(int thesis_id,String []reviewersEmail)
//	{
//
//		Configuration con = new Configuration().configure().addAnnotatedClass(thesis.class);
//
//		SessionFactory sf = con.buildSessionFactory();
//
//		Session session = sf.openSession();
//		
//		Transaction tx = session.beginTransaction();
//		String status="reviewersSelected";
//	    Query q = session.createQuery("update thesis set abroad_reviewer_email_id=:reviewersEmail, status=:status where thesis_id=:thesis_id");
//        q.setParameter("reviewersEmail", reviewersEmail);
//        q.setParameter("status", status);
//        q.setParameter("thesis_id", thesis_id);
//        
//        System.out.println("upload mein gaya");
//        
//        q.executeUpdate();
//        
//        tx.commit();
//        session.close();
//        sf.close();
//				
//		
//		
//	}
	
	
	public void submitReviewers(int thesisId,String []indianReviewers,String []abroadReviewers,String supervisorId)
	{

		Configuration con = new Configuration().configure().addAnnotatedClass(thesisreviewer.class).addAnnotatedClass(thesis.class);

		SessionFactory sf = con.buildSessionFactory();

		Session session = sf.openSession();
		
		Transaction tx = session.beginTransaction();
		String stat="selected";
	    for(int i=0;i<indianReviewers.length;i++)
	    {
	    	thesisreviewer thesisReviewer = new thesisreviewer();
	    	thesisreviewerPK thesisreviewerId = new thesisreviewerPK();
	    	thesisreviewerId.setThesisId(thesisId);
	    	thesisreviewerId.setReviewerId(indianReviewers[i]);
	    	thesisReviewer.setThesisreviewerId(thesisreviewerId);
	    	thesisReviewer.setSupervisorId(supervisorId);
	    	thesisReviewer.setStatus(stat);
	    	session.save(thesisReviewer);
	    }
	    for(int i=0;i<abroadReviewers.length;i++)
	    {
	    	thesisreviewer thesisReviewer = new thesisreviewer();
	    	thesisreviewerPK thesisreviewerId = new thesisreviewerPK();
	    	thesisreviewerId.setThesisId(thesisId);
	    	thesisreviewerId.setReviewerId(abroadReviewers[i]);
	    	thesisReviewer.setThesisreviewerId(thesisreviewerId);
	    	thesisReviewer.setSupervisorId(supervisorId);
	    	thesisReviewer.setStatus(stat);
	    	session.save(thesisReviewer);
	    }
        
	    String status="reviewersSelected";
	    Query q = session.createQuery("update thesis set status=:status where thesis_id=:thesis_id");
        q.setParameter("status", status);
        q.setParameter("thesis_id", thesisId);
        q.executeUpdate();
	    
	    
        tx.commit();
        session.close();
        sf.close();
				
		
		
	}

}
