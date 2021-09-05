json.array!(@events) do |event|
  json.id event.id
  json.start event.start
  json.end event.end
  json.title event.place
end