<%@page import="com.classifier.SvmClassifier"%>
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
		List list = ConnectionManager.getPatientList();
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
													<table
														style="margin: auto; padding: 5px; width: 100%; table-layout: auto;">
														<tr>
															<th style="text-align: center; color: white;" >Sr.No</th>
															<th style="text-align: center; color: white;" >Ward No.</th>
															<th style="text-align: center; color: white;" >Name</th>
															<th style="text-align: center; color: white;" >Complaint</th>
															<th style="text-align: center; color: white;" >Contact</th>
															<th style="text-align: center; color: white;" >SVM Prediction</th>  
															<th style="text-align: center; color: white;" >Details</th>
														</tr>
														<%
															int i = 1;
																for (Iterator iterator = list.iterator(); iterator.hasNext();) {
																	PatientModel patient = (PatientModel) iterator.next();
																	//age	gender	weight	smoking	height	bloodpressure	heartrate	temp	Decision

																	 double[] featureArray = new double[]{
																				StringHelper.n2d(patient.getAge()) ,
																				StringHelper.n2d(patient.getGender().equalsIgnoreCase("M")?1:2) ,
																				StringHelper.n2d(patient.getWeight()) ,
																				StringHelper.n2d(patient.getSmoking().equalsIgnoreCase("yes")?1:2) ,
																				StringHelper.n2d(patient.getHeight()) ,
																				StringHelper.n2d(patient.getBp()) ,
																				StringHelper.n2d(patient.getHeartbeat()) ,
														    						StringHelper.n2d(patient.getTemp()),0 
																				};
																		boolean b=SvmClassifier.getSVMPredication(featureArray);
																		System.out.println("b "+b);
																		String decision="Normal";
																		if(b){
																			decision="Coronary";
																		}
																	
														%>
														<tr>
															<td style=" color: gray;"><%=i%>&nbsp;&nbsp;</td>
															<td style=" color: gray;"><%=patient.getWardNo()%>&nbsp;&nbsp;</td>
															<td style=" color: gray;"><%=patient.getPname()%>&nbsp;&nbsp;</td>
															<td style=" color: gray;"><%=patient.getComplaint()%>&nbsp;&nbsp;</td>
															<td style=" color: gray;"><%=patient.getContact()%>&nbsp;&nbsp;</td>
															<td style=" color: gray;"><%=decision%>&nbsp;&nbsp;</td>
															<td><a href="<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=patientDetails&pid=<%=patient.getPid()%>">Show</a>&nbsp;&nbsp;</td>   
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