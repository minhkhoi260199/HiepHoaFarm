package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.ContactObj;
import com.hiephoafarm.main.models.ReviewE;
import com.hiephoafarm.main.models.ReviewObj;
import com.hiephoafarm.main.repositories.ContactObjRepos;
import com.hiephoafarm.main.repositories.ReviewObjRepos;
import com.hiephoafarm.main.repositories.ReviewRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("contactService")
public class ContactService {

    @Autowired
    ContactObjRepos contactObjRepos;

    public ContactObj save(ContactObj reviewObj){return contactObjRepos.save(reviewObj);}
    public List<ContactObj> getContacts(){return contactObjRepos.findAll();}
    public List<ContactObj> search(String key){return contactObjRepos.searchByName(key);}
}
