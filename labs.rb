module Spina
  module LabsTheme
    include ::ActiveSupport::Configurable

    config_accessor :title, :page_parts, :view_templates, :layout_parts, :custom_pages, :plugins, :structures

    self.title = 'Labs'

    self.page_parts = [
      # Labs Page parts
      { name: 'excerpt', title: 'Excerpt', page_partable_type: 'Spina::Text' },
      { name: 'content', title: 'Content', page_partable_type: 'Spina::Text' },
      { name: 'thumbnail', title: 'Thumbnail', page_partable_type: 'Spina::Photo' }
    ]

    self.view_templates = {
      'homepage' => { title:'Homepage', page_parts: %w(excerpt content) },
      'show' => {
        title: 'Default Post', description: 'A default post page', usage: 'Can be used for a blog post',
        page_parts: %w(excerpt content thumbnail)
      },
      'page' => { title:'Custom Page', page_parts: %w(content) }
    }

    self.custom_pages = [
      { name: 'homepage', title: 'Home', deletable: true, view_template: 'homepage' }
    ]

  end
end

theme = Spina::Theme.new
theme.name = 'Labs'
theme.config = Spina::LabsTheme.config
Spina.register_theme(theme)
