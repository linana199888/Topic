package springmvc.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.OrderDetail;
import model.OrderDetailDAO;
import model.OrderMain;
import model.OrderMainDAO;
import model.ProductDAO;
import model.Products;

@Controller
@RequestMapping("order")
public class OrderController {

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	// 新增訂單
	public String addOrder(@RequestBody List<OrderDetail> orderDetailList) {
		OrderMain orderMain = new OrderMain();
		String orderID = orderMain.getOrderID();
		Integer totalPrice = 0;
		for (int i = 0; i < orderDetailList.size(); i++) {
			OrderDetail orderDetail = orderDetailList.get(i);
			orderDetail.setOrderID(orderID);
			Integer productID = orderDetail.getProductID();
			Products product = ProductDAO.readOneProduct(productID);
			Integer productPrice = product.getProductPrice();
			orderDetail.setPriceEach(productPrice);
			totalPrice += orderDetail.getQuantity() * productPrice;
			String orderDetailMsg = OrderDetailDAO.addOrderDetail(orderDetail);
			System.out.println(orderDetailMsg);
		}
		orderMain.setTotalPrice(totalPrice);
		String orderMsg = OrderMainDAO.addOrder(orderMain);
		System.out.println(orderMsg);
		return orderMsg;
	}

	// 修改付款狀態
	@RequestMapping(value = "/pay/{orderID}", method = RequestMethod.GET)
	public String updatePaid(@PathVariable("orderID") String orderID) {
		String msg = OrderMainDAO.updatePaid(orderID);
		System.out.println(msg);
		return "toOrderManagement";
	}

	// 刪除訂單(訂單明細保留)
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteOrder(@PathVariable("id") String orderID, Model model) {
		String msg = OrderMainDAO.deleteOrder(orderID);
		model.addAttribute("msg", msg);
		return "toOrderManagement";
	}

	// 查詢訂單
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String readOrder(ModelMap model) {
		List<OrderMain> orderMainList = null;
		orderMainList = OrderMainDAO.readOrder();
		Collections.reverse(orderMainList);
		model.addAttribute("orderMainList", orderMainList);
		return "orderManagement";
	}

	// 導入結帳頁面 by orderID
	@RequestMapping(value = "/payCheck/{orderID}", method = RequestMethod.GET)
	public String readOneOrderPrice(@PathVariable("orderID") String orderID, Model model) {
		model.addAttribute("orderID", orderID);
		return "pay";	
	}

	// 前端查詢訂單明細資料(product.productName, orderDetail.quantity)
	@RequestMapping(value = "/test/{orderID}", method = RequestMethod.GET)
	@ResponseBody
	public List<Object> readOneOrderDetailAndProduct(@PathVariable("orderID") String orderID) {
		List<Object> orderDetail = OrderDetailDAO.readOneOrderDetailAndProduct(orderID);
		return orderDetail;
	}

	// 修改訂單明細 + 修改訂單價格
	@RequestMapping(value = "/update/{orderID}", method = RequestMethod.POST)
	public String updateOrder(@PathVariable("orderID") String orderID, @RequestBody List<OrderDetail> orderDetailData) {
		List<OrderDetail> orderDetailList = OrderDetailDAO.updateOrder(orderID, orderDetailData);
//		OrderMain orderMain = OrderMainDAO.readOneOrderMain(orderID);
		Integer totalPrice = 0;
		for (int i = 0; i < orderDetailList.size(); i++) {
			OrderDetail orderDetail = orderDetailList.get(i);
			Integer productID = orderDetail.getProductID();
			Products product = ProductDAO.readOneProduct(productID);
			Integer productPrice = product.getProductPrice();
			totalPrice += orderDetail.getQuantity() * productPrice;
		}
		String msg = OrderMainDAO.updatePrice(orderID, totalPrice);
		System.out.println(msg);
		return "toOrderManagement";
	}

	// 測試用
	@RequestMapping(value = "/readOne/{orderID}", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderDetail> readOneOrderDetail(@PathVariable("orderID") String orderID) {
		List<OrderDetail> orderDetailList = null;
		orderDetailList = OrderDetailDAO.readOneOrderDetail(orderID);
		return orderDetailList;
	}

}
