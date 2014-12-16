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

enable :sessions


get "/" do
	login_required
  erb :index
end


get "/zings" do
  erb :zing
end


get '/login' do
  erb :login
end

post "/login" do
  user = User.find_by(:email => params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect('/users')
  else
    @errors << "Invalid email or password. Try again!"
    erb :login
  end
end

get '/sign_up' do
  erb :sign_up
end

post "/sign_up" do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect('/users')
  else
    @user = user
    erb :sign_up
  end
end

get "/session/logout" do
  session.clear
  redirect('/')
end

