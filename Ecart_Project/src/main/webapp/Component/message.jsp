
<%
String message = (String) session.getAttribute("message");

if (message != null) {
%>

<div class="alert alert-warning d-flex align-items-center" role="alert">
	<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
		aria-label="Success:">
		<use xlink:href="#check-circle-fill" /></svg>
	<div>
		<%= message%>
	</div>
</div>

<%
	session.removeAttribute("message");
}
%>