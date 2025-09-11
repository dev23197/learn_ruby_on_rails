# test_sanitization.rb
require "action_view"

view = ActionView::Base.new
view.extend ActionView::Helpers::SanitizeHelper

puts "👉 sanitize:"
puts view.sanitize("<b>Hello</b> <script>alert('xss')</script>")

puts "\n👉 sanitize_css:"
puts view.sanitize_css("color: red; position: absolute; behavior: url(hack.js);")

puts "\n👉 strip_links:"
puts view.strip_links("Click <a href='http://example.com'>here</a>")

puts "\n👉 strip_tags:"
puts view.strip_tags("<p>Hello <b>World</b></p>")
