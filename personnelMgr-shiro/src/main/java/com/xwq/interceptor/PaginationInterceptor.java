package com.xwq.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xwq.util.Pagination;

/**
 * 分页拦截器
 */
public class PaginationInterceptor extends HandlerInterceptorAdapter {
	private String pageSize;
	
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int pageIndex = request.getParameter("pageIndex") == null? 1 : Integer.parseInt(request.getParameter("pageIndex"));
		
		Pagination.setPageSize(Integer.parseInt(pageSize));
		Pagination.setPageIndex(pageIndex);
		Pagination.setTotalCount(0);
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//返回总记录数
		modelAndView.addObject("totalCount", Pagination.getTotalCount());
		//返回总页数
		modelAndView.addObject("pageCount", Pagination.getPageCount());
		//返回当前页码
		modelAndView.addObject("pageIndex", Pagination.getPageIndex());
		
		super.postHandle(request, response, handler, modelAndView);
	}
}
