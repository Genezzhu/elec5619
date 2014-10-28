package com.usyd.group7.service;

import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import com.usyd.group7.domain.Blog;
import com.usyd.group7.domain.BlogType;
import com.usyd.group7.domain.Client;

@RooService(domainTypes = { com.usyd.group7.domain.Blog.class })
public interface BlogService {

	/**
	 * get all blogs
	 * 
	 * @return
	 */
	public List<Blog> getAllBlogs(BlogType blogType);

	/**
	 * get all blogs for certain user
	 * 
	 * @param client
	 * @return
	 */
	public List<Blog> getBlogsForClient(Client client);

}
