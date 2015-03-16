json.array!(@apply_records) do |apply_record|
  json.extract! apply_record, :id, :personcategory, :item, :timelimit, :artcategory, :organization, :state
  json.url apply_record_url(apply_record, format: :json)
end
