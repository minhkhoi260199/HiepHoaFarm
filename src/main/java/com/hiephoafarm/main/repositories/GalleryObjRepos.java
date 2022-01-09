package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.GalleryObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("galleryObjRepos")
public interface GalleryObjRepos extends JpaRepository<GalleryObj, Integer> {

}
