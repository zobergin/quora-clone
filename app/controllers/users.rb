
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