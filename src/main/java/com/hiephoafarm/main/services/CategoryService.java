package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.CategoryE;
import com.hiephoafarm.main.models.CategoryView;
import com.hiephoafarm.main.repositories.CategoryRepos;
import com.hiephoafarm.main.repositories.CategoryViewRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("categoryService")
public class CategoryService {

    @Autowired
    CategoryRepos categoryRepos;
    @Autowired
    CategoryViewRepos categoryViewRepos;

    //Repos
    public List<CategoryE> findAll(){
        return categoryRepos.findAll();
    }
    public CategoryView save(CategoryView categoryE){
        return categoryViewRepos.save(categoryE);
    }
    public boolean existsById(int id){
        return categoryRepos.existsById(id);
    }
    public void delete(int id){
        categoryRepos.deleteById(id);
    }
    //ViewRepos
    public List<CategoryView> findAll4view(){
        return categoryViewRepos.findAll();
    }
}
