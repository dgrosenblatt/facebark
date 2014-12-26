module ApplicationHelper
  def render_markdown(text)
    markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, filter_html: true)
    markdown.render(text).html_safe
  end
end
