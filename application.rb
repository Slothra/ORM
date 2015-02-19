#application


class Application
	def initialize
		@arg1=''
	end

	def clear
		@arg1 = ''
	end

	def get(string)
		puts "Please enter the #{string}:"
		STDIN.gets.chomp
	end

	def finder
		puts "Find by first name, surname, or id?"
		input = STDIN.gets.chomp
		case input
		when "first name"
			input = get("first_name")
			Contact.find_all_by_firstname(input)
		when "surname"
			input = get("surname")
			Contact.find_all_by_surname(input)
		when "id"
			input = get("id").to_i
			Contact.find(input)
		else
			puts "Error"
			finder
		end
	end

	def self.help_options
		puts "Please enter one of the following commands:"
		puts "new     - create a new contact"
		puts "find    - find a contact or contacts"
		puts "list    - list all contacts"
		puts "id      - search for an id"
		puts "update  - update an id"
		puts "delete  - deletes an entry"
		puts "quit    - exits program"
	end

	def self.run
		case @arg1
		when "new"
			clear
			input1 = get("first_name")
			input2 = get("surname")
			input3 = get("email")
			new_contact = Contact.new(input1,input2,input3)
			if new_contact.check(input3)
				new_contact.save
				puts "Created"
			end
		when "find"
			clear
			finder
		when "list"
			clear
			Contact.all
		when "id" 
			clear
			input = get("id")
			Contact.find(input)
		when "quit"
			abort("Goodbye")
		when "update"
			clear
			input = get("id")
			updated_contact = Contact.extract(input)
			updated_contact.firstname = get("first_name")
			updated_contact.surname = get("surname")
			updated_contact.save 
			puts "Updated"
		when "delete"
			clear
			input = get("id")
			Contact.destroy(input)
			puts "Deleted"
		else
			help_options
			@arg1 = STDIN.gets.chomp
		end
		Application.run
	end
end

#gets input runs what it can

#new
#list
#find_by_surname
#find_by_firstname
#find_by_id
#delete
#when it has a file you can choose to update it

