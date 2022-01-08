package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.GalleryE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("galleryRepos")
public interface GalleryRepos extends JpaRepository<GalleryE, Integer> {

}
