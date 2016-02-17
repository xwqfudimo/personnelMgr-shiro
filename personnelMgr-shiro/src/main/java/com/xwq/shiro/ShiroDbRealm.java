package com.xwq.shiro;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.xwq.model.Privilege;
import com.xwq.model.Role;
import com.xwq.model.User;
import com.xwq.service.PrivilegeService;
import com.xwq.service.RoleService;
import com.xwq.service.UserService;

public class ShiroDbRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PrivilegeService privilegeService;

	/**
	 * 用户授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		User user = (User) principals.getPrimaryPrincipal();
		int uid = user.getId();
		
		List<Role> roles = this.roleService.listByUserId(uid);
		List<String> roleNames = new ArrayList<String>();
		for(Role r : roles) {
			roleNames.add(r.getName());
		}
		
		List<Privilege> perms = this.privilegeService.listByUserId(uid);
		List<String> permList = new ArrayList<String>();
		for(Privilege p : perms) {
			permList.add(p.getPermission());
		}
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setRoles(new HashSet<String>(roleNames));
		info.setStringPermissions(new HashSet<String>(permList));
		
		return info;
	}

	/**
	 * 用户登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		User user = this.userService.getByUsername(upToken.getUsername());
		
		if(user != null) {
			return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getUsername()), getName());
		}
		
		return null;
	}

}
