json.array!(@things) do |thing|
  json.extract! thing, :id, :owner_id, :category_id, :source, :source_id, :source_url, :asset_id, :name, :creator, :price, :description, :personal_story, :borrow_everyone, :borrow_groups, :borrow_friends
  json.url thing_url(thing, format: :json)
end
