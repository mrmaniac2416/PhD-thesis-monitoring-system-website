<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<s:head/>
</head>
<body>




	<div>Student ID: ${studentProfile.get(0)}</div>
	<div>Student Name:${studentProfile.get(1)}</div>
	<div>Supervisor Name:${studentProfile.get(6)}</div>
	<div>Research area: ${studentProfile.get(2)}</div>
	<s:if test="studentProfile.get(3)==null">
	Synopsis:
	<s:form action="submit-synopsis" method="POST"
			enctype="multipart/form-data">
			<s:file name="file" label="Select a File to upload" size="40" />
			<s:hidden name="userId" value="%{studentProfile.get(0)}" />
			<s:submit value="submit synopsis" />
		</s:form>

	</s:if>


	<s:else>
		<div>
			Synopsis: Submitted on date

			<s:date name="studentProfile.get(4)" format="dd,MMMMM yyyy" />
		</div>


		<s:url namespace="/" action="download-synopsis" var="synopsis_url">
			<s:param name="student_id">${studentProfile.get(0)}</s:param>
		</s:url>
		<a href='<s:property value = "#synopsis_url"/>' target="_blank"> Download Synopsis</a>

	</s:else>
	<br>
	<br>
	<br>
	<s:if test="studentProfile.get(5)==null">

		<s:if test="studentProfile.get(3)!=null">
			<s:form action="submit-thesis" method="post"
				enctype="multipart/form-data">
				<s:textfield key="thesisName" label="Thesis Name:" />
				<s:file name="file" label="Select a file to upload" />
				<s:submit value="submit Thesis" />
				<s:hidden name="userId" value="%{studentProfile.get(0)}" />
			</s:form>
		</s:if>

	</s:if>



	<br>
	<s:else>
		<div>
			Thesis submitted .
			<s:url namespace="/" action="download-thesis" var="thesis_url">
				<s:param name="thesis_id">${studentProfile.get(5)}</s:param>
			</s:url>
			<a href='<s:property value = "#thesis_url"/>' target="_blank"> Download Thesis</a>

		</div>
	</s:else>

	<s:form namespace="/" action="logout">
		<s:submit value="Logout" />
	</s:form>
</body>
</html>