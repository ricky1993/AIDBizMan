json.array!(@art_works) do |art_work|
  json.extract! art_work, :id, :name, :date, :place, :author, :image, :describe, :apply_record
  json.url art_work_url(art_work, format: :json)
end
