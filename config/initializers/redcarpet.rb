require 'redcarpet'

def markdown
  @parser ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    highlight: true, quote: true, strikethrough: true,
    tables: true, autolink: true, disable_indented_code_blocks: true,
    fenced_code_blocks: true)
end
