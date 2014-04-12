json.array!(@mers) do |m|
  json.id m.id
	json.allDay false
  json.title m.text 
	json.start m.created_at
	json.url mer_url(m.id)
	json.backgroundColor 'green'
end