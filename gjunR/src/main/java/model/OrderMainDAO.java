package model;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class OrderMainDAO {

	public static String addOrder(OrderMain orderMain) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		session.persist(orderMain);
		session.getTransaction().commit();
		sessionFactory.close();
		return "Order Success";
	}

	public static String updatePaid(String orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		OrderMain orderMain = session.get(OrderMain.class, orderID);
		orderMain.setPaidStatus(1);
		session.update(orderMain);
		session.getTransaction().commit();
		sessionFactory.close();
		return "Paid!!!";
	}

	public static String deleteOrder(String orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		OrderMain orderMain = session.get(OrderMain.class, orderID);
		session.delete(orderMain);
		session.getTransaction().commit();
		sessionFactory.close();
		return "Order deleted!!";
	}

	public static List<OrderMain> readOrder() {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			TypedQuery<OrderMain> query = session.createQuery("from OrderMain", OrderMain.class);
			List<OrderMain> orderList = query.getResultList();
			session.getTransaction().commit();
			sessionFactory.close();
			return orderList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	public static OrderMain readOneOrderMain(String orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			OrderMain orderMain = session.get(OrderMain.class, orderID);
			session.getTransaction().commit();
			sessionFactory.close();
			return orderMain;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}
	
	public static String updatePrice(String orderID, Integer totalPrice) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			OrderMain orderMain = session.get(OrderMain.class, orderID);
			orderMain.setTotalPrice(totalPrice);
			session.update(orderMain);
			session.getTransaction().commit();
			sessionFactory.close();
			return "Price updated";
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}
}
