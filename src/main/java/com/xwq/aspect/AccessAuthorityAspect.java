package com.xwq.aspect;

import java.lang.reflect.Method;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import com.xwq.annotation.Auth;
import com.xwq.exception.PermissionDeniedException;

/**
 * 使用拦截器实现权限检查，此切片类暂时无用
 */
//@Component
//@Aspect
public class AccessAuthorityAspect {
	
	@Pointcut("execution(* com.xwq.controller.*Controller.*(..))")
	public void pointCut() {
	}
	
	@Before("pointCut()")
	public void before(JoinPoint jp) throws PermissionDeniedException {
		Method[] methods = jp.getTarget().getClass().getMethods();
		
		for(Method m : methods) {
			System.out.println(m.getName() + "," + m.isAnnotationPresent(Auth.class));
			
			if(m.isAnnotationPresent(Auth.class)) { //由于springmvc使得这里不能检测出Controller的方法上的annotation情况，都是返回false，所以考虑采用拦截器
				Auth auth = m.getAnnotation(Auth.class);
				String uri = auth.value();
				
				//...
			}
		}
	}
}
