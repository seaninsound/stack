class AddIpAddressToVotes < ActiveRecord::Migration
  def change
  	#add a field to stop IP address voteageddon
  	add_column :votes, :ip_address, :string
  	
  end
end
