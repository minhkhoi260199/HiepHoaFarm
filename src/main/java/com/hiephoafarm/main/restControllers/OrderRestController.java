package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.*;
import com.hiephoafarm.main.services.OrdersService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("api/order")
public class OrderRestController {

	@Autowired
	OrdersService ordersService;
	@Autowired
	JavaMailSender emailSender;

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

	@CrossOrigin
	@RequestMapping(value = "getOrderById", method=RequestMethod.GET)
	public ResponseEntity<?> getById(@RequestParam("id") int id){
		try {
			OrdersE result = ordersService.findByIdOrder(id);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value = "getOrderDetailByOrderId", method=RequestMethod.GET)
	public ResponseEntity<?> getDetailByIdOrder(@RequestParam("id") int id){
		try {
			Format f = new SimpleDateFormat("hh:mm:ss dd/MM/yyyy");
			OrdersE orderE = ordersService.findByIdOrder(id);
			Map<String, Object> order = new HashMap<>();
			order.put("customerName", orderE.getCustomerName());
			order.put("customerPhone", orderE.getCustomerPhone());
			order.put("email", orderE.getCustomerEmail());
			order.put("address", orderE.getAddress());
			order.put("orderAmout", orderE.getOrderAmount());
			order.put("shippingFee", orderE.getShippingFee());
			order.put("createdTime", f.format(orderE.getCreatedTime()));

			List<OrderDetailE> details = ordersService.findDetailByIdOrder(id);
			List<Map<String, Object>> orderDetails = new ArrayList<>();
			for(OrderDetailE item : details){
				Map<String, Object> d = new HashMap<>();
				d.put("quantity",item.getQuantity());
				ProductE prd = item.getProductByProductId();
				d.put("productId",prd.getIdProduct());
				d.put("productName",prd.getProductName());
				d.put("productPhoto",prd.getGalleriesByIdProduct());
				d.put("productPrice",prd.getProductPrice());
				d.put("productSaleUnit",prd.getSaleUnit());
				orderDetails.add(d);
			}
			Map<String, Object> results = new HashMap<>();
			results.put("orderInfo", order);
			results.put("orderDetails", orderDetails);
			return new ResponseEntity<>(results, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value = "getOrdersByUsername", method=RequestMethod.GET)
	public ResponseEntity<?> getByUsername(@RequestParam("un") String username){
		try {
			List<OrdersE> orders = ordersService.searchByPhone(username);
			Format f = new SimpleDateFormat("hh:mm:ss dd/MM/yyyy");
			List<Map<String, Object>> results = new ArrayList<>();
			for(OrdersE item : orders){
				Map<String, Object> order = new HashMap<>();
				order.put("idOrder",item.getIdOrder());
				order.put("createdTime",f.format(item.getCreatedTime()));
				order.put("address",item.getAddress());
				order.put("orderAmount",item.getOrderAmount());
				order.put("statusByStatusId",item.getStatusByStatusId());
				results.add(order);
			}
			return new ResponseEntity<>(results, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "getAllOrder", method=RequestMethod.GET)
	public ResponseEntity<?> getAll(){
		try {
			List<OrdersE> result = ordersService.findAllOrder();
			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "setProcessing", method=RequestMethod.GET)
	public ResponseEntity<?> setProcessing(@RequestParam("id") int id){
		try {
			List<OrdersE> result = ordersService.setStatus(id, 4);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "setShipping", method=RequestMethod.GET)
	public ResponseEntity<?> setShipping(@RequestParam("id") int id){
		try {
			List<OrdersE> result = ordersService.setStatus(id, 5);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "setCompleted", method=RequestMethod.GET)
	public ResponseEntity<?> setCompleted(@RequestParam("id") int id){
		try {
			List<OrdersE> result = ordersService.setStatus(id, 6);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "setCanceled", method=RequestMethod.GET)
	public ResponseEntity<?> setCanceled(@RequestParam("id") int id){
		try {
			List<OrdersE> result = ordersService.setStatus(id, 7);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value="save", method = RequestMethod.POST)
	public ResponseEntity<?> createOrder(@RequestBody String payload){
		try {
			System.out.println(payload);
			JSONObject obj = new JSONObject(payload);

			OrdersObj order = new OrdersObj();
			order.setCustomerName(obj.getString("customerName"));
			order.setCustomerPhone(obj.getString("customerPhone"));
			order.setCustomerEmail(obj.getString("customerEmail"));
			order.setAddress(obj.getString("address"));
			order.setShippingFee(obj.getInt("shippingFee"));
			order.setOrderAmount(obj.getInt("orderAmount"));
//			order.setCreatedTime(new Date( new java.util.Date().getTime()));
			order.setStatusId(3);

			OrdersObj rep = ordersService.saveOrder(order);

			if(rep != null){
				List<OrderDetailObj> items = new ArrayList<>();

				JSONArray arr = obj.getJSONArray("cart");
				for (int i = 0; i < arr.length(); i++) {
					OrderDetailObj item = new OrderDetailObj();
					item.setProductId(arr.getJSONObject(i).getInt("idProduct"));
					item.setQuantity(arr.getJSONObject(i).getInt("quantity"));
					item.setOrderId(rep.getIdOrder());

					items.add(item);
				}
				ordersService.saveAllOrderDetail(items);

			} else {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			//sendEmail
			sendHTMLEmail(rep);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	public void sendEmail(String sendTo){
		//sendEmail
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(sendTo);
		message.setSubject("Test Simple Email");
		message.setText("Hello, Im testing Simple Email");
		// Send Message!
		this.emailSender.send(message);
	}

	@Async("threadPoolTaskExecutor")
	public void sendHTMLEmail(OrdersObj order) throws MessagingException {
		MimeMessage message = emailSender.createMimeMessage();

		boolean multipart = true;
		Format f = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "UTF-8");

		String htmlMsg = "<div colspan=\"2\" style=\"padding:30px;background:#fff;\">\n" +
				"        <table style=\"background-color:#fff;margin: auto;\" width=\"80%\">\n" +
				"            <tbody>\n" +
				"                <tr>\n" +
				"                    <td style=\"font-size:22px;line-height:24px;font-weight:bold;padding-bottom:10px;color:#212529;text-align:center\">\n" +
				"                    <img src=\"https://minhkhoi260199.github.io/img/linh_logo.png\" alt=\"linhFarm_logo\" style=\"width:70px;height:70px;margin-bottom:20px;\">\n" +
				"                    <div>HÓA ĐƠN ĐIỆN TỬ</div>\n" +
				"                    <div style=\"font-size:18px;color:#6d6d72;font-weight:normal;font-style:italic\">(Linh Farm - Hotline: 0376.052.775)</div>\n" +
				"                    </td>\n" +
				"                </tr>\n" +
				"                <tr>\n" +
				"                    <td style=\"color:#212529\">\n" +
				"                    <table cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%;width:100%;border-right:1px solid #ccc;border-top:1px solid #ccc\" width=\"100%\">\n" +
				"                        <tbody>\n" +
				"                            <tr>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\" width=\"210\"><b>Ngày, giờ:</b>\n" +
				"                                <div style=\"color:#6d6d72;font-size:13px\"><i>Trans. Date, Time</i></div>\n" +
				"                                </td>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\">"+f.format(order.getCreatedTime())+"</td>\n" +
				"                            </tr>\n" +
				"                            <tr>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\" width=\"210\"><b>Người đặt:</b>\n" +
				"                                <div style=\"color:#6d6d72;font-size:13px\"><i>Fullname</i></div>\n" +
				"                                </td>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\">"+order.getCustomerName()+"</td>\n" +
				"                            </tr>\n" +
				"                            <tr>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\" width=\"210\"><b>Số điện thoại:</b>\n" +
				"                                <div style=\"color:#6d6d72;font-size:13px\"><i>Phone</i></div>\n" +
				"                                </td>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\">"+order.getCustomerPhone()+"</td>\n" +
				"                            </tr>\n" +
				"                            <tr>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\" width=\"210\"><b>Địa chỉ giao hàng:</b>\n" +
				"                                <div style=\"color:#6d6d72;font-size:13px\"><i>Address</i></div>\n" +
				"                                </td>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\">"+order.getAddress()+"</td>\n" +
				"                            </tr>\n" +
				"                            <tr>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\" width=\"210\"><b>Tổng hóa đơn:</b>\n" +
				"                                <div style=\"color:#6d6d72;font-size:13px\"><i>Total</i></div>\n" +
				"                                </td>\n" +
				"                                <td style=\"border-left:1px solid #ccc;border-bottom:1px solid #ccc;padding:6px 10px\">"+order.getOrderAmount()+" VND</td>\n" +
				"                            </tr>\n" +
				"                        </tbody>\n" +
				"                    </table>\n" +
				"                    </td>\n" +
				"                </tr>\n" +
				"            </tbody>\n" +
				"        </table>\n" +
				"        </div>";

		String a = "";
		message.setContent(htmlMsg, "text/html");

		helper.setTo(order.getCustomerEmail());

		helper.setSubject("LINH FARM - Đặt hàng thành công !");


		this.emailSender.send(message);
	}

}
