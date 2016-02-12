require_relative 'post'
require_relative 'comment'
require_relative 'scraper'

doc = Nokogiri::HTML(File.open('post.html'))

# variables for Post object
title = extract_title(doc)
url = extract_url(doc)
points = extract_points(doc)
post_id = extract_item_id(doc)

# variables for Comment object
authors = extract_author(doc)
comments = extract_comment(doc)
days_ago = extract_days_ago(doc)

first_post = Post.new(title, url, points, post_id)

# create a loop to create a new Comment object
[authors, comments, days_ago].transpose.each do |author, comment, day|
  comment_object = Comment.new(author,comment,day)
  first_post.add_comment(comment_object)
end

# puts first_post.title
puts first_post.comments[0].content