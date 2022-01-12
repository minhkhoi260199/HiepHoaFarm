package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.GalleryObj;
import com.hiephoafarm.main.repositories.GalleryObjRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("galleryService")
public class GalleryService {
    @Autowired
    GalleryObjRepos galleryObjRepos;

    //Repos

    //ObjRepos
    public List<GalleryObj> saveAll(List<GalleryObj> gals){
        return galleryObjRepos.saveAll(gals);
    }
    public List<GalleryObj> findByProductId(int id){ return galleryObjRepos.findByProductId(id); }
    public int countPhotoById(int id) { return galleryObjRepos.countByProductId(id);}
    public void deleteByProductId(int id){ galleryObjRepos.deleteByProductId(id);}
}
