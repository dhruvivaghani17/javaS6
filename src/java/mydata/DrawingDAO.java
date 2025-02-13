package mydata;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class DrawingDAO {

    public void create(drowingData drawing) {

        Configuration con = new Configuration().configure().addAnnotatedClass(drowingData.class);
        ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
        SessionFactory sf = con.buildSessionFactory(reg);
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();

        try {
            session.save(drawing);
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
    
    public void update(drowingData drawing) {
        Configuration con = new Configuration().configure().addAnnotatedClass(drowingData.class);
        ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
        SessionFactory sf = con.buildSessionFactory(reg);
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(drawing);
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
////        String userId = request.getParameter("id");
////        if (userId != null) {
//        Configuration con = new Configuration().configure().addAnnotatedClass(drowingData.class);
//        ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
//        SessionFactory sf = con.buildSessionFactory(reg);
//        Session session = sf.openSession();
//        Transaction tx = session.beginTransaction();
//        try {
//            drowingData drawing = (drowingData) session.get(drowingData.class, id);
////                Object user = session.get(ownerData.class, Integer.parseInt(userId));
//            if (drawing != null) {
//                session.delete(drawing);
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
////        }
//    }
}
