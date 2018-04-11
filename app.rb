require 'sinatra'
require 'shotgun'
require 'sinatra/activerecord'
require 'sinatra/flash'

enable :sessions
set :database, "sqlite3:tastydatabase.sqlite3"
require './models.rb'

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
end
end

post '/update_blog' do
redirect '/update_blog_page'
end

get '/update_blog_page' do
@blogs = Blog.all
erb :Edit_blogPost
end

post '/editpost' do
redirect '/MyProfile'
end	

post '/update_info' do
redirect '/update_info'
end

get '/update_info' do
@users = User.all

erb :Edit_infoForm
end

before do
	current_user
end

get '/Homepage' do

erb :Homepage
end

get '/Newsfeed' do
	puts current_user 
	@users = User.all
	@blogpost = Blog.all

	erb :Personal_Homepage
end

get '/MyProfile' do
	puts current_user
	@blogpost = Blog.all
	erb :User_Profile
end

get '/UserProfile/id' do
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
	

	session[:user_id] = User.last.id
	redirect '/Newsfeed'

	# @user = User.where(uname: params[:uname]).first
 #    puts "aaaaaaaaaaaaaaaaaaaaaaa"
 #    puts @user.uname
 #    puts "aaaaaaaaaaaaaaaaaaaaaaa"

 #    if @user.password == params[:password]
        
 #        # flash[:notice] = "Success!"
 #        redirect '/Newsfeed'
 #    else
 #        flash[:notice] = "FAILED LOGIN :("
 #        redirect '/Homepage'
 #    end

	
	end

# post '/user/signin' do
    
#     puts params.to_s
# 	params[:username]
# 	params[:password]
# end

post '/create_message' do
Blog.create(params[:create])
redirect '/Newsfeed'
end

post '/sign-out' do
 session[:user_id] = nil
   redirect '/Homepage'
 end

put '/update_blog' do
# edit_blog = 
end
 
put '/update_profile' do

edit_profile = @current_user
edit_profile.uname = params[:uname]
edit_profile.fname = params[:fname]
edit_profile.lname = params[:lname]
edit_profile.city = params[:city]
edit_profile.email = params[:email]
edit_profile.password = params[:password]
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
        redirect '/Homepage'
    end
end


