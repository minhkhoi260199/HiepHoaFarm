package com.app.main.validators;

import com.hiephoafarm.main.models.UserE;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("usersValidator")
public class UsersValidator implements Validator {

	@Autowired
	UserService userService;
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz.equals(UserE.class);
	}

	@Override
	public void validate(Object object, Errors errors) {
		// TODO Auto-generated method stub
		//them validate rieng
		UserE user = (UserE) object;
		UserE oldUser = userService.findByUsername(user.getUsername());
		//kiem tra neu nhap username giong voi "abc" se bao loi
		if(oldUser != null) {
			errors.rejectValue("username", "users.username.exists");
		}
	}
	
	public void validateEdit(Errors errors, String roleString) {
		// TODO Auto-generated method stub
		//them validate rieng
		//kiem tra neu nhap username giong voi "abc" se bao loi
		if(roleString == "" || roleString.isEmpty()) {
			errors.rejectValue("role", "NotEmpty");
		}
	}

}
