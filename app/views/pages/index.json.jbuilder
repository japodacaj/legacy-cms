	json.array!(@pages) do |page|
	  json.name page.name
	  json.url page_path(page, format: :html)
	end
