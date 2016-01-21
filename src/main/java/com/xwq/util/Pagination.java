package com.xwq.util;

public class Pagination {
	//每页显示数量
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();
	//开始位置
	private static ThreadLocal<Integer> offset = new ThreadLocal<Integer>();
	//当前页码
	private static int pageIndex;
	//总记录数
	private static ThreadLocal<Integer> totalCount = new ThreadLocal<Integer>();
	//总页数
	private static int pageCount;
	
	public static int getPageSize() {
		return pageSize.get();
	}
	public static void setPageSize(int pageSize) {
		Pagination.pageSize.set(pageSize);
	}
	public static void removePagesize() {
		Pagination.pageSize.remove();
	}
	public static int getOffset() {
		return offset.get();
	}
	public static void setOffset(int offset) {
		Pagination.offset.set(offset);
	}
	public static void removeOffset() {
		Pagination.offset.remove();
	}
	public static void setPageIndex(int pageIndex) {
		Pagination.pageIndex = pageIndex;
		
		Pagination.offset.set((Pagination.pageIndex-1) * Pagination.pageSize.get());
	}
	
	public static int getPageIndex() {
		return pageIndex;
	}
	public static int getTotalCount() {
		return totalCount.get();
	}
	public static void setTotalCount(int totalCount) {
		Pagination.totalCount.set(totalCount);
		
		if(totalCount % pageSize.get() == 0) {
			Pagination.pageCount = totalCount / pageSize.get();
		}
		else {
			Pagination.pageCount = totalCount / pageSize.get() + 1;
		}
	}
	public static void removeTotatlCount() {
		totalCount.remove();
	}
	public static int getPageCount() {
		return pageCount;
	}
}
