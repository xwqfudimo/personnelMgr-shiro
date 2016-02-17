package com.xwq.enums;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.usertype.ParameterizedType;
import org.hibernate.usertype.UserType;
import org.springframework.util.ObjectUtils;

/**
 * 用户持久化枚举类型的用户自定义hibernate映射类型 使用此类型来进行映射的枚举类，必须实现PersistEnum接口
 * 
 */
public class MyEnumType implements UserType, ParameterizedType {

	private Method returnEnum;
	private Method getPersistedValue;
	private Class<Enum<?>> enumClass;
	private Object enumObject;

	/**
     * This method uses the parameter values passed during enum mapping
     * definition and sets corresponding properties defined
     */
	@SuppressWarnings("unchecked")
	@Override
	public void setParameterValues(Properties parameters) {
		if (parameters != null) {
			try {
				enumClass = (Class<Enum<?>>) Class.forName(parameters.get(
						"enumClass").toString());
				enumObject = enumClass.getEnumConstants()[0];
				getPersistedValue = enumClass.getMethod("getPersistedValue");
				returnEnum = enumClass.getMethod("returnEnum",
						new Class[] { String.class });
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}

	/**
     * This method maps the database mapping
     */
	@Override
	public int[] sqlTypes() {
		return new int[] { Types.VARCHAR };
	}

	/**
     * This method maps the class for which user type is created
     */
	@SuppressWarnings("rawtypes")
	@Override
	public Class returnedClass() {
		return enumClass;
	}

	@Override
	public boolean equals(Object x, Object y) throws HibernateException {
		 return ObjectUtils.nullSafeEquals(x, y);
	}

	@Override
	public int hashCode(Object x) throws HibernateException {
		return x.hashCode();
	}

	/**
     * Recreate the enum from the resultset
     */
	@Override
	public Object nullSafeGet(ResultSet rs, String[] names,
			SessionImplementor session, Object owner)
			throws HibernateException, SQLException {
		  
			String value = rs.getString(names[0]);
	        Object returnVal = null;
	 
	        if (value == null)
	            return null;
	        else {
	            try {
	                returnVal = returnEnum
	                        .invoke(enumObject, new Object[] { value });
	            } catch (IllegalArgumentException e) {
	                e.printStackTrace();
	            } catch (IllegalAccessException e) {
	                e.printStackTrace();
	            } catch (InvocationTargetException e) {
	                e.printStackTrace();
	            }
	        }
	        return returnVal;
	}

	/**
     * Fetch the data from enum and set it in prepared statement
     */
	@Override
	public void nullSafeSet(PreparedStatement st, Object value, int index,
			SessionImplementor session) throws HibernateException, SQLException {
		 	String prepStmtVal = null;
		 
	        if (value == null) {
	            st.setObject(index, null);
	        } else {
	            try {
	                prepStmtVal = getPersistedValue.invoke(value).toString();
	                st.setString(index, prepStmtVal);
	            } catch (IllegalArgumentException e) {
	                e.printStackTrace();
	            } catch (IllegalAccessException e) {
	                e.printStackTrace();
	            } catch (InvocationTargetException e) {
	                e.printStackTrace();
	            }
	        }
	}

	@Override
	public Object deepCopy(Object value) throws HibernateException {
		return value;
	}

	@Override
	public boolean isMutable() {
		 return false;
	}

	@Override
	public Serializable disassemble(Object value) throws HibernateException {
		 Object deepCopy = deepCopy(value);
		 if (!(deepCopy instanceof Serializable))
	            return (Serializable) deepCopy;
	 
	     return null;
	}

	@Override
	public Object assemble(Serializable cached, Object owner)
			throws HibernateException {
		 return deepCopy(cached);
	}

	@Override
	public Object replace(Object original, Object target, Object owner)
			throws HibernateException {
		 return deepCopy(original);
	}

}
