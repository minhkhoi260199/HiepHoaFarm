package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.UserE;
import com.hiephoafarm.main.models.UserObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("userObjRepos")
public interface UserObjRepos extends JpaRepository<UserObj, Integer> {
   @Query(nativeQuery = true, value = "select * from user where username = :username")
   public UserObj findByUsername(@Param("username") String username);
   @Query(nativeQuery = true, value = "select * from user where id_user <> :id and username = :username")
   public UserObj findAnotherUsername(@Param("id") int id, @Param("username") String username);
   @Query(nativeQuery = true, value = "select * from user where id_user = :id")
   public UserObj findByIdUserObj(@Param("id") int id);
}
