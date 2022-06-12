package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.*;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("api/auth")
public class UserRestController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "index", method=RequestMethod.GET)
	public String getDataList(){
			return "Hello JavaSolutionsGuide Readers";
	}

//	@CrossOrigin(origins = "http://
	@CrossOrigin
	@RequestMapping(value="getUser", method = RequestMethod.GET)
	public ResponseEntity<?> findByUsername(@RequestParam String username){
		try {
			UserE user = userService.findByUsername(username);
			return new ResponseEntity<>(user, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	@CrossOrigin
	@RequestMapping(value="save", method = RequestMethod.POST)
	public ResponseEntity<?> save(@RequestBody UserObj user){
		try {
			UserObj flag = userService.save(user);
			return new ResponseEntity<>(flag, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value="saveStatus", method = RequestMethod.POST)
	public ResponseEntity<?> changeStatus(@RequestBody UserObj user){
		try {
			userService.changeStatus(user.getIdUser(), user.getStatusId());
			return new ResponseEntity<>(user, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value="delete", method = RequestMethod.POST)
	public ResponseEntity<?> deleteUser(@Validated @RequestParam("id") String id){
		try {
			int userId = Integer.parseInt(id);
			if(userService.existsById(userId)){
				userService.deleteLogic(userId);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
