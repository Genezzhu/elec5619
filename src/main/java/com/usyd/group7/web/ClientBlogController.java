package com.usyd.group7.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usyd.group7.domain.Blog;
import com.usyd.group7.domain.BlogType;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientAction;
import com.usyd.group7.service.BlogService;
import com.usyd.group7.service.ClientService;

@RequestMapping("blogs")
@Controller
public class ClientBlogController extends BaseController {

	// declare service classes, Spring will use dependency injection to
	// initialize them
	@Autowired
	public BlogService blogService;
	@Autowired
	public ClientService clientService;

	/**
	 * list all blogs
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String all(
			ModelMap model,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "pageCap", required = false) String pageCapStr,
			@RequestParam(value = "type", required = false) String typeId) {

		// set a default display record number '10'
		int pageCap = pageCapStr == null ? 10 : Integer.parseInt(pageCapStr);

		BlogType blogType = null;
		if (typeId != null && !typeId.isEmpty()) {
			blogType = BlogType.findBlogType(Long.parseLong(typeId));
		}

		// query the db to get the blog
		List<Blog> blogs = blogService.getAllBlogs(blogType);
		model.addAttribute("pageCap", pageCap);
		model.addAttribute("blogs", blogs);
		model.addAttribute("currentBlogType", blogType);
		model.addAttribute("blogTypes", BlogType.findAllBlogTypes());
		return "blogs.all_blogs";
	}

	/**
	 * view certain blog
	 */
	@RequestMapping(value = "view_blog", method = RequestMethod.GET)
	public String view_blog(ModelMap model, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "id", required = false) String id) {

		// query the db to get the blog
		Blog blog = blogService.findBlog(Long.parseLong(id));
		model.addAttribute("blog", blog);

		return "blogs.view_blog";
	}

	/**
	 * list current user's blogs
	 */
	@RequestMapping(value = "my_blogs", method = RequestMethod.GET)
	public String my_blogs(ModelMap model, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "pageCap", required = false) String pageCapStr) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// set a default display record number '10'
		int pageCap = pageCapStr == null ? 10 : Integer.parseInt(pageCapStr);

		// query the db to get the exercises wanted.
		List<Blog> blogs = blogService.getBlogsForClient(client);
		model.addAttribute("pageCap", pageCap);
		model.addAttribute("blogs", blogs);

		return "blogs.my_blogs";
	}

	/**
	 * edit blog page, this one is used for both create new and edit blog
	 * 
	 * @param id
	 *            if id is provided, then it's edit, otherwise it's create new
	 */
	@RequestMapping(value = "edit_blog", method = RequestMethod.GET)
	public String edit_blog(ModelMap model, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "id", required = false) String id) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// if create a new record, then create a new empty object.
		// this way, the jsp can use the attribute "created " as current date
		Blog blog = new Blog();
		if (id != null && !id.isEmpty()) {
			// if try to edit a blog, get the detail from db
			blog = Blog.findBlog(Long.parseLong(id));
		}

		// pass attribute to jsp
		model.addAttribute("blog", blog);
		model.addAttribute("blogTypes", BlogType.findAllBlogTypes());
		return "blogs.edit_blog";
	}

	/**
	 * remove record page
	 */
	@RequestMapping(value = "remove_blog", method = RequestMethod.GET)
	public String remove_blog(ModelMap model, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "id", required = false) String id) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		if (id != null && !id.isEmpty()) {
			// get the blog from db by id
			Blog blog = Blog.findBlog(Long.parseLong(id));
			if (blog != null) {
				// remove from db
				blog.remove();
			}
		}

		// redirect to home page
		return "redirect:/blogs/my_blogs";
	}

	/**
	 * form submit handler, handle create/edit blog. http POST only
	 */
	@RequestMapping(value = "on_edit_blog", method = RequestMethod.POST)
	public String on_edit_blog(ModelMap model, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttr,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "created", required = false) String created,
			@RequestParam(value = "type", required = false) String type) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// by default, consider as create new blog
		Blog blog = new Blog();
		if (id != null && !id.isEmpty()) {
			// if provide attribute id, then it's editing, need to get
			// the existing attribuet from db.
			blog = Blog.findBlog(Long.parseLong(id));
			if (blog == null || blog.getAuthor().getId() != client.getId()) {
				// wrong user
				// redirect to home page
				return "redirect:/blogs/my_blogs";
			}

		}

		blog.setTitle(title);
		blog.setContent(content);
		// update blog object's foreign key for Client table
		blog.setAuthor(client);

		// update blog object's foreign key for blogType table
		if (type != null && !type.isEmpty()) {
			// find existing blogType first, and save it to the DB.
			blog.setBlogType(BlogType.findBlogType(Long.parseLong(type)));
		}

		// try to update created time
		if (created != null && !created.isEmpty()) {
			// convert string into date
			try {
				blog.setCreated(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")
						.parse(created));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		// still, use the id to tell whether it's create or modify
		if (id != null && !id.isEmpty()) {
			// when is edit blog record, use service to update it
			blogService.updateBlog(blog);
		} else {
			// then save to the db
			blogService.saveBlog(blog);
			// Point System code, also send to header
			redirectAttr.addFlashAttribute("ah",
					pointService.takeAction(client, ClientAction.NEW_BLOG));
		}

		// redirect to home page
		return "redirect:/blogs/my_blogs";
	}
}
