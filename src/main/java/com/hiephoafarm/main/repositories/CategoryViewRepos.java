package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.CategoryView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("categoryViewRepos")
public interface CategoryViewRepos extends JpaRepository<CategoryView, Integer> {
   @Query(nativeQuery = true, value = "select * from category where category_name like %:keyword% ")
   public List<CategoryView> searchByName(@Param("keyword") String keyword);
}
