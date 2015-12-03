

# DISPLAY A CREATE PROFILE FORM 
get "/users/registration" do
	erb :"user/registration" 
end

# CREATE NEW USER
post "/users" do
	user = User.new(name: params[:name], email: params[:email], password: params[:password])
	if user.save
		redirect "/users/#{user.id}"

	else
		@errors = user.errors.full_messages
		erb :"user/registration"
	end
end

# VIEW PROFILE
get "/users/:id" do
	@user = User.find(params[:id])
	erb :"user/profile"
end

#SHOW ALL USERS
get "/users" do
	@users = User.all
	erb :"user/index"
end

# DISPLAY USER UPDATE FORM
get "/users/:id/edit" do
	@user = User.find(params[:id])
	erb :"user/edit"
end

# UPDATE PROFILE
patch "/users/:id" do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password], description: params[:description])
	redirect "/users/#{user.id}"
end

# DELETE PROFILE
delete "/users/:id" do
	user = User.find(params[:id])
	user.destroy
	redirect "/"
end

# VIEW LOGIN PAGE
get "/users" do
	erb :"index"
end

# LOGIN DATA
post "/users/login" do
	user = User.find_by(email: params[:email], password: params[:password])
	session[:user_id] = user.id
	redirect "/users/#{user.id}"
end

# LOG OUT
delete "/logout" do
	session[:user_id] = nil
	redirect "/"
end
