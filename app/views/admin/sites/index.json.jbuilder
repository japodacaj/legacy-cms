json.array!(@sites) do |site|
  json.extract! site, :name, :shortname
  json.url site_url(site, format: :json)
end
