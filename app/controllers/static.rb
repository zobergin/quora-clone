enable :sessions

###new
get '/' do
  erb :"static/index"
end

###new
get '/users/new' do
	erb :"static/signup"
end


###create
post '/users' do
	user = User.new(params[:user])
	if user.save
		redirect "/users/#{user.id}"
	else
		erb :"static/index"
	end
end

###show
get "/users/:id" do
	id = params[:id]
	@user = User.find(id)
	erb :"static/user_profile"
end


# post '/login' do
#   # apply an authentication method to check if a user has entered a valid email and password
#   # if a user has successfully been authenticated, you can assign the current user id to a session
# 	if	User.find_by(email: params[:name]).try(:authenticate, params[:password])
# 		redirect '/'
# 	end
# end

# post '/logout' do
#   # kill a session when a user chooses to logout, for example, assign nil to a session
#   # redirect to the appropriate page

# end
