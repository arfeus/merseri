json.array!(@mers) do |m|
  json.id m.id
	json.allDay true
  json.title m.text 
	json.start m.created_at
	json.url mer_url(m, format: :html)
	json.backgroundColor 'lightblue'
end