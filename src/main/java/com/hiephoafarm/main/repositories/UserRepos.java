package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.UserE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userRepos")
public interface UserRepos extends JpaRepository<UserE, Integer> {
   @Query(nativeQuery = true, value = "select * from user where username = :username")
   public UserE findByUsername(@Param("username") String keyword);
}
