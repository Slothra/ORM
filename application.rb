class Application
	def initialize
		@arg1=''
	end

	def self.get(string)
		puts "Please enter the #{string}:"
		STDIN.gets.chomp
	end

	def self.clear
		@arg1=''
	end

	def self.finder
		puts "Find by first name, surname, or id?"
		input = STDIN.gets.chomp
		case input
		
		when "first name"
			input = get("first_name")
			if Contact.exists?(firstname: input)
				puts Contact.where(firstname: input).order(:id) 
			else
				puts "None found"
			end
		
		when "surname"
			input = get("surname")
			if Contact.exists?(surname: input) 
				puts Contact.where(surname: input).order(:id) 
			else 
				puts "None found"
			end
		
		when "id"
			input = get("id").to_i
			if Contact.exists?(id: input) 
				puts Contact.find(input)
			else
				puts "Error"
			end
		
		else
			puts "Error"
			Application.finder
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
			Application.clear
			new_contact = Contact.new
			new_contact.firstname = get("first_name")
			new_contact.surname = get("surname")
			input = get("email")
			if Contact.exists?(email: input) 
				new_contact.email = input
				new_contact.save
				puts new_contact
				puts "Created" 
			else 
				puts "Email already taken"
			end

		when "find"
			Application.clear
			Application.finder

		when "list"
			Application.clear
			puts Contact.all.order(:id)

		when "id" 
			Application.clear
			input = get("id")
			if Contact.exists?(id: input) 
				puts Contact.find(input)
			else
				puts "None found"
			end

		when "quit"
			abort("Goodbye")

		when "update"
			Application.clear
			input = get("id")
			updated_contact = Contact.find(input)
			updated_contact.firstname = get("first_name")
			updated_contact.surname = get("surname")
			updated_contact.email = get("email")
			updated_contact.save 
			puts "Updated"

		when "delete"
			Application.clear
			input = get("id").to_i
			contact = Contact.find(input)
			contact.destroy
			puts "Deleted"
		
		else
			help_options
			@arg1 = STDIN.gets.chomp
		end
		Application.run
	end
end

