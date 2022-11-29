package model;

public class OrderDetailProduct {
	String orderID;
	Integer productID;
	String productName;
	Integer quantity;

	public OrderDetailProduct() {

	}

	public OrderDetailProduct(String orderID, Integer productID, String productName, Integer quantity) {
		super();
		this.orderID = orderID;
		this.productID = productID;
		this.productName = productName;
		this.quantity = quantity;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderDetailProduct [orderID=" + orderID + ", productID=" + productID + ", productName=" + productName
				+ ", quantity=" + quantity + "]";
	}

}
