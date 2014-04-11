json.array!(@actings) do |a|
  json.id a.id
	json.allDay false
  json.title Activity.find(a.activity_id).name 
	json.start a.start
	json.end a.stop
  json.url acting_url(a, format: :html)
	json.backgroundColor 'green'
end
