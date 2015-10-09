module ApplicationHelper

	def markdown(markdown)
		renderer = Redcarpet::Render::HTML.new
	    extensions = {fenced_code_blocks: true, hard_wrap: true, filter_html: true, autolink: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true}
	    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
	    (redcarpet.render markdown).html_safe
	end
end
