package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.UserE;
import com.hiephoafarm.main.models.UserObj;
import com.hiephoafarm.main.repositories.UserObjRepos;
import com.hiephoafarm.main.repositories.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
public class UserService implements UserDetailsService {

    @Autowired
    UserRepos userRepos;
    @Autowired
    UserObjRepos userObjRepos;

    public UserObj save(UserObj user){ return userObjRepos.save(user);}
    public UserE findByUsername(String username){
        return userRepos.findByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserE user = userRepos.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Username Not FoundException");
        } else {
            List<GrantedAuthority> authorities = new ArrayList<>();
            if (user.getStatusByStatusId().getIdStatus() == 1) {
                authorities.add(new SimpleGrantedAuthority(user.getRoleByRoleId().getRoleName()));
            }
            return new User(user.getUsername(), user.getPassword(), authorities);
        }
    }
}
