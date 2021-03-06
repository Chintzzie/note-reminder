<%@ page language="java" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ErrorLogger</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
<script>
//alert("From errorLogger");

let errorMsg=Cookies.get("errorMessage");
let successMsg=Cookies.get("successMessage");

//console.log("error:",errorMsg);
//alert("err: "+errorMsg);
if(errorMsg!=null){
	errorMsg=errorMsg.replace(/\+/g," ");
	swal("Error!!", errorMsg, "error");
	//console.log("Cookies: "+Cookies.get('errorMessage')+"\nGetting notif");
}

if(successMsg!=null){
	successMsg=successMsg.replace(/\+/g," ");
	swal("Success!",successMsg,"success");
}

Cookies.remove("errorMessage",{ path: '/' });
Cookies.remove("successMessage",{ path: '/' });

</script>
</body>

</html>