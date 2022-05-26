package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.helper.UploadHelper;
import com.hiephoafarm.main.models.GalleryObj;
import com.hiephoafarm.main.models.ProductE;
import com.hiephoafarm.main.models.ProductObj;
import com.hiephoafarm.main.services.GalleryService;
import com.hiephoafarm.main.services.ProductService;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("api/product")
public class ProductRestController {

	@Autowired
	ProductService productService;
	@Autowired
	GalleryService galleryService;
//	private ServletContext servletContext;

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

//	@CrossOrigin(origins = "http://
	@CrossOrigin
	@RequestMapping(value="getItems", method = RequestMethod.GET)
	public ResponseEntity<?> getItems(){
		try {
			List<ProductE> products = productService.findAll();
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
				productService.delete(productId);
				galleryService.deleteByProductId(productId);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
