require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require "pry"
require 'sinatra/simple-authentication'
require 'rack-flash'

Sinatra::SimpleAuthentication.configure do |c|
	c.use_password_confirmation = true
end

use Rack::Flash, :sweep => true

register Sinatra::SimpleAuthentication


require_relative "./models/user"
require_relative "./models/zing"
require_relative "./models/video"


enable :sessions


get "/" do
	login_required
	@video = Video.first
  erb :index
end

get '/login' do
  erb :login
end

get '/videos/:video_id' do
	@video = Video.find(params[:video_id])
	erb :video_show

end

get "/zings/:user_id" do
  #getting user id
  @user = User.find(params[:user_id])
  #getting the users zings
  @user_zings = Zing.where(user_id: @user)
  #getting all the video ids form the users zings
  	@zing_videos = @user_zings.pluck(:video_id)
  		# <% @zing_vdeos.each do |zing| %>
  		# <% video = Video.find(zing.video_id) %>
  			# <video src="<%=video.video.url%>">
  		 #  <% end %>

  erb :user_zings

end






post '/zing' do 
	@current_user_id = session[:user_id]
	@current_video_id = Video.find(params[:video_id])
	Zing.create(user_id: @current_user_id, video_id: @current_video_id)
end	

# post "/login" do
#   user = User.find_by(:email => params[:email])
#   if user && user.authenticate(params[:password])
#     session[:user_id] = user.id
#     redirect('/users')
#   else
#     @errors << "Invalid email or password. Try again!"
#     erb :login
#   end
# end


get "/session/logout" do
  session.clear
  redirect('/')
end

