package com.caijin.I000Wan.common.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
/**
 * 基础服务类
 * @author jeff
 * @since 2014-07-21
 * @param <E>
 * @param <ID>
 */
public interface CommonService<E,ID extends Serializable> {

	public E get(ID id);

	public E find(ID id);

	public List<E> getAll();
	
	public Long getTotalCount();

	public E save(E entity);

	public E update(E entity);
	
	public void delete(E entity);
	
	public void delete(ID id);

	public void delete(Collection<E> entities);

	public void flush();
	
	public List<E> findAll(Specification<E> spec);
	
	public Page<E> findAll(Specification<E> spec, Pageable pageable);
	
	public List<E> findAll(Specification<E> spec, Sort sort);
	
	public long count(Specification<E> spec);
}
