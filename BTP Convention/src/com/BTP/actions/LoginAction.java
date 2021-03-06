package com.BTP.actions;
//change
//change
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.BTP.services.LoginService;

@Results({
	@Result(name="student", location="student/home-page",type="redirectAction"),
	@Result(name="supervisor",location="supervisor/home-page",type="redirectAction"),
	@Result(name="dean",location="dean/home-page",type="redirectAction"),
	@Result(name="reviewer",location="reviewer/pending-reviews",type="redirectAction")
	})
@ParentPackage(value = "custom2")
@InterceptorRef("jsonValidationWorkflowStack")
public class LoginAction extends ActionSupport implements SessionAware{

	private String userId;
	private String password;
	private Object []result;
	private SessionMap<String,Object> sessionMap;  
	LoginService loginService=new LoginService();
	
	
	
	public Object[] getResult() {
		return result;
	}
	public void setResult(Object[] result) {
		this.result = result;
	}

	
	public String getUserId() {
		return userId;
	}
	
	@RequiredStringValidator(message = "Enter your User ID.")
	@EmailValidator(message = "Enter a valid E-mail address." )
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	
	@RequiredStringValidator(message = "Enter your Password.")
	public void setPassword(String password) {
		this.password = password;
	}
	
		
	
	public void validate()
	{
		
		result=loginService.authenticate(userId, password);
		if(result==null)
			addActionError("Username or password not valid!");
		
			
		
	}
	
	

	public String execute()
	{
        System.out.println((String)result[3]);
        System.out.println("in login action");
		sessionMap.put("userId", userId);
		sessionMap.put("usertype",(String)result[3]);
		sessionMap.put("userName", (String)result[1]);
		return (String)result[3];
		
	}
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.sessionMap=(SessionMap<String, Object>) session;
	}
	
	
	
}
