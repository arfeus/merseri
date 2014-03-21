# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

    # page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        # put your options and callbacks here

				header: {
				        left: 'prev,next today',
				        center: 'title',
				        right: 'month,agendaWeek,agendaDay'
				    },
						
				eventColor: 'darkGray',
				eventTextColor: 'black'
						
				events: '/actings.json'
				
    })
