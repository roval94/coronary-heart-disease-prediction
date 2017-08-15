<%@page import="com.db.DBUtils"%>
<%@page import="com.classifier.SvmClassifier"%>
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
<meta http-equiv="refresh" content="30">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../tiles/inc.jsp"></jsp:include>
<style>
@font-face {
    font-family:"DIGITAL DREAM";
    src: url("<%=request.getContextPath()%>/theme/fonts/DIGITALDREAM.TTF") /* EOT file for IE */
}
</style>
</head>
<body style="background-color: black; ">

   


	<%
	String pid=StringHelper.n2s(request.getParameter("pid"));
	String doctorPhoneNo=DBUtils.getMaxValueStr("SELECT group_concat(contact SEPARATOR ',') FROM `useraccount` where role=1");
	List patientList = ConnectionManager.getPatientList();
		List list = ConnectionManager.getAllData();
	%>
	<jsp:include page="../tiles/menu.jsp"></jsp:include>
	<aside id="fh5co-hero" class="js-fullheight">
	<div class="flexslider js-fullheight">
		<ul class="slides">
			<li
				style="background-image: url(<%=request.getContextPath()%>/theme/images/black.jpg);">
				<div class="overlay-gradient"></div>
				<div class="container" style="width: 100%;">
				<BR><BR>
					<form name="contact-form" id="contact-form"
						action="javascript:fnSubmit();">
									   
						
						
						<div class="col-md-12 text-center js-fullheight slider-text"
							style="width: 100%;">
							<div class="slider-text-inner">
								<div class="fh5co-contact animate-box">
									<h1 style="color: yellow;font-family: DIGITAL DREAM;margin-top: 5px;font-size: 62px;" >Dashboard</h1><HR>
									<div class="container" style="width: 100%">
										
								   		
										<div class="row" >      
										
										<%
											Iterator iterator = patientList.iterator(); 
											if(iterator.hasNext()){
											PatientModel patient = (PatientModel) iterator.next();
											if(pid.length()>0 && !pid.equalsIgnoreCase(patient.getPid())){
								
											}
											
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
												String decision="Coronary";
												String image="ok.png";
												String message="Hello Doctor, Patient "+patient.getPname()+" admitted in ward no "+patient.getWardNo()+" needs your attention.";
												if(b){
													image="alert.png";
													
												}   
												
											
										%>
											<div class="col-md-4" style="border: thin;border-style: dashed;background-color: black;">
												<div class="row" style="font-family: DIGITAL DREAM">
													<h1 style="color: yellow;font-family: DIGITAL DREAM;margin-top: 25px;" ><%=patient.getPname() %>
													<img style="width: 40px;height: 40px;float: right;" src="<%=request.getContextPath()%>/theme/images/<%=image%>" title="<%=image%>"/><a href="#" style="float: right;" onclick="fnSubmit('<%=message%>','<%=doctorPhoneNo%>')">
													<img  src="<%=request.getContextPath()%>/theme/images/doctor.png" style="width: 40px;height: 40px;"/></a> </h1><HR>
													
												<marquee style="color: red;">Ward No - <%=patient.getWardNo() %> Heart Rate - <%=StringHelper.n2s(patient.getHeartbeat())  %> Temperature-<%=StringHelper.n2s(patient.getTemp())%></marquee>	 
													<div id="div<%=patient.getPid()%>">  
													</div>
													<iframe src="<%=request.getContextPath()%>/pages/patientGraph.jsp?pid=<%=patient.getPid()%>" width="400px" height="300px" frameborder="0"></iframe>
													
													    
													
												</div>   
											</div>   
											
											<%} %>
											       
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
<script>



function fnSubmit(message,cleanerPhone){
	//alert(cleanerPhone);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=sendSMS&cleanerPhone="+cleanerPhone+'&msg='+encodeURI(message),
			function(data) {     
		data=$.trim(data);    
	//alert('Message Sent');
	});
}
</script>
</body>

</html>