json.array!(@reminder_items) do |i|
  json.id i.id
	json.allDay false
	json.editable true
  json.title "reminder"+i.name 
	json.start i.set_time
	json.url item_url(i.id)
	json.backgroundColor 'red'
end
