<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<jsp:include page="../tiles/inc.jsp"></jsp:include>
</head>     
<body>
<jsp:include page="../tiles/menu.jsp"></jsp:include>
<aside id="fh5co-hero" class="js-fullheight">
		<div class="flexslider js-fullheight">
			<ul class="slides">  
				<li
					style="background-image: url(<%=request.getContextPath()%>/theme/images/slide_1.jpg);">
					<div class="overlay-gradient"></div>
					<div class="container">
						<form name="contact-form" id="contact-form" action="javascript:fnSubmit();">
						<div class="col-md-10 col-md-offset-1 text-center js-fullheight slider-text">
							<div class="slider-text-inner">
								<div class="fh5co-contact animate-box">
									<div class="container">
										<div class="row">  
											<div class="col-md-8 col-md-push-3 col-sm-12 col-sm-push-0 col-xs-12 col-xs-push-0">
												<div class="row">
													<div class="col-md-6">
														<label><font color="white">USER NAME</font></label>
														<div class="form-group">
															<input class="form-control" placeholder="Enter UserName" id="uname" name="uname" value="doctor" style="color: white;" type="text" />
														</div>
													</div> 
													<div class="col-md-6">
														<label><font color="white">PASSWORD</font></label>  
														<div class="form-group">
															<input class="form-control" placeholder="Enter Password" id="passwd" name="passwd" value="doctor" style="color: white;" type="password" />
									 					</div>           
													</div>
													<div class="col-md-3">
														<div class="form-group">
															<input value="Login" class="btn btn-primary"
																type="submit">
														</div>  
													</div>    
													<div class="col-md-2">         
														<div class="form-group">
															<input value="Reset" class="btn btn-primary" type="reset"/>        
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
	 $.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=login",
			str,   
			function(data) {     
		data=$.trim(data);    
		if(data=='false')  
		{
			alert('Invalid Credentials. Please try again.');
			$('#contact-form')[0].reset();
		}
		else if(data=='-1')
		{
			alert("Your account is awaiting approval.");
			window.location.href='<%=request.getContextPath()%>/pages/index.jsp';
		}else{   
			window.location.href='<%=request.getContextPath()%>/pages/home.jsp';
		}
	});
}      
</script>
</html>