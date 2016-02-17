require 'csv'
require 'pry'
require 'pg'

# Represents a person in an address book.
class Contact

  attr_accessor :id, :name, :email

  def initialize(id = nil, name, email)
    # Assign parameter values to instance variables.
    @id = id
    @name = name
    @email = email
  end

  def self.connection
    connection = PG.connect(
      host: 'localhost',
      dbname: 'contact',
      user: 'development',
      password: 'development'
    )
    connection
    #connection.close
  end

  def to_s
    "#{id}: #{name} (#{email})"
  end

  def persisted?
    !id.nil?
  end

  def save
    if persisted?
      Contact.connection.exec_params("UPDATE contacts SET name = $1, email = $2 WHERE id = $3::int;", [@name, @email, @id]) 
    else
      result = Contact.connection.exec_params('INSERT INTO contacts (name, email) VALUES ($1, $2) RETURNING id;', [name, email])
      @id = result[0]["id"]
    end
  end

  def destroy
    Contact.connection.exec_params("DELETE FROM contacts WHERE id = $1::int;", [id]) 
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # Return an Array of Contact instances made from the data in 'contacts.csv'.
      all_contacts = []

      result = connection.exec('SELECT * FROM contacts;')

      result.each do |contact|
        all_contacts << Contact.new(contact["id"], contact["name"], contact["email"])
      end

      all_contacts << '---'
      all_contacts << "#{all_contacts.length-1} records total"
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      new_contact = Contact.new(name, email) 
      new_contact.save
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      contact_find = []

      result = connection.exec('SELECT * FROM contacts WHERE id = $1::int;', [id])
      result.each do |found|
        contact_find << Contact.new(found["id"], found["name"], found["email"])
      end

      if contact_find.empty?
        "not found"
      else
        contact_find[0]
      end
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      contact_find = []

      result = connection.exec("SELECT * FROM contacts WHERE name like '%' || $1 || '%' OR email like '%' || $1 || '%';", [term])
      result.each do |found|
        contact_find << Contact.new(found["id"], found["name"], found["email"])
      end
      if contact_find.empty?
        "not found"
      else
        contact_find << '---'
        contact_find << "#{contact_find.length-1} records total that has phone number"
      end

    end

  end

end
