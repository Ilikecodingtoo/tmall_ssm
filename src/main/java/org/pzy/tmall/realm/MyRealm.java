package org.pzy.tmall.realm;


import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.pzy.tmall.pojo.User;
import org.pzy.tmall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class MyRealm extends AuthorizingRealm{
	@Autowired
	UserService userService;

	/*
	 * 这个是用来做用户权限操作的
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		/*return authorInfo;*/
		return null;

	}

	/* 
	 * 这个是用做登录认证的，securityManager将token传到这里来进行比较
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//		UsernamePasswordToken usernamePasswordToken=(UsernamePasswordToken) token;
//		String username= usernamePasswordToken.getUsername();
//		User user = userService.getUser(username);
//		if(user!=null) {
//			ByteSource salt = ByteSource.Util.bytes(user.getName());
//			SimpleAuthenticationInfo authInfo=
//					new SimpleAuthenticationInfo(user,user.getPassword(), salt, this.getName());
//			return authInfo;
//		}
		return null;
	}

}
