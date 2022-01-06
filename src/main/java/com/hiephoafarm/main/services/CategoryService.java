package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.CategoryE;
import com.hiephoafarm.main.repositories.CategoryRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("categoryService")
public class CategoryService {

    @Autowired
    CategoryRepos categoryRepos;

    public List<CategoryE> findAll(){
        return categoryRepos.findAll();
    }
    public CategoryE save(CategoryE categoryE){
        return categoryRepos.save(categoryE);
    }
    public boolean existsById(int id){
        return categoryRepos.existsById(id);
    }
    public void delete(int id){
        categoryRepos.deleteById(id);
    }
}
