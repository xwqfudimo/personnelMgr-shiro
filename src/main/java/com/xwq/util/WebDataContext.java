package com.xwq.util;

import java.util.List;

public class WebDataContext {
	public static List<String> privilegeUriList;

	public static List<String> getPrivilegeUriList() {
		return privilegeUriList;
	}

	public static void setPrivilegeUriList(List<String> privilegeUriList) {
		WebDataContext.privilegeUriList = privilegeUriList;
	}
}
