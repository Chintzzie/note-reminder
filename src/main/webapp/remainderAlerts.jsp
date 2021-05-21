<%@ page language="java" 
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>ErrorLogger</title>
	</head>
	
	<%
      	String uidd=null;
      	String unamed=null;
      	Cookie[] cookiesd=request.getCookies();
      	Cookie cookied;
      	if(cookiesd!=null){
	      for (int i = 0; i < cookiesd.length; i++) {
	          cookied = cookiesd[i];
	          if(cookied.getName().equals("uid")){
	        	  uidd=cookied.getValue();
	          }else if(cookied.getName().equals("uname")){
	        	  unamed=cookied.getValue();
	          }
	       }
      	}
      %>
	

	<% if(uidd!=null){ %>
	<body>
	
		<script>
		
		function notifyUser(remainderNote){
			
			
			let tagClass="" ;
		  	switch(remainderNote.tag){
		  		case "important":tagClass="bg-primary";break;
		  		case "urgent":tagClass="bg-danger";break;
		  		case "info":tagClass="bg-info";break;
		  	}
		  	
		  	$('#modalchints').addClass(tagClass);
			
			$('#remainderTitle').text(remainderNote.title);
			$('#remainderContent').text(remainderNote.content);
			$('#remainderTime').text(remainderNote.reminderTS);
			$('#gotonote').attr("href","/NoteTaker/all_notes.jsp?noteBookId="+remainderNote.noteBookId+"#"+remainderNote.id)
			$('#exampleModal').modal()
		}
		
		function registerRemainders(remainderNotes){
			remainderNotes.forEach(remainderNote=>{
				let alarmDate=new Date(remainderNote.reminderTS);
				let timeToAlarm=alarmDate.getTime()-new Date().getTime();
				if (timeToAlarm<2147483647 && timeToAlarm>0){
					window.setTimeout(()=>{
						//alert("Alarm for remainderNote:"+remainderNote.title);
						notifyUser(remainderNote);
					},timeToAlarm);
				}
			})
		}
		
		
		
			console.log("Executing remainderAlerts");
		
			 $(document).ready(function (e) {
				 
				 $.ajax("/NoteTaker/NoteBooks/getRemainders?userId=<%=uidd%>", 
						 {
						     dataType: 'json',   
						     success: function (data,status,xhr) {   // success callback function
						    	 console.log("Success 41:"+JSON.stringify(data) );
						     	registerRemainders(data);
						     },
						     error: function (jqXhr, textStatus, errorMessage) { // error callback 
						    	 console.log("Error retrieving remainders for the user!");
						     }
						 });
	             });
	
		
		</script>
		
	</body>

	<%} %>>
</html>