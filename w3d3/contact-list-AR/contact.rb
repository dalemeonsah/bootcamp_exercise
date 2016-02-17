require 'pry'

# Represents a person in an address book.
class Contact < ActiveRecord::Base

  def to_s
    "#{id}: #{name} (#{email})"
  end

  
end
