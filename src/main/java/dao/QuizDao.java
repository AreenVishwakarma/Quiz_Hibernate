package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import java.util.List;
import model.Users_Ans;
import model.Quiz;
import model.Student_Details;

public class QuizDao {

    // SAVE THE DATA
    public void saveQuiz(Users_Ans userAns) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(userAns);
            transaction.commit();
        } catch (Exception e) {
            // Only rollback if the transaction is still active
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
    // SAVE THE STUDENT DATA
    public void saveStudent(Student_Details studentDT) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(studentDT);
            transaction.commit();
        } catch (Exception e) {
            // Only rollback if the transaction is still active
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
    // SHOW ALL DATA
        public List<Quiz> getAllQuizs() {
           Session session = HibernateUtil.getSessionFactory().openSession();
           List<Quiz> list = session.createQuery("from Quiz", Quiz.class).list();
           session.close();
           return list;
        }
        
        public List<Student_Details> getAllStudents() {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<Student_Details> list = session.createQuery("from Student_Details", Student_Details.class).list();
            session.close();
            return list;
        }
}
