require 'sinatra'
require 'shotgun'
require 'sinatra/activerecord'

set :database, "sqlite3:tastydatabase.sqlite3"
require './models.rb'

get '/Homepage' do
erb :Homepage
end

get '/Newsfeed' do
	@users = User.all
	erb :Personal_Homepage
end

get '/MyProfile' do
	@blogpost = Blog.all
	erb :User_Profile
end

get '/UserProfile/:id' do
	@user = User.find(params[:id])
	erb :Other_Users_Profile
end

post 'user/signup' do
	params.to_s
	end

post 'user/signin' do
	
	params.to_s
end
