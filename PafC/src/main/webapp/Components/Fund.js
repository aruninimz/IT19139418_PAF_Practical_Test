$(document).ready(function()
		{
			if ($("#alertSuccess").text().trim() == "")
			{
				$("#alertSuccess").hide();
			}
			$("#alertError").hide();
		});

//SAVE ============================================
$(document).on("click", "#NewFund", function(event)
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
	$("#NewFundf").submit();
});

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	$("#fundidf").val($(this).closest("tr").find('td:eq(0)').text());
	$("#fname2").val($(this).closest("tr").find('td:eq(1)').text());
	$("#fname6").val($(this).closest("tr").find('td:eq(2)').text());
	$("#fname7").val($(this).closest("tr").find('td:eq(3)').text());
	$("#lname3").val($(this).closest("tr").find('td:eq(4)').text());
	$("#lname4").val($(this).closest("tr").find('td:eq(5)').text());
	$("#lname5").val($(this).closest("tr").find('td:eq(6)').text());
	$("#lname6").val($(this).closest("tr").find('td:eq(7)').text());
});


// CLIENT-MODEL================================================================
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