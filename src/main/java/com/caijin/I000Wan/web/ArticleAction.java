package com.caijin.I000Wan.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleAction {

	@Autowired
	private ArticleService articleService;

	@RequestMapping(value = "/article")
	public ModelAndView index(HttpServletRequest request, Model model) {
		Article art = new Article();
		try {
			String id = request.getParameter("id");
			art = articleService.find(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("article", art);
		return new ModelAndView("article/article");
	}

	// @RequestMapping("/article/glist")
	// @ResponseBody
	// public List<Article> getGAticle(HttpServletRequest request,
	// HttpServletResponse response) throws IOException {
	// List<Article> list = new ArrayList<Article>();
	// try {
	// list = articleService.findByType(Article.NOTICE);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return list;
	// }
	//
	// @RequestMapping("/article/tlist")
	// @ResponseBody
	// public List<Article> getTAticle(HttpServletRequest request,
	// HttpServletResponse response) throws IOException {
	// List<Article> list = new ArrayList<Article>();
	// try {
	// list = articleService.findByType(Article.CAIPIAOZIXUN);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return list;
	// }
	//
	// @RequestMapping("/article/deleRecord")
	// @ResponseBody
	// public Article getArticle(HttpServletRequest request,
	// HttpServletResponse response) throws IOException {
	// Article art = new Article();
	// request.setCharacterEncoding("UTF-8");
	// try {
	// String id = request.getParameter("id");
	// art = articleService.find(id);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return art;
	// }
}
