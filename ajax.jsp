<%@page import="com.helper.SMSSender"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.db.ConnectionManager"%> 
<%@page import="com.helper.StringHelper"%>
<%@page import="com.beans.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.Color"%>
<%@page import="java.util.List"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.util.HashMap"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String sMethod = StringHelper.n2s(request.getParameter("methodId"));
	System.out.println("Method ID====> "+sMethod);
	String returnString = "";   
	boolean bypasswrite=false;

	HashMap parameters = StringHelper.displayRequest(request);
	
	if (sMethod.equalsIgnoreCase("login")) {
		UserModel um= ConnectionManager.checkLogin(parameters);	  	 
		if(um!=null)
		{ 
			if(um.getApprove().trim().equalsIgnoreCase("Y")){
					session.setAttribute("USER_MODEL", um);
					System.out.println("Here 1");
					returnString="1";
			}else{
				returnString="-1";
			}	
		}
		else
		{
			System.out.println("Here Invalid");
			returnString="false";
		}
	}//updatestats
	else if (sMethod.equalsIgnoreCase("logout")) 
	{
		session.removeAttribute("USER_MODEL");
		bypasswrite=true;
		%>
		<script>
			window.location.href='<%=request.getContextPath()%>/pages/index.jsp';
		</script>
		<%  
	}       
	else if (sMethod.equalsIgnoreCase("registerUser")) 
	{     
		System.out.println("AJAX :"+parameters);  
		returnString = ConnectionManager.registerUser(parameters);  
	}
	else if (sMethod.equalsIgnoreCase("updateRole")) 
	{
		returnString = ConnectionManager.updateUser(parameters);  
	}
	else if (sMethod.equalsIgnoreCase("addKitData")) 
	{     
		System.out.println("AJAX :"+parameters);  
		returnString = ConnectionManager.addKitData(parameters);  
	}
	else if (sMethod.equalsIgnoreCase("addPatient")) 
	{     
		System.out.println("addPatient :"+parameters);  
		returnString = ConnectionManager.addPatient(parameters);      
	}
	else if (sMethod.equalsIgnoreCase("patientDetails")) 
	{     
		String pid=request.getParameter("pid");
		System.out.println("Patient ==> "+pid);
		%>
		<script>
			window.location.href='<%=request.getContextPath()%>/pages/patientDetails.jsp?pid=<%=pid%>';
		</script>
		<%
		//returnString = ConnectionManager.addPatient(parameters);      
	}
	else if (sMethod.equalsIgnoreCase("sendSMS")) 
	{     
		System.out.println("addPatient :"+parameters);
		String cleanerPhone=request.getParameter("cleanerPhone");
		String msg=URLDecoder.decode(request.getParameter("msg")) ;
		
		SMSSender sms=new SMSSender(cleanerPhone,msg);
		sms.send();       
	}
	
	else if (sMethod.equalsIgnoreCase("updateRole")) 
	{     
		String pid=request.getParameter("pid");
		System.out.println("Patient ==> "+pid);
		%>
		<script>
			window.location.href='<%=request.getContextPath()%>/pages/patientDetails.jsp?pid=<%=pid%>';
		</script>
		<%
		//returnString = ConnectionManager.addPatient(parameters);      
	}
	else if (sMethod.equalsIgnoreCase("checkUserNameExists")) 
	{
		boolean flag=false;
		//flag = ConnectionManager.checkUserNameExists(parameters); 
		if(flag){
			returnString="1";
		}else{      
			returnString="2";
		}
	}
	else if (sMethod.equalsIgnoreCase("logout")) 
	{
		session.removeAttribute("USER_MODEL");
		bypasswrite=true;
				%>
				<script>
				window.location.href='<%=request.getContextPath()%>/pages/index.jsp';
				</script>
				<%
					}
					else if (sMethod.equalsIgnoreCase("deleteUser")) 
					{ 
						String resp = ConnectionManager.deleteUser(parameters);     
						request.setAttribute("MESSAGE", resp);
						request.getRequestDispatcher("../pages/home.jsp").forward(request, response);
					}
					if(!bypasswrite){
					out.println(returnString);
					}
				%>
