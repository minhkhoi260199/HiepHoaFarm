package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.*;
import com.hiephoafarm.main.services.OrdersService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("api/order")
public class OrderRestController {

	@Autowired
	OrdersService ordersService;

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
			Format f = new SimpleDateFormat("ss:mm:hh dd/MM/yyyy");
			OrdersE orderE = ordersService.findByIdOrder(id);
			Map<String, Object> order = new HashMap<>();
			order.put("customerName", orderE.getCustomerName());
			order.put("customerPhone", orderE.getCustomerPhone());
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
			Format f = new SimpleDateFormat("ss:mm:hh dd/MM/yyyy");
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
	public ResponseEntity<?> createProduct(@RequestBody String payload){
		try {
			System.out.println(payload);
			JSONObject obj = new JSONObject(payload);

			OrdersObj order = new OrdersObj();
			order.setCustomerName(obj.getString("customerName"));
			order.setCustomerPhone(obj.getString("customerPhone"));
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

			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}


}
