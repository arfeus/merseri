$(document).ready(function () {		

		// page is now ready
 
    // datapicker to select date
    $( "#datepicker" ).datepicker({
    		dateFormat: "yy-mm-dd"
    });
		
    // fullcalendar
		
    $('#calendar').fullCalendar({
        // put your options and callbacks here

				header: {
				        left: 'prev,next today',
				        center: 'title',
				        right: 'month,agendaWeek,agendaDay'
				    },	
						eventTextColor: 'black',
						eventBorderColor: 'black',
				
						eventSources: [
								'/actings.json',
								'/mers.json',
								'/items.json'
						],
										
																	
						
           dayClick: function() {
							
              
							 
							$("#dialog").dialog({
							            
							                title: "New",
															height: 100,
															width: 350,
							                modal: true,
					                    buttons: {
																
						                    "Start activity": function () {   
										              var url = 'http://localhost:3000/action';
										 							window.location = url;             
						                    },
							                  "Create a note": function () {     
											            var url = 'http://localhost:3000/mers/new';
											 					  window.location = url;      
							                  },
																CLOSE: function() {
																	$(this).dialog('close');
															  }
							                }
							            });
       
	          	
					 },			 
				
			});

});