class Comment

  attr_accessor :author_name, :content, :days_ago

  def initialize(author_name, content, days_ago)
    @author_name = author_name
    @content = content
    @days_ago = days_ago
  end
end