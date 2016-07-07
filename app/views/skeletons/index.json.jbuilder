json.array!(@skeletons) do |skeleton|
  json.extract! skeleton, :id, :name, :slug, :account_id
  json.url skeleton_url(skeleton, format: :json)
end
