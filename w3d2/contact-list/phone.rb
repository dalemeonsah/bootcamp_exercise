require 'csv'
require 'pry'
require 'pg'

# Represents phone
class Phone
  attr_reader :number, :contact_id

  #contact_id is FK, referencing id from Contact class

  def initialize(number, contact_id)
    @number = number
    @contact_id = contact_id
  end

  def save_number
    result = Contact.connection.exec_params('INSERT INTO phone (number, contact_id) VALUES ($1, $2) RETURNING id;', [number.to_i, contact_id.to_i])
    @id = result[0]["id"]
  end

  class << self

    def add_number(numbers, contact_id)
      numbers.each do |number|
        new_number = Phone.new(number, contact_id) 
        new_number.save_number
      end
    end

  end
end