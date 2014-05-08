json.array!(@wishes) do |wish|
  json.extract! wish, :id, :member_id, :thing_id, :description, :story
  json.url wish_url(wish, format: :json)
end
