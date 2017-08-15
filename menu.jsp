<%@page import="com.beans.UserModel"%>  
<%
	boolean isLogin = false;
	boolean isNurse = false;
	boolean isDoctor = false;
	boolean isReceptionist=false;
	boolean isAdministrator=false;
	UserModel um = null;
	String role = "", name = "", uid = "";
	if (session.getAttribute("USER_MODEL") != null) {
		um = (UserModel) session.getAttribute("USER_MODEL");
		isLogin = true;
		if(um.getRole().contentEquals("1")){
			isDoctor=true;
		}else if(um.getRole().contentEquals("2")){
			isNurse=true;
		}else if(um.getRole().contentEquals("3")){
			isAdministrator=true;
		}
		else if(um.getRole().contentEquals("4")){
			isReceptionist=true;
		}
	} else{
		isLogin = false;
		isDoctor=false; 
		isNurse=false;
	}
%>
	<div id="fh5co-page">
	<header id="fh5co-header" role="banner">
		<div class="container">
			<div class="header-inner">
				<h1><a href="<%=request.getContextPath()%>/pages/index.jsp">Smart-Hospital<span>.</span></a></h1>
				<nav role="navigation">
					<%
						if (!isLogin) {
					%>
					<ul>  
						<li class="cta"><a href="<%=request.getContextPath()%>/pages/login.jsp">Log In</a></li>
						<li class="cta"><a href="<%=request.getContextPath()%>/pages/register.jsp">Register</a></li>
					</ul>
					<%
						} else {
					%>         
					<ul>  
					<%
						if (isNurse) {
					%> 
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/home.jsp">Home</a></li>
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/viewData.jsp">Real Time Data</a></li>
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/viewPatient.jsp">View Patient</a></li>
					<%
						}else if (isReceptionist) {
					%>
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/home.jsp">Home</a></li>
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/admitPatient.jsp">Register Patient</a></li>
					
					<%
						}else if (isDoctor) {
					%>
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/home.jsp">Home</a></li>
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/viewData.jsp">Real Time Data</a></li>
					<li class="cta"><a href="<%=request.getContextPath()%>/pages/viewPatient.jsp">View Patient</a></li>
					<%
							}
						if(isAdministrator && isLogin){
								%>
								 <li class="cta"><a href="<%=request.getContextPath()%>/pages/viewUser.jsp">View User</a></li>
								<%
							}
						
					%> 
					<li class="cta"><a href="<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=logout">Logout</a></li>
					</ul>  
					<%
						} 
					%>
				</nav>
			</div>
		</div>
	</header>