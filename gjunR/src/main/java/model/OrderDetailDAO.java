package model;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class OrderDetailDAO {

	public static String addOrderDetail(OrderDetail orderDetail) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		session.persist(orderDetail);
		session.getTransaction().commit();
		sessionFactory.close();
		return "OrderDetail Inserted";
	}

	public static String deleteOrderDetail(Integer orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		OrderDetail orderDetail = session.get(OrderDetail.class, orderID);
		session.delete(orderDetail);
		session.getTransaction().commit();
		sessionFactory.close();
		return "OrderDetail deleted!!";
	}

	public static List<OrderDetail> readOrderDetail() {
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
			TypedQuery<OrderDetail> query = session.createQuery("from OrderDetail", OrderDetail.class);
			List<OrderDetail> orderDetailList = query.getResultList();
			session.getTransaction().commit();
			sessionFactory.close();
			return orderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	public static List<Object> readOneOrderDetailAndProduct(String orderID) {
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
			String query = "SELECT od.orderID, od.productID, p.productNameChi, od.quantity FROM OrderDetail as od INNER JOIN Products as p ON od.productID = p.productID where od.orderID = :orderID";
			List<Object> orderDetailList = session.createQuery(query).setParameter("orderID", orderID).list();
			session.getTransaction().commit();
			sessionFactory.close();
			return orderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	public static List<OrderDetail> updateOrder(String orderID, List<OrderDetail> orderDetailData) {
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
			List<OrderDetail> preOrderDetailList = OrderDetailDAO.readOneOrderDetail(orderID);
			for (OrderDetail pre : preOrderDetailList) {
				for (OrderDetail post : orderDetailData) {
					if (pre.getProductID() == post.getProductID()) {
						if (post.getQuantity() == 0) {
							session.delete(pre);
						} else {
							pre.setQuantity(post.getQuantity());
							session.update(pre);
						}
					}
				}
			}
			session.getTransaction().commit();
			List<OrderDetail> postOrderDetailList = OrderDetailDAO.readOneOrderDetail(orderID);
			sessionFactory.close();
			return postOrderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	public static List<OrderDetail> readOneOrderDetail(String orderID) {
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
			TypedQuery<OrderDetail> query = session
					.createQuery("from OrderDetail WHERE orderID = :orderID", OrderDetail.class)
					.setParameter("orderID", orderID);
			List<OrderDetail> orderDetailList = query.getResultList();
			session.getTransaction().commit();
			sessionFactory.close();
			return orderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}
}
