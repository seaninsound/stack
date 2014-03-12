#this is a task for grabbing code from reddit

task scrape_reddit: :environment do

	puts "hiya! i'm about to scrape reddit"

#this grabs the source code of reddit
	@raw_html = HTTParty.get("http://www.reddit.com")

#parse raw html to real html

	@real_html = Nokogiri::HTML(@raw_html)

#in css we would style up the title links using something like div#siteTable a.table

	@real_html.css("div#siteTable a.title").each do |link|

			#this is similar to the stories/index view
			#to get the html link to <a href=www..>THE LINK</a>

			@story = Story.new
			@story.title = link.text
			@story.link = link[:href]
			@story.save 
	
	end

end