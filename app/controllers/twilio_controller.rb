class TwilioController < ApplicationController
	
# set up a client to talk to the Twilio REST API
	
	
	def index
		account_sid = 'ACd481960a695a3dff668f02798df70379'
	auth_token = 'b2596cc4d179569b9f572ca6a85d3d37'
 
		@client = Twilio::REST::Client.new account_sid, auth_token
	@call = @client.account.calls.create(
  :from => '+919814314233',   # From your Twilio number
  :to => '+919988890100',    # To any number
  # Fetch instructions from this URL when the call connects
  :url => 'https://dl.dropboxusercontent.com/u/72366671/twilio-test.xml'

)
	
end

	
	def callback
	debugger
	Twilio::TwiML::Response.new do |r|
	r.Dial '+919814314233' ### Connect the caller to Koko, or your cell
	r.Say 'The call failed or the remote party hung up. Goodbye.'
	end.text

	end


end
