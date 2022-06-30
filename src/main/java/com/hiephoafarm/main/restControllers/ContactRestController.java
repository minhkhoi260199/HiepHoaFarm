package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.ContactObj;
import com.hiephoafarm.main.models.UserObj;
import com.hiephoafarm.main.services.ContactService;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("api/contact")
public class ContactRestController {

	@Autowired
	ContactService contactService;

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

	@CrossOrigin
	@RequestMapping(value="save", method = RequestMethod.POST)
	public ResponseEntity<?> save(@RequestBody ContactObj contact){
		try {
			ContactObj res = contactService.save(contact);
			return new ResponseEntity<>(res, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
