package mydata;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.List;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class CompanyDAO {

    static {

    }

    public void create(companyData company) {

        Configuration con = new Configuration().configure().addAnnotatedClass(companyData.class);
        ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
        SessionFactory sf = con.buildSessionFactory(reg);
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(company);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public companyData read(int id) {

        Configuration con = new Configuration().configure().addAnnotatedClass(companyData.class);
        ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
        SessionFactory sf = con.buildSessionFactory(reg);
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        try {
            return (companyData) session.get(companyData.class, id);
        } finally {
            session.close();
        }
    }

//    public List<companyData> readAll() {
//        Session session = sessionFactory.openSession();
//        try {
//            return session.createQuery("FROM Company", companyData.class).list();
//        } finally {
//            session.close();
//        }
//    }
    
    
    public void update(companyData company) {

        Configuration con = new Configuration().configure().addAnnotatedClass(companyData.class);
        ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
        SessionFactory sf = con.buildSessionFactory(reg);
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(company);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

//    public void delete(int id) {
//
//        Configuration con = new Configuration().configure().addAnnotatedClass(companyData.class);
//        ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
//        SessionFactory sf = con.buildSessionFactory(reg);
//        Session session = sf.openSession();
//        Transaction tx = session.beginTransaction();
//        try {
//            companyData company = (companyData) session.get(companyData.class, id);
//            if (company != null) {
//                session.delete(company);
//            }
//            tx.commit();
//        } catch (Exception e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//    }
}