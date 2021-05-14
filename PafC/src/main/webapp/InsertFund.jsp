
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "com.model.Fund_Management" %>
 
  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/employeeNav.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<script type="text/javascript" src="Components/jquery-3.6.0.js"></script>

<script type="text/javascript">
//CLIENT-MODEL================================================================

$(document).ready(function()
		{
			if ($("#alertSuccess").text().trim() == "")
			{
				$("#alertSuccess").hide();
			}
			$("#alertError").hide();
		});

//SAVE ============================================
$(document).on("click", "#NewFundii", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
			 var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
		 $.ajax( 
		 { 
		 url : "webapi1", 
		 type : type, 
		 data : $("#NewFundf").serialize(), 
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 onItemSaveComplete(response.responseText, status); 
		 } 
});

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
	//$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	$("#hidItemIDSave").val($(this).data("id")
	$("#fundidf").val($(this).closest("tr").find('td:eq(0)').text());
	$("#fname2").val($(this).closest("tr").find('td:eq(1)').text());
	$("#fname6").val($(this).closest("tr").find('td:eq(2)').text());
	$("#fname7").val($(this).closest("tr").find('td:eq(3)').text());
	$("#lname3").val($(this).closest("tr").find('td:eq(4)').text());
	$("#lname4").val($(this).closest("tr").find('td:eq(5)').text());
	$("#lname5").val($(this).closest("tr").find('td:eq(6)').text());
	$("#lname6").val($(this).closest("tr").find('td:eq(7)').text());
});


	// DELETE===========================================
	$(document).on("click", ".btnRemove", function(event)
	{ 
	 $.ajax( 
	 { 
	 url : "webapi1", 
	 type : "DELETE", 
	 data : "id=" + $(this).data("id"),
	 dataType : "text", 
	 complete : function(response, status) 
	 { 
	 onItemDeleteComplete(response.responseText, status); 
	 } 
	 }); 
});

	
	function validateItemForm()
	{
		// CODE
		if ($("#fundidf").val().trim() == "")
		{
			return "Insert Fund ID.";
		}
		
		// NAME
		if ($("#fname2").val().trim() == "")
		{
			return "Insert  Title.";
		}
		
		if ($("#fname6").val().trim() == "")
		{
			return "Insert Released Date.";
		}
		
		if ($("#fname7").val().trim() == "")
		{
			return "Insert Expire Date.";
		}
		
		if ($("#lname3").val().trim() == "")
		{
			return "Insert Type of Research.";
		}
		
		// NAME
		if ($("#lname4").val().trim() == "")
		{
			return "Insert  Announcement type.";
		}
		
		if ($("#lname5").val().trim() == "")
		{
			return "Insert Purpose of funding.";
		}
		
		if ($("#lname6").val().trim() == "")
		{
			return "Insert Applicant Instruction.";
		}
		
		
		
		return true;
	}

	function onItemSaveComplete(response, status)
	{ 
	if (status == "success") 
	 { 
	 var resultSet = JSON.parse(response); 
	 if (resultSet.status.trim() == "success") 
	 { 
	 $("#alertSuccess").text("Successfully saved."); 
	 $("#alertSuccess").show();
	 $("#divItemsGrid").html(resultSet.data); 
	 } else if (resultSet.status.trim() == "error") 
	 { 
	 $("#alertError").text(resultSet.data); 
	 $("#alertError").show(); 
	 } 
	 } else if (status == "error") 
	 { 
	 $("#alertError").text("Error while saving."); 
	 $("#alertError").show(); 
	 } else
	 { 
	 $("#alertError").text("Unknown error while saving.."); 
	 $("#alertError").show(); 
	 } 
	 $("#hidItemIDSave").val(""); 
	 $("#NewFundf")[0].reset(); 
}
	
	function onItemDeleteComplete(response, status)
	{ 
	if (status == "success") 
	 { 
	 var resultSet = JSON.parse(response); 
	 if (resultSet.status.trim() == "success") 
	 { 
	 $("#alertSuccess").text("Successfully deleted."); 
	 $("#alertSuccess").show();
	 $("#divItemsGrid").html(resultSet.data); 
	 } else if (resultSet.status.trim() == "error") 
	 { 
	 $("#alertError").text(resultSet.data); 
	 $("#alertError").show(); 
	 } 
	 } else if (status == "error") 
	 { 
	 $("#alertError").text("Error while deleting."); 
	 $("#alertError").show(); 
	 } else
	 { 
	 $("#alertError").text("Unknown error while deleting.."); 
	 $("#alertError").show(); 
 } 
}

