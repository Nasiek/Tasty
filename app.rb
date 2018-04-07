require 'sinatra'
require 'shotgun'
require 'sinatra/activerecord'

set :database, "sqlite3:tastydatabase.sqlite3"
require './models.rb'

get '/Homepage' do
erb :Homepage
end

get '/Personal_Homepage' do
	@users = User.all
	erb :Personal_Homepage
end

get '/User_Profile' do
	@blogpost = Blog.all
	erb :User_Profile
end

get '/Other_Users_Profile' do
	
	erb :Other_Users_Profile
end
