package com.mftour.spring.model;

import com.mftour.spring.constants.enums.AuthorityEnum;
import com.mftour.spring.util.CustomDateSerializer;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.util.Date;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

    // Fields
    private static final long serialVersionUID = -8032736954376548825L;
    private Long id;
    private String name;
    private String password;
    private String email;
   
    

   

    // Constructors

    /**
     * default constructor
     */
    public TUser() {
    }

       // Property accessors

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

     

   
}