require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(File.open('post.html'))

def extract_usernames(doc)
  doc.search('.comhead > a:first-child').map do |element|
    element.inner_text
  end
end

def extract_title(doc)
  doc.css('title').text
end

def extract_url(doc)
  href = doc.search('.age > a:first-child').map { |link| link['href'] }.first
  post_url = "https://news.ycombinator.com/"
  post_url << href
end

def extract_points(doc)
  doc.search('.subtext > span:first-child').map { |span| span.inner_text}
end

def extract_item_id(doc)
  post_id = doc.search('.age > a:first-child').map { |link| link['href'] }.first
  post_id[/\d+/].to_i
end

def extract_comment(doc)
  comments = doc.search('.comment > span').map { |comment| comment.inner_text}
  comments.size
end

def extract_author(doc)
  author = doc.search('.comhead > a:first-child').map { |writer| writer.inner_text}
  author.shift
  author.size
end

def extract_days_ago(doc)
  days = doc.search('.age > a:first-child').map { |day| day.inner_text[/\d+/].to_i }
  days.shift
  days.size
end

puts extract_comment(doc)
puts extract_author(doc)
puts extract_days_ago(doc)

# url = 'http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html'
# html = open(url)
# puts html.read

# puts doc.search('.subtext > span:first-child').map { |span| span.inner_text}
# puts doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
# puts doc.search('.title > a:first-child').map { |link| link.inner_text}
# puts doc.search('.title > a:first-child').map { |link| link['href']}
# puts doc.search('.comment > font:first-child').map { |font| font.inner_text}