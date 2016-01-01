#DISPLAY QUESTION FORM
# get '/answers/add' do
#   erb :"answer/add"
# end

# ADD ANSWER
post '/answers' do	
	# @user = current_user
	@answer = current_user.answers.new(comment: params[:comment], question_id: params[:question_id])
  if @answer.save
		redirect "/questions/#{@answer.question_id}"
		# redirect "/q/#{current_user.id}"
	else
		@error = "Please type your answer first."
		redirect "/questions/#{@answer.question_id}?errors=#{@error}"
	end
		# /users/login?errors=#{@errors}
end




# ANSWERS VOTES UP
post "/questions/:question_id/answer/:answer_id/upvote" do

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

post "/questions/:question_id/answer/:answer_id/downvote" do

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