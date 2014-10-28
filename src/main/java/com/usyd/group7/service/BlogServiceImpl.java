package com.usyd.group7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.usyd.group7.dao.BlogDao;
import com.usyd.group7.domain.BlogType;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Blog;

public class BlogServiceImpl implements BlogService {
	@Autowired
	BlogDao blogDao;

	public List<Blog> getAllBlogs(BlogType blogType) {
		return blogDao.getAllBlogs(blogType);
	}

	public List<Blog> getBlogsForClient(Client client) {
		return blogDao.getBlogsForClient(client);
	}

}
