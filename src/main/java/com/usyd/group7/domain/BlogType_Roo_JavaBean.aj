// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.Blog;
import com.usyd.group7.domain.BlogType;
import java.util.Set;

privileged aspect BlogType_Roo_JavaBean {
    
    public String BlogType.getName() {
        return this.name;
    }
    
    public void BlogType.setName(String name) {
        this.name = name;
    }
    
    public Set<Blog> BlogType.getBlogs() {
        return this.blogs;
    }
    
    public void BlogType.setBlogs(Set<Blog> blogs) {
        this.blogs = blogs;
    }
    
}
