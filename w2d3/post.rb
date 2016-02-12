class Post

  attr_accessor :title, :url, :points, :item_id, :comments

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  # returns all the comments associated with a particular post.

  # takes a Comment object as its input and adds it to the comment list.
  def add_comment(comment)
    @comments << comment
  end
end