package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.ProductE;
import com.hiephoafarm.main.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/product")
public class ProductRestController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

	@RequestMapping(value="save", method = RequestMethod.POST)
	public ResponseEntity<?> createProduct(@Validated @RequestBody ProductE product){
		try {
			ProductE flag = productService.save(product);
			return new ResponseEntity<>(flag.getProductName(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
