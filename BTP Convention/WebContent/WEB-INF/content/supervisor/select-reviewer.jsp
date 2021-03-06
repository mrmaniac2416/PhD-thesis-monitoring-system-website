<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/selectReviewer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<sj:head jqueryui="true" />
<sb:head includeScripts="true"/>


<title>Insert title here</title>
</head>
<body>


	<s:include value="navbar.jsp" />



	<s:if test="acceptedThesis.isEmpty()">
		<div class="noUpdateMesage">No thesis to select reviewer!</div>
	</s:if>
	<s:else>
		<sj:tabbedpanel id="localtabs" cssClass="tab">

			<s:url action="display-accepted-thesis" var="acceptedThesis_url" />

			<sj:tab id="tab1" target="tone" label="Select Reviewers"
				href="%{acceptedThesis_url}" />

			<s:url action="display-reviewers" var="displayReviewers_url" />

			<sj:tab id="tab2" href="%{displayReviewers_url}" target="ttwo"
				label="Add/Edit Reviewer" />

			<div id="tone"></div>


			<div id="ttwo"></div>


		</sj:tabbedpanel>

	</s:else>

</body>
</html>