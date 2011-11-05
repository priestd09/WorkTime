(function($)
{

	
	var 
		wrapper,
		employee = 0,
		shift = 0,
		skill = 0
	;
	
	var sendToSchedule = function()
	{
	
		$.ajax(
		{
     		type: "POST",
		    url: "/worktime/index.cfm/business/addEmployeeShift" + "?employeeid=" + employee +"&skillid=" + skill + "&shiftid=" + shift, // References "/say/hello?format=json"
		    dataType: "json"
		});
		location.reload(true);
	};

	var init = function()
	{
		wrapper = $('#wrapper');
	
		$(".draggEmp").draggable(
		{
			start: function(event, ui)
			{
				var that = $(this);
				employee = that.attr('employeeid');
				skill = that.attr('skillid'); 
			},
			revert: true});
		
		$('.cDay').droppable(
		{
			
			drop: function(event, ui)
			{				
				var that = $(this);
				console.log(that.attr('data'));
				shift = that.attr('data');
				sendToSchedule();
			},
			hoverClass: 'shit'
		
		});
	};

	$(document).ready(function()
	{

		init();

	

	});

})(jQuery)