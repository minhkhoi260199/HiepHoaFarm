package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.ProductE;
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

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

	@RequestMapping(value="add", method = RequestMethod.POST)
	public ResponseEntity<?> createProduct(@Validated @RequestBody ProductE product, BindingResult bindingResult){
		try {
			return new ResponseEntity<>(product, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
