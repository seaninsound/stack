class VotesController < ApplicationController

#don't require a create method because I don't need a form
#either i vote or I don't

	def create
		#find the story to vote on
		@story = Story.find(params[:story_id])

		#make a new vote on that story with users' IP address
		@vote = @story.votes.new(ip_address: request.ip)

		#save the vote
		if @vote.save
			#let the user know
			flash[:success] = "You Have Thisd This"
		else 
			flash[:error] = "You can't vote more than once. Sorry."		
		end

		#let the user know
		
		#go back to the story page
		redirect_to story_path(@story)

	end

end
