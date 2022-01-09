package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.helper.UploadHelper;
import com.hiephoafarm.main.models.GalleryObj;
import com.hiephoafarm.main.models.ProductE;
import com.hiephoafarm.main.services.GalleryService;
import com.hiephoafarm.main.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

	@RequestMapping(value="save", method = RequestMethod.POST)
	public ResponseEntity<?> createProduct(@Validated @RequestBody ProductE product){
		try {
			ProductE flag = productService.save(product);
			return new ResponseEntity<>(flag, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/saveGal")
	public ResponseEntity<?> uploadFilez(@RequestParam("gallery") MultipartFile[] files, @RequestParam("productIdGal") String productIdGal) {
		try {
			String uploadResult = UploadHelper.saveImages(files);
			int productId = Integer.parseInt(productIdGal);
			if(uploadResult == "Uploaded fine"){
				List<GalleryObj> gals = new ArrayList<GalleryObj>();
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

}
