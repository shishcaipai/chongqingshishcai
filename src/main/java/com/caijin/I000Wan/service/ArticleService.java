package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.Article;

public interface ArticleService extends CommonService<Article,String>{

	List<Article> findByType(Integer type);
}
