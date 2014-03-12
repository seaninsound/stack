class CommentsController < ApplicationController

	#this controller only nees new and create
	#because we don't want users to edit, delete or view list

	def new
		#which story are we thalking about
		#and how to make a new comment

		#we don't want the params[:ID] because this about the comment 
		#not the story

		#we can get the params[:story_id] from the URL


		@story = Story.find(params[:story_id])
		@comment = @story.comments.new

	end

	#actually create the comment on the story
	def create
		#same as in new	
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		#just like story controller
		#show message then redirect
		#if not, show the error page

		if @comment.save
			flash[:success] = "Your comment has been posted"
			redirect_to story_path(@story)
		else 
			render "new"
		end
	end

	#let's make a shortcut for whitelisting form data
	def comment_params
		#params is always sent through with rails
		#make sure there is a comment and stop hackers
		params.require(:comment).permit(:body)

	end

end
