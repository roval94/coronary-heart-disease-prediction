<%@page import="com.beans.DataModel"%>
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
		List list = ConnectionManager.getAllData();
	%>
	<jsp:include page="../tiles/menu.jsp"></jsp:include>
	<aside id="fh5co-hero" class="js-fullheight">
	<div class="flexslider js-fullheight">
		<ul class="slides">
			<li
				style="background-image: url(<%=request.getContextPath()%>/theme/images/slide_1.jpg);">
				<div class="overlay-gradient"></div>
				<div class="container">
				<BR><BR>
					<form name="contact-form" id="contact-form"
						action="javascript:fnSubmit();">
						<div class="col-md-10 text-center js-fullheight slider-text"
							style="width: 100%;">
							<div class="slider-text-inner">
								<div class="fh5co-contact animate-box">
									<div class="container">
										<div class="row">
											<div class="col-md-4 col-sm-8 col-xs-12">
												<div class="row">
													<table border="1" style="margin: 10px; padding: 5px; width: 100%; table-layout: auto;">
														<tr>
															<th style="text-align: center; color: white;" >Sr.No</th>
															<th style="text-align: center; color: white;" >HeartBeat</th>
															<th style="text-align: center; color: white;" >Temperture</th>
															<th style="text-align: center; color: white;" >Node-ID</th>
															<th style="text-align: center; color: white;" >Time</th>
<!-- 															<th style="text-align: center; color: aqua;" >Action</th> -->
														</tr>
														<%
															int i = 1;
																for (Iterator iterator = list.iterator(); iterator.hasNext();) {
																	DataModel object = (DataModel) iterator.next();
														%>
														<tr>
															<td style=" color: white;"><%=i%>&nbsp;&nbsp;</td>
															<td style=" color: white;"><%=object.getHeartbeat()%>&nbsp;&nbsp;</td>  
															<td style=" color: white;"><%=object.getTemp()%>&nbsp;&nbsp;</td>
															<td style=" color: white;"><%=object.getNodeid()%>&nbsp;&nbsp;</td>
															<td style=" color: white;"><%=object.getDdate()%>&nbsp;&nbsp;</td>
<%-- 															<td><a href="#" onclick="fnSubmit(<%=object.getPid()%>)">Show</a>&nbsp;&nbsp;</td> --%>
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

fnSubmit(pid){
	
	
}
	
</script>
</html>