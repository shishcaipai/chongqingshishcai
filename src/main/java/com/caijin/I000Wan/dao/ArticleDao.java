package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.Article;

/**
 * 文章消息Dao
 * @author jeff
 * @since 2014-06-17
 */
public interface ArticleDao extends CommonDao<Article,String>{

	@Query("select a from Article a where a.type =?1 order by a.createDate desc ")
	List<Article> findByType(Integer type);
}
