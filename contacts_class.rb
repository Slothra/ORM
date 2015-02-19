class Contact < ActiveRecord::Base
	# attr_accessor :id, :firstname, :surname, :email 
	validates :email, uniqueness: true

	def to_s
		puts "#{firstname} #{surname} (#{email})"
	end
end


	# def initialize(firstname = nil, surname = nil, email = nil)
	# 	@id = id
	# 	@firstname = firstname
	# 	@surname = surname
	# 	@email = email
	# end

	# def save
	# 	if @id 
	# 		Contact.connection.exec( "UPDATE contacts 
	# 			SET firstname='#{@firstname}', surname='#{@surname}', email='#{@email}'
 #  			WHERE id=#{@id};" )
	# 	else 
	# 		Contact.connection.exec( 
	# 			"INSERT INTO contacts (firstname, surname, email)
 #  			VALUES ('#{@firstname}', '#{@surname}', '#{@email}')" )
	# 	end
	# end

	# def check(email_check)
	# 	Contact.connection.exec( "SELECT email FROM contacts WHERE email = '#{email_check}';" ) do |records|
	# 		records.each do |record|
	# 			unless record['email'] == email_check
	# 			else
	# 				true
	# 			end
	# 		end
	# 	end
	# end

	# def destroy(index)
	# 	connection.exec( "DELETE FROM contacts WHERE id = #{index};" )
	# end

	#Class Methods

	# def self.connection
	# 	return @conn if @conn
	# 	@conn = PG.connect( 
	#   dbname: 'd8v7j6nchqea2e',
	#   host: 'ec2-107-22-249-138.compute-1.amazonaws.com',
	#   port: 5432,
	#   user: 'zeujfszwhckanp',
	#   password: 'TX0eDVUe196jaAk8dVeCfTyra3'
	# 	)
	# end

	# def self.extract(index)
	# 	connection.exec("SELECT * FROM contacts WHERE id = '#{index}';" ) do |records|
	# 		records.each do |record|
	# 			extracted = Contact.new(record['firstname'],record['surname'],record['email'])
	# 			extracted.id = record['id']
	# 			return extracted
	# 		end
	# 	end
	# end

	# def self.destroy(index)
	# 	connection.exec( "DELETE FROM contacts WHERE id = #{index};" )
	# end

	# def self.all
	# 	connection.exec( "SELECT * FROM contacts;" ) do |records|
	#   	records.each do |record|
	#     	puts record
	#     end
	#   end
	# end

	# def self.find(index)
	# 	connection.exec( "SELECT * FROM contacts WHERE id = #{index};" ) do |records|
	# 		records.each do |record|
	# 			puts record
	# 			# return temp_contact
	# 		end
	# 	end
	# end

	# def self.find_all_by_surname(surname)
	# 	connection.exec( "SELECT * FROM contacts WHERE surname = '#{surname}'") do |records|
	# 		records.each do |record|
	# 			puts record.inspect
	# 		end
	# 	end
	# end

# 	def self.find_all_by_firstname(firstname)
# 		connection.exec( "SELECT * FROM contacts WHERE firstname = '#{firstname}'") do |records|
# 			records.each do |record|
# 				puts record.inspect
# 			end
# 		end
# 	end
# end








