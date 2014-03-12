class StoriesController < ApplicationController

	#to add a page to my site
	#let's add the index page
	def index 
		#in here, lives all the code for the index page
		@username = "sean"

		#to make a list we use square brackets
		#@stories = ["Google", "Facebook", "Twitter", "Lincoln"]

		#get data from database
		#@stories = Story.order("votes_count desc, created_at desc") 

		#if the URL has extra params, mainly sort is recent
		#order by created_at desc
		#else do the usual stuff

		#if is_featured show on featured page

		if params[:sort] == "recent"
			#sort by most recent if true
			@stories = Story.order("created_at desc")

		elsif params[:filter] == "featured" 

			#just get the featured ones
			@stories = Story.where(is_featured: true).order("title asc")

		else 
			#sort by most voted
			@stories = Story.order("votes_count desc, created_at desc")
		end

	end
	
	#show me an individual story page
	def show
		#params [:id] is from URL  e.g. /stories/7
		@story = Story.find(params[:id])
	end

	#this is going to "add a new story form" page
	def new
		#make @story be a blank story, to be filled in
		@story = Story.new
	end

	#new and create work together as a pair
	#the create action actually adds to the database

	def create
		#make @story be a blank story but with firleds filled in
		@story = Story.new(story_params)

		#save this story to the database IF validations pass
		#if they don't pass show the form with Errors
		if @story.save


			#add a notification to let them know it has been saved to the database
			flash[:success] = "Well done, you've won the internet!"

			#let's make this go back to the homepage
			redirect_to root_path

		else 
			#if the story doesn't save, do this
			#show the new.html.erb form with errors
			render "new"

		end

	end

	#show the edit form for a story

	def edit
		#find the story based on url
		@story = Story.find(params[:id])

	end


	def update
		@story = Story.find(params[:id])
		
		#update the record with the form data IF IT VALIDATES
		if @story.update(story_params)

			flash[:success] = "Bravo! Story has been updated"

			#let's make this go back to the story page
			redirect_to story_path(@story)


		else
			#if it doesn't update show the edit for with errors
			render "edit"

		end
	end

	#lets destroy this story

	def destroy
		@story = Story.find(params[:id])
		@story.destroy
		flash[:success] = "It's gone! You have successfully deleted this."

		redirect_to root_path 
	end

	#I want to get the right data from the form
	def story_params
		#only get the title, description and link
		params.require(:story).permit(:title, :description, :link) 

	end

end
