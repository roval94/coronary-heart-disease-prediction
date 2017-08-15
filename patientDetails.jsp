<%@page import="com.beans.PatientModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.helper.StringHelper"%>
<%@page import="com.beans.NodesMasterModel"%>
<%@page import="java.util.List"%>
<%@page import="com.db.ConnectionManager"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../tiles/inc.jsp"></jsp:include>
</head>
<body>
	<%
		String pid=request.getParameter("pid");
		List list = ConnectionManager.patientDetails(pid);
	%>
	<jsp:include page="../tiles/menu.jsp"></jsp:include>
	<aside id="fh5co-hero" class="js-fullheight">
	<div class="flexslider js-fullheight">
		<ul class="slides">
			<li
				style="background-image: url(<%=request.getContextPath()%>/theme/images/slide_1.jpg);">
				<div class="overlay-gradient"></div>
				<div class="container">
					<form name="contact-form" id="contact-form"
						action="javascript:fnSubmit();">
						<div class="col-md-10 text-center js-fullheight slider-text"
							style="width: 100%;">
							<div class="slider-text-inner">
								<div class="fh5co-contact animate-box">
									<div class="container">
										<div class="row">
											<div class="col-md-8 col-sm-12 col-xs-12">
												<div class="row">
												<%
															int i = 1;
																for (Iterator iterator = list.iterator(); iterator.hasNext();) {
																	PatientModel object = (PatientModel) iterator.next();
												%>
													<table align="left"
														style="margin: auto; padding: 5px; width: 60%; table-layout: auto;">
														<tr>
															<td style="text-align: left; color: gray;" >Name</td>
															<td style="text-align: left; color: gray;" ><%=object.getPname()%></td>
														</tr>
														<tr>
															<td style="text-align: left; color: gray;" >Address</td>
															<td style="text-align: left; color: gray;" ><%=object.getAddress()%></td>
														</tr>
														<tr>
															<td style="text-align: left; color: gray;" >Contact</td>
															<td style="text-align: left; color: gray;" ><%=object.getContact()%></td>
														</tr>
														<tr>
															<td style="text-align: left; color: gray;" >DOB</td>
															<td style="text-align: left; color: gray;" ><%=object.getDOB()%></td>
														</tr>
														<tr>
															<td style="text-align: left; color: gray;" >Admit Date</td>
															<td style="text-align: left; color: gray;" ><%=object.getAdmitdate()%></td>
														</tr>
														<tr>
															<td style="text-align: left; color: gray;" >Emergency No</td>
															<td style="text-align: left; color: gray;" ><%=object.getEmergencyNo()%></td>
														</tr>
														<tr>
															<td style="text-align: left; color: gray;" >Primary Disease</td>
															<td style="text-align: left; color: gray;" ><%=object.getComplaint()%></td>
														</tr>
														<tr>
															<td style="text-align: left; color: gray;" >Additional Details</td>
															<td style="text-align: left; color: gray;" ><%=object.getDetails()%></td>
														</tr>
														
														<%
															i++;
																}
														%>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</li>
		</ul>
	</div>
	</aside>
	<jsp:include page="../tiles/footer.jsp"></jsp:include>
</body>
<script>

</script>
</html>