json.array!(@things) do |thing|
  json.extract! thing, :id, :member_id, :category_id, :source, :source_id, :source_url, :asset_id, :name, :creator, :price, :description, :story, :borrow_everyone, :borrow_circles, :borrow_friends
  json.url thing_url(thing, format: :json)
end
