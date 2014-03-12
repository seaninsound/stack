class Comment < ActiveRecord::Base

	#join comment with stories

	belongs_to :story

	#make sure comment isn't blank
	validates :body, presence: true

end
