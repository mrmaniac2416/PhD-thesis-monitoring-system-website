<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<sj:head jqueryui="true" />
<title>Insert title here</title>
</head>
<body>

	<form id="reviewer">
		<div id="accordion">
			<div class="card">
				<div class="card-header">
					<a class="card-link" data-toggle="collapse" href="#collapseOne">
						Reviewer - 1 </a>
				</div>
				<div id="collapseOne" class="collapse show" data-parent="#accordion">
					<div class="card-body">
						<s:url var="remoteurl" action="get-reviewer-emails" />
						<sj:select href="%{remoteurl}" list="reviewerEmails" id="r1"
							emptyOption="true" headerKey="-1"
							headerValue="Please Select a reviewer" />
						<br />
						<s:textfield id="r1Name" label="Name"></s:textfield>
						<s:textfield id="r1Designation" label="Designation"></s:textfield>
						<s:textfield id="r1Affiliation" label="Affiliation"></s:textfield>
						<s:textfield id="r1ContactNo" label="Contact No"></s:textfield>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapseTwo"> Reviewer - 2 </a>
				</div>
				<div id="collapseTwo" class="collapse" data-parent="#accordion">
					<div class="card-body">Lorem</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapseThree"> Reviewer - 3 </a>
				</div>
				<div id="collapseThree" class="collapse" data-parent="#accordion">
					<div class="card-body">Lorem</div>
				</div>
			</div>
		</div>
		<input id="submitbutton" type="submit" value="Submit" /> <input
			type="button" id="addAccordion" value="Add Reviewer"></input>
	</form>

	<script>
		var counter = 3;
		$('document')
				.ready(
						function() {

							$("#addAccordion")
									.click(
											function() {
												counter = counter + 1;
												var content = '<div class="card"><div class="card-header"><a class="card-link" data-toggle="collapse" href="#collapse'+counter+'">Reviewer - '+ counter	+ '</a></div><div id="collapse'+counter+'" class="collapse show" data-parent="#accordion"><div id="selectadd" class="card-body"><s:url var="remoteurl" action="get-reviewer-emails" /></div></div> </div>';
												if (counter == 5) {
													document.getElementById(
															'addAccordion')
															.remove();
												}
												$("#accordion").append(content);
												document.getElementById('selectadd').innerHTML = "<sj:select href="%{remoteurl}" list="reviewerEmails" id="r1" emptyOption="true" headerKey="-1" headerValue="Please Select a reviewer" />";
												$("#accordion").accordion(
														"refresh");
												

											});

						});

		$('document').ready(function() {

			$('select').change(function() {
				var dropdownId = $(this).attr('id');
				var reviewerEmail = $(this).val();
				$('#'+dropdownId+'Name').val("Hello");
				$.ajax({
					type: 'GET',
					url: ''
				});
			});
		});
	</script>

</body>
</html>