package com.community.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
