package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ReviewObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("reviewObjRepos")
public interface ReviewObjRepos extends JpaRepository<ReviewObj, Integer> {

}
