require 'csv'
require 'pry'

# Represents a person in an address book.
class Contact

  attr_accessor :id, :name, :email

  def initialize(id, name, email)
    # Assign parameter values to instance variables.
    @id = id
    @name = name
    @email = email
  end

  def to_s
    "#{id}: #{name} (#{email})"
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # Return an Array of Contact instances made from the data in 'contacts.csv'.
      contacts = []
      CSV.foreach('contacts.csv') do |row|
        # puts row.inspect
        contacts << Contact.new(row[0], row[1], row[2])
        #Contact.new(row[0], row[1])
      end
      contacts << '---'
      contacts << "#{contacts.length-1} records total"
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      new_contact = Contact.new(create_new_id, name, email) 
      CSV.open('contacts.csv', "a") do |csv|
        csv << [new_contact.id, new_contact.name, new_contact.email]
      end
    end

    def create_new_id
      contact = CSV.read('./contacts.csv')
      #puts contact
      max_id = contact.map{|array|array.first}.max.to_i
      new_id = max_id + 1
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # Find the Contact in the 'contacts.csv' file with the matching id.
      contacts = CSV.read('./contacts.csv')
      contact_find = []
      find_contact = contacts.map do |array| 
        if array[0] == id
          contact_find << Contact.new(array[0], array[1], array[2])
        end
      end 

      if contact_find.empty?
        "not found"
      else
        contact_find << '---'
        contact_find << "#{contact_find.length-1} records total"
      end
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      contacts = CSV.read('./contacts.csv')
      contact_find = []
      find_contact = contacts.map do |array| 
        if array[1].include?(term) || array[2].include?(term)
          contact_find << Contact.new(array[0], array[1], array[2])
        end
      end

      if contact_find.empty?
        "not found"
      else
        contact_find << '---'
        contact_find << "#{contact_find.length-1} records total"
      end

    end

  end

end
