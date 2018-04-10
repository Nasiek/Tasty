require 'sinatra'
require 'shotgun'
require 'sinatra/activerecord'
enable :sessions
set :database, "sqlite3:tastydatabase.sqlite3"
require './models.rb'

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
end
end

get '/Homepage' do

erb :Homepage
end

get '/Newsfeed' do
	puts current_user 
	@users = User.all
	@blogpost = Blog.all

	erb :Pesrsonal_Homepage
end

get '/MyProfile' do
	@blogpost = Blog.all
	erb :User_Profile
end

get '/UserProfile/:id' do
	@user = User.find(params[:id])
	erb :Other_Users_Profile
end

post '/user/signup' do
	User.create(params[:user])
	params[:uname]
	params[:fname]
	params[:lname]
	params[:email]
	params[:city]
	params[:password]
	puts params.to_s
	end

# post '/user/signin' do
    
#     puts params.to_s
# 	params[:username]
# 	params[:password]
# end

post 'blog/post' do
Blog.create(params[:create])
params[:category]
params[:title]
params[:blogpost]
params[:user_id]
# @blogpost : Blog.create
end

post '/user/signin' do
    @user = User.where(uname: params[:uname]).first
    puts "aaaaaaaaaaaaaaaaaaaaaaa"
    puts @user.uname
    puts "aaaaaaaaaaaaaaaaaaaaaaa"

    if @user.password == params[:password]
        session[:user_id] = @user.id
        # flash[:notice] = "Success!"
        redirect '/Newsfeed'
    else
        flash[:notice] = "FAILED LOGIN :("
        redirect '/sign-in-failed'
    end
end


