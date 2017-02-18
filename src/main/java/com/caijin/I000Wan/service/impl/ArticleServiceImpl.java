package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.ArticleDao;
import com.caijin.I000Wan.dao.ChongZhiRecordDao;
import com.caijin.I000Wan.entity.Article;
import com.caijin.I000Wan.service.ArticleService;

@Component
@Transactional
public class ArticleServiceImpl extends CommonServiceImpl<Article,String> implements ArticleService{

	@Autowired
	private ArticleDao articleDao;
	@Autowired
	public void setChongZhiRecordDao(ArticleDao chongZhiRecordDao) {
		super.setCommonDao(chongZhiRecordDao);
	}
	

	public List<Article> findByType(Integer type){
		return articleDao.findByType(type);
	}

	@Override
	public List<Article> findByAllType() {
		return articleDao.findAll();
	}
}
