class Vote < ActiveRecord::Base

	#let the vote know about the story
	#AND let the story keep track of vote count

	belongs_to :story, counter_cache: true

	#check that IP address is unique
	#scope makes it unique to the story ID
	#if uniqueness was true it would be one vote per website

	validates :ip_address, uniqueness: { scope: :story_id }

end
