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

#############
post '/update_blog' do
redirect '/update_blog_page'
end

#############
get '/update_blog_page/:blog_id' do
# if @blog.user_id == @current_user.id
# @blogposts = Blog.where(user_id: current_user.id)
@blog = Blog.find(params[:blog_id])
erb :Edit_blogPost
end


#############
put '/update_blog/:blog_id' do
@blog = Blog.find(params[:blog_id])
@blog.update_attributes(params[:create])
redirect '/MyProfile'
end	

#############
post '/update_info/current_user' do
redirect '/update_info/current_user'
end

#################
get '/update_info/current_user' do
# @user = @current_user
# @user.find(params[:update])
#@user = User.find(params[:id])
#@user.params[:update]

erb :Edit_infoForm
end


###
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
	@blogposts = Blog.where(user_id: @current_user.id)
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

#########
post '/create_message' do
Blog.create(params[:create])
redirect '/Newsfeed'
end
#########
post '/sign-out' do
 session[:user_id] = nil
   redirect '/Homepage'
 end




##### 
put '/update_info' do
edit_profile = @current_user
edit_profile.uname = params[:uname]
edit_profile.fname = params[:fname]
edit_profile.lname = params[:lname]
edit_profile.city = params[:city]
edit_profile.email = params[:email]
edit_profile.password = params[:password]
redirect '/MyProfile'
end

post '/delete_post' do
@blogpost = Blog.destroy(blogpost)
redirect '/MyProfile'
end

post '/delete_profile' do
session[:user_id] = nil
@user = User.destroy(current_user.id)
redirect '/Homepage'
end

#########

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
