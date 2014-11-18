class StaticPagesController < ApplicationController

  layout 'static', only: [:home]

	def home

  end

  def contact
  end

  def site_map
  end

  def directory
  end
  
  private

end
