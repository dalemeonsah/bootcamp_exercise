require_relative 'post'
require_relative 'comment'
require_relative 'scraper'
require 'colorize'

class Scraper
  #doc = Nokogiri::HTML(File.open('post.html'))

  url_input = ARGV[0]

  unless ARGV.length != 1
    # variables for Post object
    doc = Nokogiri::HTML(open(url_input))

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

    puts "Post title: #{first_post.title}".red
    puts "Post url is #{first_post.url}".green
    puts "This post has #{first_post.points}".yellow
    puts "Number of comments: #{comments.size}".blue

    #puts first_post.comments[0].content
  else
    puts "please insert a url, use this https://news.ycombinator.com/item?id=7663775"
  end
end