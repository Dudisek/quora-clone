#DISPLAY QUESTION FORM
get '/questions/create' do
  erb :"question/create"
end

# CREATE QUESTION
post '/questions' do	
	@user = current_user
	question = current_user.questions.new(title: params[:title], body: params[:body])
  if question.save
		redirect "/questions/#{question.id}"
		# redirect "/users/#{current_user.id}"
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
		if @question.user_id == current_user.id
			erb :"question/edit"
		else
			erb :"404"
		end
end

# EDIT QUESTION
patch "/questions/:id" do
	question = Question.find(params[:id])
	question.update(title: params[:title], body: params[:body])
	redirect "/questions/#{question.id}"
	# ********ADD ERRROR if not save
end

#DELETE QUESTION'
delete "/questions/:id" do
	question = Question.find(params[:id])
	if current_user.id == question.user_id
		question.destroy
		redirect "/users/#{current_user.id}"
	else
		erb :"404"
	end
end

# VIEW QUESTION
get "/questions/:id" do
	@answers = Answer.all # PASSING ANSWERS TO DISPLAY
	@question = Question.find(params[:id])
	erb :"question/view"
end

# VOTES UP
# VOTES DOWN



