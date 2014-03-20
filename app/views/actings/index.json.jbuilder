json.array!(@actings) do |acting|
  json.id acting.id
	json.allDay false
  json.title Activity.find(acting.activity_id).name 
	json.start acting.start
	json.end acting.stop
  json.url acting_url(acting, format: :html)
end
