require 'open-uri'
require 'nokogiri'

# methods for Post objects
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


# methods for Comment objects
def extract_comment(doc)
  comments = doc.search('.comment > span').map { |comment| comment.inner_text}
end

def extract_author(doc)
  author = doc.search('.comhead > a:first-child').map { |writer| writer.inner_text}
  author.shift
  author
end

def extract_days_ago(doc)
  days = doc.search('.age > a:first-child').map { |day| day.inner_text[/\d+/].to_i }
  days.shift
  days
end