# DISPLAY A CREATE PROFILE FORM 
get "/users/new" do
	erb :"user/new" 
end

# CREATE NEW USER
post "/users" do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end

# VIEW PROFILE
get "/users/:id" do
	@user = User.find(params[:id])
	erb :"user/show"
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
get "/users/" do
	erb :"user/index"
end

# LOGIN DATA
post "/users/login" do
	user = User.find_by(email: params[:email], password: params[password])
	[session[:user_id] = user.id]
	redirect "/users/#{user.id}"
end

# LOG OUT