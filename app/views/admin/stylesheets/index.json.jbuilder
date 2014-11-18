json.array!(@stylesheets) do |stylesheet|
  json.extract! stylesheet, :id, :name, :active, :site_id
  json.url stylesheet_url(stylesheet, format: :json)
end
