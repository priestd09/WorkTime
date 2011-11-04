// 
// Your code comments and name
// 

(function($){

/* 	var userID; */
	
	/*
var getTasks = function(){
		return $.ajax({
			url: 'xhr/get_tasks.php',
			type: 'get',
			dataType: 'json',
			success: function(response){
				// add tasks to the page
			}
		});
	};
	
	
	
	var loadLanding = function(){
		$.get('templates/landing.html', function(html){
			// swap html into the page
			$(html).find("#title").template('land')
			$.tmpl("land",html).appendTo("#container")
		});
	};
	
*/

var dra = $("#dropEmps p");

var dra2 = $(".pSkill");
var a = $(".emploMove").live('click',function(){

/* dra.draggable(); */
		alert('me')

/*

dra2.droppable({
	drop: function(){
		alert('me')
	}
		});
*/

})
	
	
	


$(function() {

	var val=$( "#dropEmps p ,this" ).draggable().prev().attr("id","newId");
	$( ".pSkill" ).droppable({
			drop: function( event, ui ) {
				$( this ).find( ".emploMove:first" ).html( val );
						
			}
		});
	});





	
	
})(jQuery);




