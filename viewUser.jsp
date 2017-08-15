<%@page import="com.beans.UserModel"%>
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
		List list = ConnectionManager.getUserList();
	UserModel object=null;
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
						action="#">
						<div class="col-md-10 text-center js-fullheight slider-text"
							style="width: 100%;">
							<div class="slider-text-inner">
								<div class="fh5co-contact animate-box">
									<div class="container">
										<div class="row">
											<div class="col-md-8 col-sm-12 col-xs-12">
												<div class="row">
											Set Role	<select id="setRole" name="setRole">
																	<option>Doctor</option>
																	<option>Nurse</option>
																	<option>Receptionist</option>
																</select>
													<table
														style="margin: auto; padding: 5px; width: 100%; table-layout: auto;">
														<tr>
															<th style="text-align: center; color: white;" >Sr.No</th>
															<th style="text-align: center; color: white;" >Name</th>
															<th style="text-align: center; color: white;" >Email</th>
															<th style="text-align: center; color: white;" >Username</th>
															<th style="text-align: center; color: white;" >Contact</th>
															<th style="text-align: center; color: white;" >Action</th>
														</tr>
														<%
															int i = 1;
																for (Iterator iterator = list.iterator(); iterator.hasNext();) {
																	object = (UserModel) iterator.next();
														%>
														<tr>
															<td style=" color: white;"><%=i%>&nbsp;&nbsp;</td>
															<td style=" color: white;"><%=object.getName()%>&nbsp;&nbsp;</td>
															<td style=" color: white;"><%=object.getEmail()%>&nbsp;&nbsp;</td>
															<td style=" color: white;"><%=object.getUsername()%>&nbsp;&nbsp;</td>
															<td style=" color: white;"><%=object.getContact()%>&nbsp;&nbsp;</td>
															<td style=" color: gray;">
<!-- 																<select id="setRole" name="setRole"> -->
<!-- 																	<option>Doctor</option> -->
<!-- 																	<option>Nurse</option> -->
<!--                                                                    <option>Receptionist</option>  -->
<!-- 																</select> -->
															</td>
															<td><button  value="Set" class="btn-primary" type="button" onclick="fnSubmit(<%=object.getUid()%>)">Set</button></td>   
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



function fnSubmit(uid){
	var role=document.getElementById("setRole").value;
	alert(role+'  '+uid);
	var parameters=role+" "+uid;
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=updateRole&setRole="+role+"&uid="+uid+"",
			function(data) {     
		data=$.trim(data);    
		if(data=='-1')
		{
			alert("Account is awaiting approval.");
			window.location.href='<%=request.getContextPath()%>/pages/viewUser.jsp';
		}else{   
			window.location.href='<%=request.getContextPath()%>/pages/home.jsp';
		}
	});
}
</script>
</html>