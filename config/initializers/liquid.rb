template_path = Rails.root.join('app/views/')
Liquid::Template.file_system = Liquid::LocalFileSystem.new(template_path) 