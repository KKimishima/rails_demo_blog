module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  APP_NAME = 'KKimishimaの情報発信基地'

  class BlogRender < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def md_to_html(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      space_after_headers: true,
    }

    extensions = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
    }

    renderer = BlogRender.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
