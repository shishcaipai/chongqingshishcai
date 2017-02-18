package com.caijin.I000Wan.web.boss;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.service.ArticleService;
import com.caijin.I000Wan.web.UserController;

@Controller
@RequestMapping("/boss")
public class SysArticleAction {
	private final Logger log = LoggerFactory.getLogger(SysArticleAction.class);
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/article/list")
	@ResponseBody
	public List<Article> getArdiclelist() {
		return articleService.findByAllType();
	}

	@RequestMapping("/article/newArdiclet")
	public ModelAndView newArdicle(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		return new ModelAndView("boss/article/article", map);
	}
	@RequestMapping("/article/ardicleList")
	public ModelAndView getArdicle(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		return new ModelAndView("boss/article/articlelist", map);
	}

	@RequestMapping("/article/ajax_save")
	@ResponseBody
	public Map saveArticle(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map result = new HashMap();
		result.put("sucess", false);

		request.setCharacterEncoding("UTF-8");
		try {
			String title = request.getParameter("title");
			String types = request.getParameter("type");
			String author = request.getParameter("anthor");
			String context = request.getParameter("content");
			String source = request.getParameter("source");
			int type = 1;
			try {
				type = Integer.valueOf(types);
			} catch (Exception e) {

			}
			Article article = new Article();
			article.setCreateDate(new Date());
			article.setTitle(title);
			article.setContent(context);
			article.setAuthor(author);
			article.setUpdateDate(new Date());
			article.setType(type);
			article.setSource(source);
			articleService.save(article);
			log.info("当前文本："+article.getContent());
			result.put("sucess", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/article/deleRecord")
	@ResponseBody
	public Map delArticle(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map result = new HashMap();
		result.put("sucess", false);

		request.setCharacterEncoding("UTF-8");
		try {
			String id = request.getParameter("id");
			articleService.delete(id);
			result.put("sucess", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
