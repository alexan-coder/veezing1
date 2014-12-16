require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require "pry"

# get '/' do 
# 	erb :index
# end

# get '/sign_up'
# 	erb :sign_up
# end

# post '/sign_up'
# 	erb :sign_up
# end

# get '/login'
# 	erb :login
# end

# post '/login'
# 	erb :login
# end

require_relative "./models/user"
require_relative "./models/zing"

enable :sessions

helpers do
  def current_user
    @current_user || nil
  end

  def current_user?
    @current_user == nil ? false : true
  end
end

# what does this do?
# before do
#   session[:cart] ||= []
#   @errors ||= []
#   @current_user = User.find_by(:id => session[:user_id])
# end

get "/" do
  erb :index
end

# get "/users" do
#   if current_user?
#     erb :profile
#   else
#     redirect('/login')
#   end
# end

# get "/products" do
#   @products = Product.all
#   erb :products
# end

get "/zings" do
  erb :zing
end

# post "/cart/products" do
#   product = Product.find_by(:id => params[:product_id])
#   if product
#     session[:cart] << product.product_name
#   end
#   redirect('/cart')
# end

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

