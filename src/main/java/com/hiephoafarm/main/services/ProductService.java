package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.ProductE;
import com.hiephoafarm.main.repositories.GalleryRepos;
import com.hiephoafarm.main.repositories.ProductRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productService")
public class ProductService {
    @Autowired
    ProductRepos productRepos;
    @Autowired
    GalleryRepos galleryRepos;

    public List<ProductE> findAll(){
        return productRepos.findAll();
    }
    public ProductE save(ProductE productE){
        return productRepos.save(productE);
    }
}
