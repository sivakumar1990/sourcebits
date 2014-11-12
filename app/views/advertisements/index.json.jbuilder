json.array!(@advertisements) do |advertisement|
  json.extract! advertisement, :id, :size, :price
  json.url advertisement_url(advertisement, format: :json)
end
