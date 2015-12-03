#DISPLAY QUESTION FORM
get '/questions/create' do
  erb :"question/create"
end

# CREATE QUESTION
post '/questions' do	
	@user = current_user
	question = current_user.questions.new(title: params[:title], body: params[:body])
  
  if question.save
		redirect "/users/#{current_user.id}"
	else
		@error = question.errors.full_messages
		erb :"question/create"
	end

end

# SHOW ALL QUESTION
get "/questions" do
	@questions = Question.all
	erb :"question/index"
end

# DISPLAY EDIT FORM - QUESTIONS
get "/questions/:id/edit" do
	@question = Question.find(params[:id])
	erb :"question/edit"
end

# EDIT QUESTION
patch "/questions/:id" do
	question = Question.find(params[:id])
	question.update(title: params[:title], body: params[:body])
	redirect "/users/#{current_user.id}"
end

#DELETE QUESTION'
delete "/questions/:id" do
	question = Question.find(params[:id])
	question.destroy
	redirect "/users/#{current_user.id}"
end

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
