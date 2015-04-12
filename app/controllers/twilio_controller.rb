class TwilioController < ApplicationController

require 'rubygems' #  
require 'twilio-ruby' 

# Call this function on order and send to all numbers in group
def order_message(name, number, product) 
	# put your own credentials here 
	account_sid = 'AC137a5e22cb853d2e84d7ac091ee43e2e' 
	auth_token = 'a673fa1a91ba226e7e37569be942b2e9' 

	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.messages.create({
		:from => '+12039042563', 
		:to => number, 
		:body => "Thank you, #{name} for ordering #{product}."
	})
end

def success_message(name, number) 
	# put your own credentials here 
	account_sid = 'AC137a5e22cb853d2e84d7ac091ee43e2e' 
	auth_token = 'a673fa1a91ba226e7e37569be942b2e9' 

	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.messages.create({
		:from => '+12039042563', 
		:to => number, 
		:body => "Thanks, #{name} Your payment has been successful."
	})
end

  def submit
  	if params[:q] && params[:w] && params[:e]
  		order_message(params[:q],params[:w],params[:e])
  	end
  end
end
