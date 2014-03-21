json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :user_id, :set_time, :alarm
  json.url item_url(item, format: :json)
end
