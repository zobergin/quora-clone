
enable :sessions

get '/sessions/new' do
	erb :"static/login"
end

post '/sessions' do
  # apply an authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
	user= User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
	if user
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@message = "Error: Check email and password are correct"
		erb :"static/index"
	end
end


delete '/sessions/:id' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  if logged_in?
  	session[:user_id] = nil
  	@goodbye = "Thanks for visiting!"
  	redirect '/'
  end
end 
