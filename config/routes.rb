Neus::Application.routes.draw do

#Active Admin added its own URLs
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

    #set up all of the URLs for stories controller
    #this is a shortcut for SEVEN different actions

    #REST is a way to alter and view data, the 7 actions are...
    #index, show, new, create, edit, update, destroy
    resources :stories do 
        #inside the story we have a nested resource
        #which is a relationship between stories & comments

        resources :comments

    #inside stories we have another nested resource
    #which is a relationship between stories and votes

        resources :votes
    end
    

    #new_story_path ---> stories#new
    #edit_story_path ---> stories#edit
    #story_path ---> stories#show
    #stories_path ---> stories#index
    
    #new_story_comment_path ---> comments#new
    #editor_story_comment_path ---> comments#edit
    #story_comment_path --> comments#show
    #story_comments_path ---> comments#index


    #to see all of the URLs across the site
    #cancel out of rails server (ctrl-c)
    #and we can type in rake routes

    # set up homtpage to goto the stories controller
    # and show the index page
    root "stories#index"

end
