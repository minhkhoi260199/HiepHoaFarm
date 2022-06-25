package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.helper.UploadHelper;
import com.hiephoafarm.main.models.*;
import com.hiephoafarm.main.services.GalleryService;
import com.hiephoafarm.main.services.ProductService;
import com.hiephoafarm.main.services.ReviewService;
import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api/product")
public class ProductRestController {

	@Autowired
	ProductService productService;
	@Autowired
	GalleryService galleryService;
	@Autowired
	ReviewService reviewService;
//	private ServletContext servletContext;

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

	@CrossOrigin
	@RequestMapping(value="saveReview", method = RequestMethod.POST)
	public ResponseEntity<?> saveReviews(@RequestBody String payload){
		try {
			JSONObject obj = new JSONObject(payload);
			ReviewObj review = new ReviewObj();
			review.setContent(obj.getString("content"));
			review.setProductId(obj.getInt("productId"));
			review.setUserId(obj.getInt("userId"));

			ReviewObj result = reviewService.save(review);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value="getProductReviews", method = RequestMethod.GET)
	public ResponseEntity<?> GetReviews(@RequestParam int id){
		try {
			Map<String, Object> result = new HashMap<>();
			ProductE product = productService.findById(id);
			result.put("product", product);
			List<ReviewE> reviews = reviewService.getProductReviews(id);
			result.put("countReview", reviews.size());
			result.put("reviews", reviews);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value="getItems", method = RequestMethod.GET)
	public ResponseEntity<?> getItems(){
		try {
			List<ProductE> products = productService.findAllEnabled();
			return new ResponseEntity<>(products, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value="search", method = RequestMethod.GET)
	public ResponseEntity<?> getItemsSearch(@RequestParam String keyword){
		try {
			List<ProductE> products = productService.search(keyword);
			return new ResponseEntity<>(products, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@CrossOrigin
	@RequestMapping(value="getItemsByCate", method = RequestMethod.GET)
	public ResponseEntity<?> getItemsByCategory(@RequestParam int cateId){
		try {
			List<ProductE> products = productService.findByCate(cateId);
			return new ResponseEntity<>(products, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value="save", method = RequestMethod.POST)
	public ResponseEntity<?> createProduct(@Validated @RequestBody ProductObj product){
		try {
			ProductObj flag = productService.save(product);
			return new ResponseEntity<>(flag, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value="gallery", method = RequestMethod.POST)
	public ResponseEntity<?> getGalleryByIdProduct(@Validated @RequestParam("id") String id){
		try {
			int productId = Integer.parseInt(id);
			List<GalleryObj> gals = galleryService.findByProductId(productId);
			return new ResponseEntity<>(gals, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/saveGal")
	public ResponseEntity<?> uploadFilez(@RequestParam("gallery") MultipartFile[] files, @RequestParam("productIdGal") String productIdGal) {
		try {
			boolean uploadResult = UploadHelper.saveImages(files);
			int productId = Integer.parseInt(productIdGal);
			if(galleryService.countPhotoById(productId) > 0){
				galleryService.deleteByProductId(productId);
			}
			if(uploadResult){
				List<GalleryObj> gals = new ArrayList<>();
				for (MultipartFile file : files) {
					GalleryObj gallery = new GalleryObj();
					gallery.setProductId(productId);
					gallery.setPhoto(file.getOriginalFilename());
					gals.add(gallery);
				}
				galleryService.saveAll(gals);
				return new ResponseEntity<>(HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value="delete", method = RequestMethod.POST)
	public ResponseEntity<?> deleteProduct(@Validated @RequestParam("id") String id){
		try {
			int productId = Integer.parseInt(id);
			if(productService.existsById(productId)){
				productService.deleteLogic(productId);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
