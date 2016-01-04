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

# QUESTIONS VOTES UP
post "/upvote/:id" do

	voting = Qvote.find_by(user_id: current_user, question_id: params[:question_id])

	if voting.nil?
		q = Qvote.create(upvote: 1, question_id: params[:question_id], user: current_user)
		redirect "/questions/#{q.question_id}"
	elsif voting.upvote == 0 || voting.upvote == nil
		voting.upvote = 1
		voting.downvote = 0
		voting.save
		redirect "/questions/#{voting.question_id}"	
	elsif voting.upvote == 1
		voting.upvote = 0
		voting.save
		redirect "/questions/#{voting.question_id}"	
	end
end

# QUESTIONS VOTES DOWN

post "/downvote/:id" do

	voting = Qvote.find_by(user_id: current_user, question_id: params[:question_id])

	if voting.nil?
		q = Qvote.create(downvote: 1, question_id: params[:question_id], user: current_user)
		redirect "/questions/#{q.question_id}"

	elsif voting.downvote == 0 || voting.downvote == nil
		voting.downvote = 1
		voting.upvote = 0
		voting.save
		redirect "/questions/#{voting.question_id}"	
	elsif voting.downvote == 1 
		voting.downvote = 0
		voting.save
		redirect "/questions/#{voting.question_id}"	
	else
		puts "\e[31m[LOG: ] VOTING ERROR UNEXPECTED SITUATION"
		erb :"404"
	end
end

# ANSWERS VOTES UP
post "/upvote/:id/answer" do

	voting = Avote.find_by(user_id: current_user, answer_id: params[:answer_id])

	if voting.nil?
		a = Avote.create(upvote: 1, answer_id: params[:answer_id], user: current_user)
		redirect "/questions/#{a.answer_id}"
	elsif voting.upvote == 0 || voting.upvote == nil
		voting.upvote = 1
		voting.downvote = 0
		voting.save
		redirect "/questions/#{voting.answer_id}"	
	elsif voting.upvote == 1
		voting.upvote = 0
		voting.save
		redirect "/questions/#{voting.answer_id}"	
	end
end

# ANSWERS VOTES DOWN

post "/downvote/:id/answer" do

	voting = Avote.find_by(user_id: current_user, answer_id: params[:answer_id])

	if voting.nil?
		a = Avote.create(downvote: 1, answer_id: params[:answer_id], user: current_user)
		redirect "/questions/#{a.answer_id}"

	elsif voting.downvote == 0 || voting.downvote == nil
		voting.downvote = 1
		voting.upvote = 0
		voting.save
		redirect "/questions/#{voting.answer_id}"	
	elsif voting.downvote == 1 
		voting.downvote = 0
		voting.save
		redirect "/questions/#{voting.answer_id}"	
	else
		puts "\e[31m[LOG: ] VOTING ERROR UNEXPECTED SITUATION"
		erb :"404"
	end
end




