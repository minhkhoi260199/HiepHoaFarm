package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.CategoryE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository("categoryRepos")
public interface CategoryRepos extends JpaRepository<CategoryE, Integer> {
    @Query(nativeQuery = true, value = "select * from category where id_category=1")
    public CategoryE findFirst();
}
