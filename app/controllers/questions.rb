#DISPLAY QUESTION FORM
get '/questions/create' do
  erb :"question/create"
end

# CREATE QUESTION
post '/questions' do
	@user = current
	current_user.questions.create(title: params[:title], body: params[:body])
  redirect "/users/#{current_user.id}"
end

# SHOW ALL QUESTION
get "/questions" do
	@questions = Question.all
	erb :"question/index"
end


#EDIT QUESTION

#DELETE QUESTION'



# # DISPLAY A CREATE PROFILE FORM 
# get "/users/registration" do
# 	erb :"user/registration" 
# end

# # CREATE NEW USER
# post "/users" do
# 	user = User.new(name: params[:name], email: params[:email], password: params[:password])
# 	if user.save
# 		session[:user_id] = user.id
# 		redirect "/users/#{user.id}"

# 	else
# 		@errors = user.errors.full_messages
# 		erb :"user/registration"
# 	end
# end
