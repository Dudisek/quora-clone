# VIEW LOGIN PAGE
get "/users/login" do

	unless params[:errors].nil?
		@errors = params[:errors]
	end
	erb :"user/login"
end

# LOGIN DATA
post "/users/login" do
	if user = User.find_by(email: params[:email])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/users/#{user.id}"
		else
			@errors = "password-not-match"
			redirect "/users/login?errors=#{@errors}"
		end
	else
		errors = "email-not-exist"
		redirect "/users/login?errors=#{errors}"
	end
end

# DISPLAY A CREATE PROFILE FORM 
get "/users/registration" do
	erb :"user/registration" 
end

# CREATE NEW USER
post "/users" do
	user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	if user.save
		session[:user_id] = user.id
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
	if current_user.id == @user.id
		erb :"user/edit"
	else
		erb :"404"
	end

end

# UPDATE PROFILE
patch "/users/:id" do
	user = User.find(params[:id])
	if current_user.id == user.id	
		user.update(name: params[:name], email: params[:email], password: params[:password], description: params[:description])
		user.save	
		redirect "/users/#{user.id}"
	else
		erb :"404"
	end
end

# DELETE PROFILE
delete "/users/:id" do
	user = User.find(params[:id])
	if current_user.id == user.id
		user.destroy
		redirect "/"
	else
		erb :"404"
	end
end

# LOG OUT
delete "/logout" do
	session[:user_id] = nil
	redirect "/"
end