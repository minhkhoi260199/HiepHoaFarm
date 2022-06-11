package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.RoleE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleRepos")
public interface RoleRepos extends JpaRepository<RoleE, Integer> {

}
