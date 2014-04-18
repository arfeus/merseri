json.array!(@actings) do |a|
  json.id a.id
	json.allDay false
  json.title Activity.find(a.activity_id).name 
	json.start a.start
	json.end a.stop
  json.url acting_url(a)
	json.backgroundColor 'lightblue'
	json.description "<p>This is just a test event for source 1.<\/p><p>Nothing to see really.<\/p>"
end
