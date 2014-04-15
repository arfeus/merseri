// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require turbolinks
//= require bootstrap
//= require fullcalendar
//= require gcal
//= require_tree .

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
				]
				
				
			});
			
			var date = new Date();
					var d = date.getDate();
					var m = date.getMonth();
					var y = date.getFullYear();
		
					$('#calendar2').fullCalendar({
						header: {
							left: 'prev,next today',
							center: 'title',
							right: 'month,agendaWeek,agendaDay'
						},
						editable: true,
						events: [
							{
								id: 999,
			                    title: 'All Day Event',
								start: new Date(y, m, 1)
							},
							{
								id: 999,
			                    title: 'Long Event',
								start: new Date(y, m, d-5),
								end: new Date(y, m, d-2)
							},
							{
								id: 999,
								title: 'Repeating Event',
								start: new Date(y, m, d-3, 16, 0),
								allDay: false
							},
							{
								id: 999,
								title: 'Repeating Event',
								start: new Date(y, m, d+4, 16, 0),
								allDay: false
							},
							{
								id: 999,
			                    title: 'Meeting',
								start: new Date(y, m, d, 10, 30),
								allDay: false
							},
							{
								id: 999,
			                    title: 'Lunch',
								start: new Date(y, m, d, 12, 0),
								end: new Date(y, m, d, 14, 0),
								allDay: false
							},
							{
								id: 999,
			                    title: 'Birthday Party',
								start: new Date(y, m, d+1, 19, 0),
								end: new Date(y, m, d+1, 22, 30),
								allDay: false
							},
							{
			                    id: 999,
			                    title: 'Click for Google',
								start: new Date(y, m, 28),
								end: new Date(y, m, 29),
								url: 'http://google.com/'
							}
						],
			            eventClick: function(calEvent, jsEvent, view) {
			            id= calEvent.id;

			            $( "#dialog" ).dialog({
			                  resizable: false,
			                  height:200,
			                  width:500,
			                  modal: true,
			                  title: 'Want you want to do?',
			                  buttons: {
			                             CLOSE: function() {
			                                 $("#dialog").dialog( "close" );
			                             },
			                             "DELETE": function() {
			                                //do the ajax request?
			                             }
			                           }
			             });
			       },
					});

});