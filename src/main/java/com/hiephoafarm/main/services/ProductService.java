package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.ProductE;
import com.hiephoafarm.main.models.ProductObj;
import com.hiephoafarm.main.repositories.ProductObjRepos;
import com.hiephoafarm.main.repositories.ProductRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productService")
public class ProductService {
    @Autowired
    ProductRepos productRepos;
    @Autowired
    ProductObjRepos productObjRepos;

    //Repos
    public List<ProductE> findAll(){
        return productRepos.findAll();
    }
    public List<ProductE> findByCate(int id) { return productRepos.searchByCate(id);}
    public List<ProductE> search(String keyword) { return productRepos.search(keyword); }
    public long countAll(){
        return productRepos.count();
    }
    public Page<ProductE> loadData(Pageable pageable){
        return productRepos.findAll(pageable);
    }
    public boolean existsById(int id){ return productRepos.existsById(id);}
    public void delete(int id){productRepos.deleteById(id);}
    //ObjRepos
    public ProductObj save(ProductObj productObj){return productObjRepos.save(productObj);}

}
