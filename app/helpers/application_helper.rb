module ApplicationHelper

	def	dynamic_page_link(page)
		if page.url?
			page.url
		else
			page_path(page)
		end
	end

	def liquidize(content, arguments)
		raw(Liquid::Template.parse(content).render(arguments, :filters => [LiquidFilters]))
	end

	def site_root(site)
    if site.alias?
    	root_path(site.alias.name)
    else 
      root_path(subdomain: site.slug)
    end
	end

end