</script>

</head>

<body>

	<div class="row" style="padding-top: 10px; padding-right: 50px; padding-left: 50px;">
		<div class="col">
			<div style="background-color: #197dff; border-radius: 5px;">
	        	<h1 style="color: rgb(251, 251, 251); padding-left: 20px;">Fund Management</h1>
			</div>
		</div>
	</div>
	
	<div class="row"style="padding-top: 10px; padding-right: 50px; padding-left: 100px;">
		<div class="col" style="border-style: solid; border-color: #197dff;">
			
        	<form style="height: 450.525px;" action="InsertFund.jsp" method="post" id="NewFundf">
             	 <div class="form-row">
				 	<div class="col">
						<div class="form-row">
							<div class="col">
									<div style="padding-top: 10px;">
                                        <!--  <label for="fname1">Id:</label> -->
                                         <input type="text" id="fundidf" name="ID" class="form-control" placeholder="id:" style="border-color: #197dff;" required>
  									</div>
  									<div style="padding-top: 10px;">
                                          <!-- <label for="fname2">Title:</label> -->
                                          <input type="text" id="fname2" name="Title" class="form-control" placeholder="Title" style="border-color: #197dff;" required>
                                    </div>
  									<div style="padding-top: 10px;">
                                            <!--<label for="fname6">Released Date:</label> -->
                                           <input type="text" id="fname6" name="Relesed_Date" class="form-control" placeholder="Released Date" style="border-color: #197dff;" required>
  									</div>
  									<div style="padding-top: 10px;">
                                    	   <!-- <label for="fname7">Expire Date:</label> -->
                                           <input type="text" id="fname7" name="Expire_Date" class="form-control" placeholder="Expire Date" style="border-color: #197dff;" required>
  								     </div>
  								     <div style="padding-top: 10px;">
                                           <!-- <label for="lname3">Type of Research:</label> -->
                                           <input type="text" id="lname3" name="Type_of_Reserch" class="form-control" placeholder="Type of Research" style="border-color: #197dff;" required>
  									</div>
  									<div style="padding-top: 10px;">
                                 		   <!--<label for="lname4">Announcement type:</label> -->
                                  		  <input type="text" id="lname4" name="Anoucement_type" class="form-control" placeholder="Announcement type" style="border-color: #197dff;" required>
                                  	</div>
                                  	<div style="padding-top: 10px;">
                                     	   <!--<label for="lname5">Purpose of funding:</label> -->
                                          <input type="text" id="lname5" name="Purpose_of_funding" class="form-control" placeholder="Purpose of funding" style="border-color: #197dff;" required>
  									</div>
  									<div style="padding-top: 10px;">
                                          <!-- <label for="lname5">Applicant Instruction:</label> -->
                                         <input type="text" id="lname6" name="Applicant_Instruction" class="form-control" placeholder="Applicant Instruction" style="border-color: #197dff;" required>
                                    </div>
  									<div style="padding-top: 10px;padding-bottom: 10px;">
                                            <input class="btn btn-primary" id="NewFundii" type="button" value="Save">
                                           <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
                                           <br>
                                    </div>
                                    <br>
                              
	                           </div>
							</div>
						</div>
			 		</div>
       		 </form>
        </div>
      
		<div class="col">
			<div style="padding-top: 100px;">
				<img src="Image/undraw_profile_6l1l.png"style="width: 500px; padding-left: 60px;">
	    	</div>
		</div>
	</div>
	<br>
	<div id="alertSuccess" class="alert alert-success">
		<!--  <% out.print(session.getAttribute("statusMsg")); %>-->
	</div>
	<div id="alertError" class="alert alert-danger"></div>
	
	  <br><br>
	<div class="row" id="divItemsGrid" style="padding-top: 10px; padding-right: 50px; padding-left: 50px;border-style: solid; border-color: #197dff;">
		<% 
			Fund_Management obj = new Fund_Management();
			out.print(obj.readFunds());
		
   	     %><br>
   	 </div>
	<br><br>
  
</body>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</html>