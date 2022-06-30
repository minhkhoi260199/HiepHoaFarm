package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ContactObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("contactObjRepos")
public interface ContactObjRepos extends JpaRepository<ContactObj, Integer> {
   @Query(nativeQuery = true, value = "select * from contact where fullname like %:keyword% ")
   public List<ContactObj> searchByName(@Param("keyword") String keyword);
}
