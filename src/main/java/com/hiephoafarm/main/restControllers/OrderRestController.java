package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.OrderDetailObj;
import com.hiephoafarm.main.models.OrdersObj;
import com.hiephoafarm.main.services.OrdersService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("api/order")
public class OrderRestController {

	@Autowired
	OrdersService ordersService;

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

	@CrossOrigin(origins = "http://localhost:3000")
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
