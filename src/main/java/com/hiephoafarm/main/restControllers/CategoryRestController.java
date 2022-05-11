package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.CategoryE;
import com.hiephoafarm.main.models.CategoryView;
import com.hiephoafarm.main.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/category")
public class CategoryRestController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "getAllThings", method = RequestMethod.GET)
	public ResponseEntity<?> getDataListAll(){
		try {
			List<CategoryE> categories = categoryService.findAll();
			return new ResponseEntity<>(categories, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value = "getAll", method = RequestMethod.GET)
	public ResponseEntity<?> getDataList(){
		try {
			List<CategoryView> categories = categoryService.findAll4view();
			return new ResponseEntity<>(categories, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value="save", method = RequestMethod.POST)
//	public ResponseEntity<?> createCategory(@Valid @RequestBody CategoryE category, Authentication authentication){
	public ResponseEntity<?> createCategory(@Validated @RequestBody CategoryView category){
		try {
			CategoryView cate = categoryService.save(category);
			return new ResponseEntity<>(cate, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value="delete", method = RequestMethod.POST)
	public ResponseEntity<?> deleteCate(@RequestParam("id") String id_cat){
		try {
			int id = Integer.parseInt(id_cat);
			if(categoryService.existsById(id)){
				categoryService.delete(id);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e){
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
