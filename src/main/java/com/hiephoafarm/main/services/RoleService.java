package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.RoleE;
import com.hiephoafarm.main.repositories.RoleRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("roleService")
public class RoleService {

    @Autowired
    RoleRepos roleRepos;

    //Repos
    public List<RoleE> findAll(){
        return roleRepos.findAll();
    }
}
