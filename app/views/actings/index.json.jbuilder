json.array!(@actings) do |acting|
  json.extract! acting, :id, :user_id
	json.start acting.start
	json.end acting.stop
  json.url acting_url(acting, format: :html)
end
