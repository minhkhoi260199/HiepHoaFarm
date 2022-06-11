package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.UserObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("userObjRepos")
public interface UserObjRepos extends JpaRepository<UserObj, Integer> {
}
