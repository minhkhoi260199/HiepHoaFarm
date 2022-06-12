package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.UserE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Repository("userRepos")
public interface UserRepos extends JpaRepository<UserE, Integer> {
   @Query(nativeQuery = true, value = "select * from user where username = :username")
   public UserE findByUsername(@Param("username") String keyword);
   @Query(nativeQuery = true, value = "select * from user where role_id = 3 order by id_user DESC")
   public List<UserE> findAllUsers();
   @Query(nativeQuery = true, value = "select * from user where role_id = 2 order by id_user DESC")
   public List<UserE> findAllEmployees();
   @Query(nativeQuery = true, value = "select * from user where username like %:keyword% and role_id = 3")
   public List<UserE> searchByUsername(@Param("keyword") String keyword);
   @Query(nativeQuery = true, value = "select * from user where username like %:keyword% and role_id = 2")
   public List<UserE> searchByUsernameEmployee(@Param("keyword") String keyword);
   @Modifying
   @Query(nativeQuery = true, value = "update user set status_id = 8 where id_user = :id ")
   public void deleteLogicById(@Param("id") int id);
   @Modifying
   @Query(nativeQuery = true, value = "update user set status_id = :statusId where id_user = :id ")
   public void changeStatusId(@Param("id") int id, @Param("statusId") int statusId);
}
