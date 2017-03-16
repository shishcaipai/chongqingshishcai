package com.caijin.I000Wan.common.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.common.service.CommonService;
/**
 * 基础服务类
 * @author Jeff
 * @since 2014-07-21
 * @param <E>
 * @param <ID>
 */

public abstract class CommonServiceImpl<E,ID extends Serializable> implements CommonService<E,ID>{

	protected CommonDao<E,ID> commonDao;

	public void setCommonDao(CommonDao<E, ID> commonDao) {
		this.commonDao = commonDao;
	}

	public CommonDao<E, ID> getCommonDao() {
		return commonDao;
	}
	
	public E get(ID id) {
		return commonDao.getOne(id);
	}

	public E find(ID id) {
		return commonDao.findOne(id);
	}

	public List<E> getAll() {
		return commonDao.findAll();
	}
	
	public Long getTotalCount() {
		return commonDao.count();
	}

	public E save(E entity) {
		return commonDao.save(entity);
	}

	public E update(E entity) {
		return commonDao.save(entity);
	}
	
	public void delete(E entity) {
		commonDao.delete(entity);
	}

	public void delete(ID id) {
		commonDao.delete(id);
	}

	public void delete(Collection<E> entities) {
		commonDao.delete(entities);
	}

	public void flush() {
		commonDao.flush();
	}
	
	public List<E> findAll(Specification<E> spec) {
		return commonDao.findAll(spec);
	}
	
	public Page<E> findAll(Specification<E> spec, Pageable pageable) {
		return commonDao.findAll(spec, pageable);
	}
	
	public List<E> findAll(Specification<E> spec, Sort sort) {
		return commonDao.findAll(spec);
	}
	
	public long count(Specification<E> spec) {
		return commonDao.count(spec);
	}
}
