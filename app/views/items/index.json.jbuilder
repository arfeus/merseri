json.array!(@items) do |i|
  json.id i.id
	json.allDay false
  json.title "reminder"+i.name 
	json.start i.set_time
  json.url item_url(i)
	json.backgroundColor 'red'
end
