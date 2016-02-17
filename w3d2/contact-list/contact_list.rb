require_relative 'contact'
require_relative 'phone'
require 'pry'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
#binding.pry
# Contact.connection
class ContactList

  # Implement user interaction. This should be the only file where you use `puts` and `gets`.
  command = ARGV[0]
  param = ARGV[1] 
  
  case command
  when "list"
    puts Contact.all
  when "show"
    unless param.nil? || param.empty?
      puts Contact.find(param)
    else
      puts "Please input a param"
    end
  when "new"
    puts "Please enter your full name"
    full_name = STDIN.gets.chomp
    
    puts "Please enter your email"
    email = STDIN.gets.chomp
    contact_id = Contact.create(full_name, email)
    puts "#{full_name} is created"

    last_number = false
    begin
      puts 'Do you want to add a number to this contact YES/NO'
      reply = STDIN.gets.chomp

      numbers = []

      if reply == 'YES'
        puts "Please add a number to this contact"
        numbers << STDIN.gets.chomp
        Phone.add_number(numbers, contact_id)
      else
        last_number = true
      end
    end while !last_number
    
  when "search"
    unless param.nil? || param.empty?
      contact = Contact.search(param)
    else
      puts "Please input a param"
    end
  when "update"
    unless param.nil? || param.empty?
      the_contact = Contact.find(param)

      if the_contact == "not found"
        puts "ID #{param} is not in the database"
      else
        puts "Please change information for #{the_contact}"
        puts "Please update the name"
        new_name = STDIN.gets.chomp

        puts "Please update the email"
        new_email = STDIN.gets.chomp

        the_contact.name = new_name
        the_contact.email = new_email
        the_contact.save
        puts "It is updated"
      end
    else
      puts "Please input a param"
    end
  when "destroy"
    unless param.nil? || param.empty?
      #TODO
      the_contact = Contact.find(param)
      the_contact.destroy
      puts "Information for #{the_contact} has been deleted"
    else
      puts "Please input a param"
    end
  else
    puts "Here is a list of available commands:"
    puts "  new     - Create a new contact"
    puts "  list    - List all contacts"
    puts "  show    - Show a contact"
    puts "  search  - Search contacts using a parameter"
    puts "  update  - Update a specific id"
    puts "  destroy - Delete a specific id"
  end

end
