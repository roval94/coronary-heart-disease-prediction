<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../tiles/inc.jsp"></jsp:include>
</head> 
<body style=" background-color:black;">  
	<jsp:include page="../tiles/menu.jsp"></jsp:include>
<!-- 	<aside id="fh5co-hero" class="js-fullheight"> -->
<!-- 		<div class="flexslider js-fullheight"> -->
<!-- 			<ul class="slides" > -->
<%-- 				<li style="height:475px;background-image: url(<%=request.getContextPath()%>/theme/images/slide_1.jpg);" > --%>
<!-- 					<div class="overlay-gradient"></div> -->
					
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 	</aside> -->
	
	<div class="container" style="height:900px; background-color:black;">   
					<form name="contact-form" id="contact-form" action="javascript:fnSubmit();">
						<div class="col-md-10 col-md-offset-1 text-left js-fullheight slider-text"  >
							<div class="slider-text-inner">
								<div class="fh5co-contact animate-box">
									<div class="container">
										<div class="row">
											<div class="col-md-8 col-md-push-1 col-sm-12 col-sm-push-0 col-xs-12 col-xs-push-0">
												<div class="row">
												<br><br>
													<div class="col-md-6">
														<label><font color="white">NAME</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Name" title="Please enter only characters" pattern="[A-Za-z ]+" required="required"
															 id="name" name="name" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">ADDRESS</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Address" id="address" required="required" name="address" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">CONTACT NO</font></label>
														<div class="form-group">
															<input class="form-control" title="Please enter atleast 10 digits" required="required" pattern="[0-9]{10}" placeholder="Contact No" id="contact" name="contact" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">EMERGENCY CONTACT</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Emergency Contact" required="required" title="Please enter atleast 10 digits"  pattern="[0-9]{10}" id="emergency" name="emergency" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">PRIMARY COMPLAINT</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Primary Complaint" required="required" id="complaint" name="complaint" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">DOB</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Date of Birth" required="required" title="Please enter YYYY-MM-DD" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" id="dob" name="dob" style="color: white;"
																type="text" />
														</div>
													</div>
														<div class="col-md-6">
														<label><font color="white">Ward No</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Enter Ward" title="Please enter atleast 4 digits" required="required" pattern="[0-9]{1,4}" id="wardNo" name="wardNo" style="color: white;"
																type="text" />
														</div>
													</div>
														<div class="col-md-6">
														<label><font color="white">Gender</font></label>
														<div class="form-group">
															<select class="form-control" placeholder="Enter gender" id="gender" name="gender" required="required" style="color: white;"
																>
																<option value='M'>Male</option>
																<option value='F'>Female</option>
																<option value='T'>TransGender</option>
																
																</select>
														</div>
													</div>
													
													<div class="col-md-6">
														<label><font color="white">Smoking(Yes-1/No-2)</font></label>
														<div class="form-group">
															<input class="form-control" title="Please enter atleast 1 digits" required="required" pattern="[0-9]{1}" placeholder="Smoking" id="Smoking" required="required" name="Smoking" style="color: white;"
																type="text" />
														</div>
													</div>
														<div class="col-md-6">
														<label><font color="white">Weight</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Enter weight" id="weight" required="required" name="weight" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">Height(ft)</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Enter Height" id="height" required="required" name="height" style="color: white;"
																type="text" />
														</div>
													</div>
													
													<div class="col-md-6">
														<label><font color="white">Mean Blood Pressure(mmHg)</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Enter Blood Pressure" title="Please enter atleast 2-3 digits" required="required" pattern="[0-9]{2,3}" id="bp" name="bp" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">Additonal Details</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Details" id="details" required="required" name="details" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-12">    
														<div class="form-group">
															<input value="Add" class="btn btn-primary"
																type="submit">
														</div>
													</div>
												</div>   
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					</div>
	<jsp:include page="../tiles/footer.jsp"></jsp:include>
</body>  
<script>

function fnSubmit()
{
	 var str = $( "#contact-form" ).serialize();
	 //alert(str);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=addPatient",
			str,     
			function(data) {
			data=$.trim(data);  
			alert(data);
			//$('#contact-form')[0].reset();

		 	});  
}
</script>
</html>

