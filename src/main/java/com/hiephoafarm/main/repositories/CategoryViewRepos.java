package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.CategoryE;
import com.hiephoafarm.main.models.CategoryView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository("categoryViewRepos")
public interface CategoryViewRepos extends JpaRepository<CategoryView, Integer> {

}
