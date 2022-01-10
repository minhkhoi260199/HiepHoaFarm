package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.GalleryObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("galleryObjRepos")
public interface GalleryObjRepos extends JpaRepository<GalleryObj, Integer> {
    @Query(nativeQuery = true, value = "select * from gallery where product_id = :productId")
    public List<GalleryObj> findByProductId(@Param("productId") int id);
    @Query(nativeQuery = true, value = "select count(id_gallery) from gallery where product_id = :productId")
    public int countByProductId(@Param("productId") int id);
    @Query(nativeQuery = true, value = "delete from gallery where product_id = :productId")
    public void deleteByProductId(@Param("productId") int id);
}
