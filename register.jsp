<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<jsp:include page="../tiles/inc.jsp"></jsp:include>
</head> 
<body>  
	<jsp:include page="../tiles/menu.jsp"></jsp:include>
	<aside id="fh5co-hero" class="js-fullheight">
		<div class="flexslider js-fullheight">
			<ul class="slides">
				<li style="background-image: url(<%=request.getContextPath()%>/theme/images/slide_1.jpg);">
					<div class="overlay-gradient"></div>
					<div class="container">
					<form name="contact-form" id="contact-form" action="javascript:fnSubmit();">
						<div class="col-md-10 col-md-offset-1 text-left js-fullheight slider-text"  style="width: 100%;">
							<div class="slider-text-inner">
								<div class="fh5co-contact animate-box">
									<div class="container">
										<div class="row">
											<div class="col-md-8 col-md-push-1 col-sm-12 col-sm-push-0 col-xs-12 col-xs-push-0">
												<div class="row">
													<div class="col-md-6">
														<label><font color="white">FIRST NAME</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="First Name" required="required" title="Please enter only characters" pattern="[A-Za-z ]+" id="fname" name="fname" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">LAST NAME</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Last Name" id="lname" required="required" title="Please enter only characters" pattern="[A-Za-z ]+" name="lname" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">CONTACT NO</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Contact No" title="Please enter atleast 10 digits" required="required" pattern="[0-9]{10}" id="contact" name="contact" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">EMAIL ADDRESS</font></label>
														<div class="form-group">
															<input class="form-control" required="required" placeholder="Email Address" id="email" name="email" style="color: white;" 
																type="email" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">USER NAME</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="User Name" required="required" title="Please enter atleast 6 digits"  pattern="[A-Za-z0-9]{6,20}" id="uname" name="uname" style="color: white;"
																type="text" />
														</div>
													</div>
													<div class="col-md-6">
														<label><font color="white">PASSWORD</font></label>  
														<div class="form-group">
															<input class="form-control" placeholder="Password"  required="required"  title="Please enter atleast 6 digits"  pattern="[A-Za-z0-9]{6,20}" id="passwd" name="passwd" style="color: white;"
																type="password" />
									 					</div>         
													</div>
													<div class="col-md-12">    
														<div class="form-group">
															<input value="Register" class="btn btn-primary"
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
				</li>
			</ul>
		</div>
	</aside>
	<jsp:include page="../tiles/footer.jsp"></jsp:include>
</body>
<script>

function fnSubmit()
{
	 var str = $( "#contact-form" ).serialize();
	 //alert(str);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=registerUser",
			str,     
			function(data) {
			data=$.trim(data);  
			alert(data);
		//	$('#contact-form')[0].reset();

		 	});  
}
</script>
</html>

