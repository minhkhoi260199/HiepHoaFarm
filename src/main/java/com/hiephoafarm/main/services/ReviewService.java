package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.ReviewE;
import com.hiephoafarm.main.models.ReviewObj;
import com.hiephoafarm.main.models.UserE;
import com.hiephoafarm.main.models.UserObj;
import com.hiephoafarm.main.repositories.ReviewObjRepos;
import com.hiephoafarm.main.repositories.ReviewRepos;
import com.hiephoafarm.main.repositories.UserObjRepos;
import com.hiephoafarm.main.repositories.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("reviewService")
public class ReviewService {

    @Autowired
    ReviewRepos reviewRepos;
    @Autowired
    ReviewObjRepos reviewObjRepos;

    public ReviewObj save(ReviewObj reviewObj){return reviewObjRepos.save(reviewObj);}
    public List<ReviewE> getProductReviews(int id){return reviewRepos.findReviewByProductId(id);}
}
