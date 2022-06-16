package com.hiephoafarm.main.restControllers;

import com.hiephoafarm.main.models.*;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	@RequestMapping(value="getUserProfile", method = RequestMethod.GET)
	public ResponseEntity<?> findByUsername(@RequestParam("un") String username){
		try {
			UserObj user = userService.findUserObjByUsername(username);
			return new ResponseEntity<>(user, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	@CrossOrigin
	@RequestMapping(value="login", method = RequestMethod.GET)
	public ResponseEntity<?> login(@RequestParam("un") String username, @RequestParam("pw") String password){
		try {
			UserObj user = userService.findUserObjByUsername(username);
			if(user == null){
					return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			if(!user.getStatusId().equals(1)) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(!encoder.matches(password, user.getPassword())){
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return new ResponseEntity<>(user, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	@CrossOrigin
	@RequestMapping(value="register", method = RequestMethod.POST)
	public ResponseEntity<?> register(@RequestBody UserObj user){
		try {
			UserObj compUser = userService.findUserObjByUsername(user.getUsername());
			if(compUser != null){
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			String password = user.getPassword().trim();
			String hash = new BCryptPasswordEncoder().encode(password);
			user.setPassword(hash);
			user.setStatusId(1);
			user.setRoleId(3);
			UserObj flag = userService.save(user);
			return new ResponseEntity<>(flag, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	@CrossOrigin
	@RequestMapping(value="profileSave", method = RequestMethod.POST)
	public ResponseEntity<?> profileSave(@RequestBody UserObj user){
		try {
			UserObj compUsername = userService.findUserObjIsAnotherUsername(user.getIdUser(), user.getUsername());
			if(compUsername != null){
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			UserObj compUser = userService.findById(user.getIdUser());
			if(!compUser.getPassword().equals(user.getPassword())){
				String password = user.getPassword().trim();
				String hash = new BCryptPasswordEncoder().encode(password);
				user.setPassword(hash);
			}
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
