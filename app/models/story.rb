class Story < ActiveRecord::Base

	#creating the relationship between story and comment
	has_many :comments
	has_many :votes

	# lets make sure our data in our database is exactly what we want it to be

	validates :title, presence: true, 
		length: { minimum: 5, message: "Your entry needs to be more than 5 charecters" }
	validates :link, presence: true, uniqueness: true 

	# validates() is a method

	# :title is a symbol because it doesn't change within the code

	# { presence: true } is a hash - this line does the same as line 6

	# presence is true - basically means the information is required
	# uniqueness true - means it has to be unique


end
